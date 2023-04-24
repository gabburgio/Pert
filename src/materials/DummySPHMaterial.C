/*#include "DummySPHMaterial.h"

registerMooseObject("pertApp",DummySPHMaterial);

InputParameters
DummySPHMaterial::validParams()
{
    InputParameters params = Material::validParams();
    
    params.addRequiredParam<RealEigenVector>("ref_diffusivity","Serpent 2 diffusion coefficient for each energy group in this material (used as starting value in the iteration)");
    params.addRequiredParam<RealEigenVector>("ref_sigma_r","Serpent 2 removal cross section for each energy group in this material");
    
    params.addRequiredParam<RealEigenVector>("ref_phi_mg","reference flux integrated over the material region");
    params.addRequiredParam<PostprocessorName>("zone_integrator","ElementIntegralArrayVariablePostprocessor to calculate the flux integral over the material zone");   
    
    
    return params;
}

DummySPHMaterial::DummySPHMaterial(const InputParameters & parameters) :
    Material(parameters),
    _v_diffusivity(     getParam<RealEigenVector>("ref_diffusivity")),
    _v_sigma_r(         getParam<RealEigenVector>("ref_sigma_r")),
    _v_ref_phi_mg(  getParam<RealEigenVector>("ref_phi_mg")),
    _zone_integrator(getPostprocessorValueByName("zone_integrator")),


    _diffusivity(       declareProperty<RealEigenVector>("Dummy_diffusivity")),
    _sigma_r(           declareProperty<RealEigenVector>("Dummy_sigma_r"))

{
}


void
DummySPHMaterial::computeQpProperties()
{

    //auto& _zone_integrator = zone_integrator_value.get<Real>(); 

    for(int i=0; i< _v_diffusivity.size(); i++ ) 
    {
    //_zone_integrator.setParameters("component",i); 
    _diffusivity[_qp][i]    = (_v_ref_phi_mg[i]/_zone_integrator)*_v_diffusivity[i];
    _sigma_r[_qp][i]           = (_v_ref_phi_mg[i]/_zone_integrator)*_v_sigma_r[i];
    }
}*/