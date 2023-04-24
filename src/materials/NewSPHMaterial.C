#include "NewSPHMaterial.h"
#include "FEProblem.h"
#include "NonlinearSystemBase.h"
#include "Adaptivity.h"
#include "Executioner.h"
#include "MooseEnum.h"
#include "MooseVariableFE.h"
#include "RelationshipManager.h"

registerMooseObject("pertApp",NewSPHMaterial);

InputParameters
NewSPHMaterial::validParams()
{
    InputParameters params = Material::validParams();
    
    params.addRequiredParam<std::vector<Real>>("ref_diffusivity","Serpent 2 diffusion coefficient for each energy group in this material (used as starting value in the iteration)");
    params.addRequiredParam<std::vector<Real>>("ref_sigma_r","Serpent 2 removal cross section for each energy group in this material");
    params.addRequiredParam<std::vector<VariableName>>("flux", "Name of the flux");
    
    params.addRequiredParam<std::vector<Real>>("ref_phi_mg","reference flux integrated over the material region");
    
    return params;
}

NewSPHMaterial::NewSPHMaterial(const InputParameters & parameters) :
    Material(parameters),
    _v_diffusivity(     getParam<std::vector<Real>>("ref_diffusivity")),
    _v_sigma_r(         getParam<std::vector<Real>>("ref_sigma_r")),
    _v_ref_phi_mg(  getParam<std::vector<Real>>("ref_phi_mg")),
    _flux(  getParam<std::vector<VariableName>>("flux")),

    _diffusivity(       declareProperty<std::vector<Real>>("Dummy_diffusivity")),
    _sigma_r(           declareProperty<std::vector<Real>>("Dummy_sigma_r"))

{
    InputParameters params = _factory.getValidParams("ElementIntegralArrayVariablePostprocessor");
    params.set<std::vector<VariableName>>("variable") = _flux;
    ElementIntegralArrayVariablePostprocessor integrator(params);
}


void
NewSPHMaterial::computeQpProperties()
{
    for(int i=0; i< _v_diffusivity.size(); i++ ) 
    { 
    _diffusivity[_qp][i]    = (_v_ref_phi_mg[i]/1)*_v_diffusivity[i];
    _sigma_r[_qp][i]           = (_v_ref_phi_mg[i]/1)*_v_sigma_r[i];
    }
}