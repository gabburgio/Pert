#include "SPHProblemAction.h"
#include "Factory.h"
#include "Parser.h"
#include "FEProblem.h"

registerMooseAction("pertApp", SPHProblemAction, "add_kernel");

InputParameters
SPHProblemAction::validParams()
{
  InputParameters params = Action::validParams();
    params.addRequiredParam<unsigned int>("group_number", "The number of diffusion groups"); 
    params.addRequiredParam<std::vector<BoundaryName>>("vacuum_boundaries", "The boundaries on which to apply vacuum BCs");
    //params.addRequiredParam<std::string>("flux_name", "The name of the flux array variable");


  return params;
}

SPHProblemAction::SPHProblemAction(const InputParameters & params)
  : Action(params),
  _group_number(    getParam<unsigned int>("group_number"))
  //_flux_name(getParam<std::string>("flux_name")),

{
}

void
SPHProblemAction::act()
{
/*

    //Add variable
  {
      InputParameters params = _factory.getValidParams("ArrayMooseVariable");
        params.set<unsigned int>("components") = getParam<unsigned int>("group_number"); 
    _problem->addVariable("ArrayMooseVariable", "flux", params);
  }
   

    //Add kernels
  {
      InputParameters params = _factory.getValidParams("ArrayDiffusion");
        params.set<NonlinearVariableName>("variable") = "flux";
        params.set<MaterialPropertyName>("diffusion_coefficient")= "Dummy_diffusivity";
    _problem->addKernel("ArrayDiffusion", "FluxKernel", params);

    params = _factory.getValidParams("ArrayReaction");
    params.set<NonlinearVariableName>("variable") = "flux";
    params.set<MaterialPropertyName>("reaction_coefficient")= "Dummy_sigma_r";
    _problem->addKernel("ArrayReaction", "ReactionKernel", params);

  }


    //Add BCs
  {
      InputParameters params = _factory.getValidParams("ArrayVacuumBC");
        params.set<std::vector<BoundaryName>>("boundary") = getParam<std::vector<BoundaryName>>("vacuum_boundaries");
        params.set<NonlinearVariableName>("variable") = "flux";;
    _problem->addBoundaryCondition("ArrayVacuumBC", "FluxVacuumBCs", params);
  }


    //Add integrators
 {

    InputParameters params = _factory.getValidParams("ElementIntegralArrayVariablePostprocessor");
    params.set<NonlinearVariableName>("variable") = getParam<NonlinearVariableName>("flux");
    params.set<ExecFlagEnum>("execute_on") = "LINEAR";

    for(int i=0; i< _group_number; ++i)
    {
    params.set<unsigned int>("component") = i;
    std::string postprocessor_name = "flux_integrator_" + std::to_string(i);
    flux_integrators.push_back(postprocessor_name);
    _problem->addPostprocessor("ElementIntegralArrayVariablePostprocessor", postprocessor_name, params);
    }

  } 
*/


}
