#include "NewSPHMaterial.h"



registerMooseObject("pertApp",NewSPHMaterial);

InputParameters
NewSPHMaterial::validParams()
{
    InputParameters params = Material::validParams();
    
    params.addRequiredParam<RealEigenVector>("ref_diffusivity","Serpent 2 diffusion coefficient for each energy group in this material (used as starting value in the iteration)");
    params.addRequiredParam<RealEigenVector>("ref_sigma_r","Serpent 2 removal cross section for each energy group in this material");
    params.addRequiredParam<RealEigenVector>("ref_phi_mg","reference flux integrated over the material region");


    //pp params

    params.addRequiredParam<std::vector<PostprocessorName>>(
      "flux_integrators",
      "The name of the postprocessors that hold the value of the material zone flux integral");

    return params;
}

NewSPHMaterial::NewSPHMaterial(const InputParameters & parameters) :
    Material(parameters),
    _v_diffusivity(     getParam<RealEigenVector>("ref_diffusivity")),
    _v_sigma_r(         getParam<RealEigenVector>("ref_sigma_r")),
    _v_ref_phi_mg(  getParam<RealEigenVector>("ref_phi_mg")),

    _diffusivity(       declareProperty<RealEigenVector>("Dummy_diffusivity")),
    _sigma_r(           declareProperty<RealEigenVector>("Dummy_sigma_r")),



    //pp inits

    _flux_integrators(  getParam<std::vector<PostprocessorName>>("flux_integrators"))
    
{
}


void
NewSPHMaterial::computeQpProperties()
{

_diffusivity[_qp].resize(_v_diffusivity.size());
_sigma_r[_qp].resize(_v_sigma_r.size());

// Iterate over _flux_integrators vector
for(int i=0; i< _v_diffusivity.size(); i++ ) 
{ 
    

    double flux_integrator = getPostprocessorValueByName(_flux_integrators[i]);

    // Check if flux_integrator is nonzero
    if (flux_integrator != 0) 
    {

        // Compute and store the diffusivity and sigma_r values
        _diffusivity[_qp][i] = (_v_ref_phi_mg[i]/flux_integrator)*_v_diffusivity[i];
        _sigma_r[_qp][i] = (_v_ref_phi_mg[i]/flux_integrator)*_v_sigma_r[i];
    }
    else 
    {
        // If flux_integrator is zero, set the diffusivity to the corresponding value in _v_diffusivity
        _diffusivity[_qp][i] = _v_diffusivity[i];
        _sigma_r[_qp][i] = _v_sigma_r[i];
    }
}

}


