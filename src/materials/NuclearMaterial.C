#include "NuclearMaterial.h"

registerMooseObject("pertApp",NuclearMaterial);

InputParameters
NuclearMaterial::validParams()
{
    InputParameters params = Material::validParams();
    
    params.addRequiredParam<RealEigenVector>("diffusivity","Diffusion coefficient for each energy group in this material");
    params.addRequiredParam<RealEigenVector>("sigma_r","Total cross section for each energy group in this material");
    params.addRequiredParam<RealEigenVector>("nu_sigma_f","Fission cross section (multiplied by nubar) for each energy group in this material");
    params.addRequiredParam<RealEigenVector>("chi","Fission yield for each energy group in this material");
    
    params.addRequiredParam<RealEigenMatrix>("sigma_s","Scattering matrix for this material, given as tensor");
    
    
    return params;
}

NuclearMaterial::NuclearMaterial(const InputParameters & parameters) :
    Material(parameters),
    _v_diffusivity(     getParam<RealEigenVector>("diffusivity")),
    _v_sigma_r(         getParam<RealEigenVector>("sigma_r")),
    _v_nu_sigma_f(      getParam<RealEigenVector>("nu_sigma_f")),
    _v_chi(             getParam<RealEigenVector>("chi")),
    _v_sigma_s(         getParam<RealEigenMatrix>("sigma_s")),

    _diffusivity(       declareProperty<RealEigenVector>("diffusivity")),
    _sigma_r(           declareProperty<RealEigenVector>("sigma_r")),
    _sigma_s(           declareProperty<RealEigenMatrix>("sigma_s")),
    _chi_nu_sigma_f(    declareProperty<RealEigenMatrix>("chi_nu_sigma_f"))
{
    
}


void NuclearMaterial::computeQpProperties()
{
    _diffusivity[_qp]       = _v_diffusivity;
    _sigma_r[_qp]           = _v_sigma_r;
    _sigma_s[_qp]           = - _v_sigma_s;
    _chi_nu_sigma_f[_qp]    = - _v_chi * _v_nu_sigma_f.transpose();
    
}