#include "NuclearMaterial.h"

registerMooseObject("pertApp",NuclearMaterial);

InputParameters
NuclearMaterial::validParams()
{
    InputParameters params = Material::validParams();
    
    params.addRequiredParam<RealEigenVector>("diffusivity","Diffusion coefficient for each energy group in this material");
    params.addRequiredParam<RealEigenVector>("sigma_t","Total cross section for each energy group in this material");
    params.addRequiredParam<RealEigenVector>("nu_sigma_f","Fission cross section (multiplied by nubar) for each energy group in this material");
    params.addRequiredParam<RealEigenVector>("chi","Fission yield for each energy group in this material");
    
    params.addRequiredParam<RealEigenMatrix>("sigma_s","Scattering matrix for this material, given as tensor");
    
    //params.set<MooseEnum>("constant_on") = "SUBDOMAIN";
    
    return params;
}

NuclearMaterial::NuclearMaterial(const InputParameters & parameters) :
    Material(parameters),
    _v_diffusivity(     getParam<RealEigenVector>("diffusivity")),
    _v_sigma_t(         getParam<RealEigenVector>("sigma_t")),
    _v_nu_sigma_f(      getParam<RealEigenVector>("nu_sigma_f")),
    _v_chi(             getParam<RealEigenVector>("chi")),
    _v_sigma_s(         getParam<RealEigenMatrix>("sigma_s")),
    _sphdf_diffusivity(       declareProperty<RealEigenVector>("sphdf_diffusivity")),
    _sphdf_sigma_r(           declareProperty<RealEigenVector>("sphdf_sigma_r")),
    _sphdf_nu_sigma_f(        declareProperty<RealEigenVector>("sphdf_nu_sigma_f")),
    _chi(               declareProperty<RealEigenVector>("_chi")),
    _sphdf_sigma_s(           declareProperty<RealEigenMatrix>("sphdf_sigma_s")),
    _sphdf_chi_nu_sigma_f(    declareProperty<RealEigenMatrix>("sphdf_chi_nu_sigma_f"))
{
    
}


void
NuclearMaterial::computeQpProperties()
{
    _sphdf_diffusivity[_qp]       = _v_diffusivity;
    _sphdf_sigma_r[_qp]           = _v_sigma_t;
    _sphdf_nu_sigma_f[_qp]        = _v_nu_sigma_f;
    _chi[_qp]               = _v_chi;
    _sphdf_sigma_s[_qp]           = _v_sigma_s;
    _sphdf_chi_nu_sigma_f[_qp]    = _v_chi * _v_nu_sigma_f.transpose();
    
}