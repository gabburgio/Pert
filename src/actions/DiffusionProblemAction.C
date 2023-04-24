#include "DiffusionProblemAction.h"
#include "Factory.h"
#include "Parser.h"
#include "FEProblem.h"

registerMooseAction("pertApp", DiffusionProblemAction, "add_kernel");

InputParameters
DiffusionProblemAction::validParams()
{
  InputParameters params = Action::validParams();
    params.addRequiredParam<unsigned int>("group_number", "The number of discrete ordinates"); 
    params.addRequiredParam<std::vector<BoundaryName>>("vacuum_boundaries", "The boundaries on which to apply vacuum BCs");

  return params;
}

DiffusionProblemAction::DiffusionProblemAction(const InputParameters & params)
  : Action(params)
{
}

void
DiffusionProblemAction::act()
{


    //Add variable
  {
      InputParameters params = _factory.getValidParams("ArrayMooseVariable");
        params.set<unsigned int>("components") = getParam<unsigned int>("group_number"); 
    _problem->addVariable("ArrayMooseVariable", "flux", params);
  }
   

    //Add kernel
  {
      InputParameters params = _factory.getValidParams("ArrayDiffusion");
        params.set<NonlinearVariableName>("variable") = "flux";
        params.set<MaterialPropertyName>("diffusion_coefficient")= "coefficiente_diff";
    _problem->addKernel("ArrayDiffusion", "FluxKernel", params);
  }


    //Add BCs
  {
      InputParameters params = _factory.getValidParams("ArrayVacuumBC");
        params.set<std::vector<BoundaryName>>("boundary") = getParam<std::vector<BoundaryName>>("vacuum_boundaries");
        params.set<NonlinearVariableName>("variable") = "flux";;
    _problem->addBoundaryCondition("ArrayVacuumBC", "FluxVacuumBCs", params);
  }



}
