#include "SolutionUserObject.h"

// MOOSE includes
#include "ConsoleUtils.h"
#include "MooseError.h"
#include "MooseMesh.h"
#include "MooseUtils.h"
#include "MooseVariableFE.h"
#include "RotationMatrix.h"

// libMesh includes
#include "libmesh/equation_systems.h"
#include "libmesh/mesh_function.h"
#include "libmesh/numeric_vector.h"
#include "libmesh/nonlinear_implicit_system.h"
#include "libmesh/transient_system.h"
#include "libmesh/parallel_mesh.h"
#include "libmesh/serial_mesh.h"
#include "libmesh/exodusII_io.h"
#include "libmesh/exodusII_io_helper.h"
#include "libmesh/enum_xdr_mode.h"



registerMooseObject("MooseApp", SolutionUserObject);


InputParameters
SolutionUserObject::validParams()
{
  // Get the input parameters from the parent class
  InputParameters params = GeneralUserObject::validParams();


  params.addRequiredParam<MeshFileName>(
      "mesh", "The name of the mesh file (must be of exodusII type for now).");
  params.addParam<std::vector<std::string>>(
      "system_variables",
      std::vector<std::string>(),
      "The name of the nodal and elemental variables from the file you want to use for values");

  // When using ExodusII a specific time is extracted
  params.addParam<std::string>("timestep",
                               "Index of the single timestep used or \"LATEST\" for "
                               "the last timestep (exodusII only).  If not supplied, "
                               "time interpolation will occur.");

  params.addClassDescription("Reads an array variable from a mesh in one simulation to another");
  return params;
}

// Static mutex definition
Threads::spin_mutex SolutionUserObject::_solution_user_object_mutex;

SolutionUserObject::SolutionUserObject(const InputParameters & parameters)
  : GeneralUserObject(parameters),
    _mesh_file(getParam<MeshFileName>("mesh")),
    _system_variables(getParam<std::vector<std::string>>("system_variables")),
    _exodus_time_index(-1),
    _system(nullptr),
    _system2(nullptr),
    _initialized(false)
{
}

SolutionUserObject::~SolutionUserObject() {}

void
SolutionUserObject::readExodusII()
{
  // Define a default system name
  if (_system_name == "")
    _system_name = "SolutionUserObjectSystem";

  // Read the Exodus file
  _exodusII_io = std::make_unique<ExodusII_IO>(*_mesh);
  _exodusII_io->read(_mesh_file);
  readBlockIdMapFromExodusII();
  _exodus_times = &_exodusII_io->get_time_steps();

  if (isParamValid("timestep"))
  {
    std::string s_timestep = getParam<std::string>("timestep");
    int n_steps = _exodusII_io->get_num_time_steps();
    if (s_timestep == "LATEST")
      _exodus_time_index = n_steps;
    else
    {
      std::istringstream ss(s_timestep);
      if (!((ss >> _exodus_time_index) && ss.eof()) || _exodus_time_index > n_steps)
        mooseError("Invalid value passed as \"timestep\". Expected \"LATEST\" or a valid integer "
                   "less than ",
                   n_steps,
                   ", received ",
                   s_timestep);
    }
  }
  else
    // Interpolate between times rather than using values from a set timestep
    _interpolate_times = true;

  // Check that the number of time steps is valid
  int num_exo_times = _exodus_times->size();
  if (num_exo_times == 0)
    mooseError("In SolutionUserObject, exodus file contains no timesteps.");

  // Account for parallel mesh
  if (dynamic_cast<DistributedMesh *>(_mesh.get()))
  {
    _mesh->allow_renumbering(true);
    _mesh->prepare_for_use();
  }
  else
  {
    _mesh->allow_renumbering(false);
    _mesh->prepare_for_use();
  }

  // Create EquationSystems object for solution
  _es = std::make_unique<EquationSystems>(*_mesh);
  _es->add_system<ExplicitSystem>(_system_name);
  _system = &_es->get_system(_system_name);

  // Get the variable name lists as set; these need to be sets to perform set_intersection
  const std::vector<std::string> & all_nodal(_exodusII_io->get_nodal_var_names());
  const std::vector<std::string> & all_elemental(_exodusII_io->get_elem_var_names());
  const std::vector<std::string> & all_scalar(_exodusII_io->get_global_var_names());

  // Build nodal/elemental variable lists, limit to variables listed in 'system_variables', if
  // provided
  // This function could be called more than once, so clear the member variables so we don't keep
  // adding to the vectors
  _nodal_variables.clear();
  _elemental_variables.clear();
  _scalar_variables.clear();
  if (!_system_variables.empty())
  {
    for (const auto & var_name : _system_variables)
    {
      if (std::find(all_nodal.begin(), all_nodal.end(), var_name) != all_nodal.end())
        _nodal_variables.push_back(var_name);
      if (std::find(all_elemental.begin(), all_elemental.end(), var_name) != all_elemental.end())
        _elemental_variables.push_back(var_name);
      if (std::find(all_scalar.begin(), all_scalar.end(), var_name) != all_scalar.end())
        // Check if the scalar matches any field variables, and ignore the var if it does. This
        // means its a Postprocessor.
        if (std::find(begin(_nodal_variables), end(_nodal_variables), var_name) ==
                _nodal_variables.end() &&
            std::find(begin(_elemental_variables), end(_elemental_variables), var_name) ==
                _elemental_variables.end())
          _scalar_variables.push_back(var_name);
    }
  }
  else
  {
    _nodal_variables = all_nodal;
    _elemental_variables = all_elemental;

    for (auto var_name : all_scalar)
      // Check if the scalar matches any field variables, and ignore the var if it does. This means
      // its a Postprocessor.
      if (std::find(begin(_nodal_variables), end(_nodal_variables), var_name) ==
              _nodal_variables.end() &&
          std::find(begin(_elemental_variables), end(_elemental_variables), var_name) ==
              _elemental_variables.end())
        _scalar_variables.push_back(var_name);
  }

  // Add the variables to the system
  for (const auto & var_name : _nodal_variables)
    _system->add_variable(var_name, FIRST);

  for (const auto & var_name : _elemental_variables)
    _system->add_variable(var_name, CONSTANT, MONOMIAL);

  for (const auto & var_name : _scalar_variables)
    _system->add_variable(var_name, FIRST, SCALAR);

  // Initialize the equations systems
  _es->init();

  // Interpolate times
  if (_interpolate_times)
  {
    // Create a second equation system
    _es2 = std::make_unique<EquationSystems>(*_mesh);
    _es2->add_system<ExplicitSystem>(_system_name);
    _system2 = &_es2->get_system(_system_name);

    // Add the variables to the system
    for (const auto & var_name : _nodal_variables)
      _system2->add_variable(var_name, FIRST);

    for (const auto & var_name : _elemental_variables)
      _system2->add_variable(var_name, CONSTANT, MONOMIAL);

    for (const auto & var_name : _scalar_variables)
      _system2->add_variable(var_name, FIRST, SCALAR);

    // Initialize
    _es2->init();

    // Update the times for interpolation (initially start at 0)
    updateExodusBracketingTimeIndices(0.0);

    // Copy the solutions from the first system
    for (const auto & var_name : _nodal_variables)
    {
      _exodusII_io->copy_nodal_solution(*_system, var_name, var_name, _exodus_index1 + 1);
      _exodusII_io->copy_nodal_solution(*_system2, var_name, var_name, _exodus_index2 + 1);
    }

    for (const auto & var_name : _elemental_variables)
    {
      _exodusII_io->copy_elemental_solution(*_system, var_name, var_name, _exodus_index1 + 1);
      _exodusII_io->copy_elemental_solution(*_system2, var_name, var_name, _exodus_index2 + 1);
    }

    if (_scalar_variables.size() > 0)
    {
      _exodusII_io->copy_scalar_solution(
          *_system, _scalar_variables, _scalar_variables, _exodus_index1 + 1);
      _exodusII_io->copy_scalar_solution(
          *_system2, _scalar_variables, _scalar_variables, _exodus_index2 + 1);
    }

    // Update the systems
    _system->update();
    _es->update();
    _system2->update();
    _es2->update();
  }

  // Non-interpolated times
  else
  {
    if (_exodus_time_index > num_exo_times)
      mooseError("In SolutionUserObject, timestep = ",
                 _exodus_time_index,
                 ", but there are only ",
                 num_exo_times,
                 " time steps.");

    // Copy the values from the ExodusII file
    for (const auto & var_name : _nodal_variables)
      _exodusII_io->copy_nodal_solution(*_system, var_name, var_name, _exodus_time_index);

    for (const auto & var_name : _elemental_variables)
      _exodusII_io->copy_elemental_solution(*_system, var_name, var_name, _exodus_time_index);

    if (!_scalar_variables.empty())
      _exodusII_io->copy_scalar_solution(
          *_system, _scalar_variables, _scalar_variables, _exodus_time_index);

    // Update the equations systems
    _system->update();
    _es->update();
  }
}

 


void
SolutionUserObject::initialize()
{
}

void
SolutionUserObject::finalize()
{
}

void
SolutionUserObject::timestepSetup()
{
  // Update time interpolation for ExodusII solution
  if (_file_type == 1 && _interpolate_times)
    updateExodusTimeInterpolation(_t);
}

void
SolutionUserObject::execute()
{
}


void
SolutionUserObject::initialSetup()
{

  // Make sure this only happens once
  if (_initialized)
    return;

  // Create a libmesh::Mesh object for storing the loaded data.
  // Several aspects of SolutionUserObject won't work with a DistributedMesh:
  // .) ExodusII_IO::copy_nodal_solution() doesn't work in parallel.
  // .) We don't know if directValue will be used, which may request
  //    a value on a Node we don't have.
  // We force the Mesh used here to be a ReplicatedMesh.
  _mesh = std::make_unique<ReplicatedMesh>(_communicator);

  // ExodusII mesh file supplied
  if (MooseUtils::hasExtension(_mesh_file, "e", /*strip_exodus_ext =*/true) ||
      MooseUtils::hasExtension(_mesh_file, "exo", true))
  {
    _file_type = "exodusII";
    readExodusII();
  }

  // Produce an error for an unknown file type
  else
    mooseError("In SolutionUserObject, invalid file type: .exo and .e supported");

  // Initialize the serial solution vector
  _serialized_solution = NumericVector<Number>::build(_communicator);
  _serialized_solution->init(_system->n_dofs(), false, SERIAL);

  // Pull down a full copy of this vector on every processor so we can get values in parallel
  _system->solution->localize(*_serialized_solution);

  // Vector of variable numbers to apply the MeshFunction to
  std::vector<unsigned int> var_nums;

  // If no variables were given, use all of them
  if (_system_variables.empty())
  {
    _system->get_all_variable_numbers(var_nums);
    for (const auto & var_num : var_nums)
      _system_variables.push_back(_system->variable_name(var_num));
  }

  // Otherwise, gather the numbers for the variables given
  else
  {
    for (const auto & var_name : _system_variables)
      var_nums.push_back(_system->variable_number(var_name));
  }

  // Create the MeshFunction for working with the solution data
  _mesh_function =
      std::make_unique<MeshFunction>(*_es, *_serialized_solution, _system->get_dof_map(), var_nums);
  _mesh_function->init();

  // Tell the MeshFunctions that we might be querying them outside the
  // mesh, so we can handle any errors at the MOOSE rather than at the
  // libMesh level.
  DenseVector<Number> default_values;
  _mesh_function->enable_out_of_mesh_mode(default_values);

  // Build second MeshFunction for interpolation
  if (_interpolate_times)
  {
    // Need to pull down a full copy of this vector on every processor so we can get values in
    // parallel
    _serialized_solution2 = NumericVector<Number>::build(_communicator);
    _serialized_solution2->init(_system2->n_dofs(), false, SERIAL);
    _system2->solution->localize(*_serialized_solution2);

    // Create the MeshFunction for the second copy of the data
    _mesh_function2 = std::make_unique<MeshFunction>(
        *_es2, *_serialized_solution2, _system2->get_dof_map(), var_nums);
    _mesh_function2->init();
    _mesh_function2->enable_out_of_mesh_mode(default_values);
  }

  // Populate the MeshFunction variable index
  for (unsigned int i = 0; i < _system_variables.size(); ++i)
  {
    std::string name = _system_variables[i];
    _local_variable_index[name] = i;
  }

  // Set initialization flag
  _initialized = true;
}




unsigned int
SolutionUserObject::getLocalVarIndex(const std::string & var_name) const
{
  // Extract the variable index for the MeshFunction(s)
  std::map<std::string, unsigned int>::const_iterator it = _local_variable_index.find(var_name);
  if (it == _local_variable_index.end())
    mooseError("Value requested for nonexistent variable '",
               var_name,
               "' in the '",
               name(),
               "' SolutionUserObject.\nSystem selected: ",
               _system_name,
               "\nAvailable variables:\n",
               ConsoleUtils::formatString(Moose::stringify(_system_variables), ""));
  return it->second;
}
