#include "SPHMaterial.h"

registerMooseObject("pertApp",SPHMaterial);

InputParameters
SPHMaterial::validParams()
{
    InputParameters params = Material::validParams();
    
    params.addRequiredParam<RealEigenVector>("ref_diffusivity","Serpent 2 diffusion coefficient for each energy group in this material (used as starting value in the iteration)");
    params.addRequiredParam<RealEigenVector>("ref_sigma_r","Serpent 2 removal cross section for each energy group in this material");
    params.addRequiredParam<RealEigenVector>("ref_nu_sigma_f","Fission cross section (multiplied by nubar) for each energy group in this material");
    params.addRequiredParam<RealEigenVector>("chi","Fission yield for each energy group in this material");  
    params.addRequiredParam<Real>("ref_k","reference keff from Serpent 2");    
    params.addRequiredParam<RealEigenMatrix>("ref_sigma_s","Scattering matrix for this material, given as tensor");
    
    params.addRequiredParam<RealEigenVector>("ref_phi_mg","reference flux integrated over the material region");
    params.addRequiredParam<PostprocessorName>("zone_integrator","ElementIntegralArrayVariablePostprocessor to calculate the flux integral over the material zone");   
    
    // params.set<MooseEnum>("constant_on") = "SUBDOMAIN";
    
    return params;
}

SPHMaterial::SPHMaterial(const InputParameters & parameters) :
    Material(parameters),
    _v_diffusivity(     getParam<RealEigenVector>("ref_diffusivity")),
    _v_sigma_r(         getParam<RealEigenVector>("ref_sigma_r")),
    _v_nu_sigma_f(      getParam<RealEigenVector>("ref_nu_sigma_f")),
    _v_chi(             getParam<RealEigenVector>("chi")),
    _v_sigma_s(         getParam<RealEigenMatrix>("ref_sigma_s")),
    _v_ref_phi_mg(  getParam<RealEigenVector>("ref_phi_mg")),


    _diffusivity(       declareProperty<RealEigenVector>("sph_diffusivity")),
    _sigma_r(           declareProperty<RealEigenVector>("sph_sigma_r")),
    _nu_sigma_f(        declareProperty<RealEigenVector>("sph_nu_sigma_f")),
    _chi(               declareProperty<RealEigenVector>("chi")),
    _sigma_s(           declareProperty<RealEigenMatrix>("sph_sigma_s")),
    _chi_nu_sigma_f(    declareProperty<RealEigenMatrix>("sph_chi_nu_sigma_f"))
{
}


void
SPHMaterial::computeQpProperties()
{


    for(int i=0; i< _v_diffusivity.size(); i++ ) 
    {
    _diffusivity[_qp][i]    = _v_ref_phi_mg[i]*_v_diffusivity[i];
    }
    _sigma_r[_qp]           = _v_sigma_r;
    _nu_sigma_f[_qp]        = _v_nu_sigma_f;
    _chi[_qp]               = _v_chi;
    _sigma_s[_qp]           = _v_sigma_s;
    _chi_nu_sigma_f[_qp]    = _v_chi * _v_nu_sigma_f.transpose();
    
}