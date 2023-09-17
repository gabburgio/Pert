#include "CorrectedNuclearMaterial.h"

registerMooseObject("pertApp",CorrectedNuclearMaterial);

InputParameters
CorrectedNuclearMaterial::validParams()
{
    InputParameters params = Material::validParams();
    
    params.addRequiredParam<RealEigenVector>("diffusivity","Diffusion coefficient for each energy group in this material");
    params.addRequiredParam<RealEigenVector>("sigma_r","Total cross section for each energy group in this material");
    params.addRequiredParam<RealEigenVector>("nu_sigma_f","Fission cross section (multiplied by nubar) for each energy group in this material");
    params.addRequiredParam<RealEigenVector>("chi","Fission yield for each energy group in this material");
    params.addRequiredParam<RealEigenVector>("sph_factors","____");
    params.addRequiredParam<RealEigenVector>("normalization_factors","___");    
    params.addRequiredParam<RealEigenMatrix>("sigma_s","Scattering matrix for this material, given as tensor");
    
    
    return params;
}

CorrectedNuclearMaterial::CorrectedNuclearMaterial(const InputParameters & parameters) :
    Material(parameters),
    _v_diffusivity(     getParam<RealEigenVector>("diffusivity")),
    _v_sigma_r(         getParam<RealEigenVector>("sigma_r")),
    _v_nu_sigma_f(      getParam<RealEigenVector>("nu_sigma_f")),
    _v_chi(             getParam<RealEigenVector>("chi")),
    _v_sigma_s(         getParam<RealEigenMatrix>("sigma_s")),
    _sph_factors(             getParam<RealEigenVector>("sph_factors")),
    _normalization_factors(   getParam<RealEigenVector>("normalization_factors")),

    _diffusivity(       declareProperty<RealEigenVector>("diffusivity")),
    _sigma_r(           declareProperty<RealEigenVector>("sigma_r")),
    _sigma_s(           declareProperty<RealEigenMatrix>("sigma_s")),
    _chi_nu_sigma_f(    declareProperty<RealEigenMatrix>("chi_nu_sigma_f"))
{
    RealEigenVector tilde_factors = _sph_factors.cwiseProduct(_normalization_factors);
    _v_diffusivity       = _v_diffusivity.cwiseProduct(tilde_factors);
    _v_sigma_r         = _v_sigma_r.cwiseProduct(tilde_factors);
    _v_chi_nu_sigma_f    = -(_v_chi*(_v_nu_sigma_f.cwiseProduct(_sph_factors).transpose()));


    for (int j =0;  j< _v_diffusivity.size(); j++)
    {
        _v_sigma_s.row(j)    = -_v_sigma_s.row(j).cwiseProduct(tilde_factors.transpose());
    }
    
}


void CorrectedNuclearMaterial::computeQpProperties()
{
    _diffusivity[_qp].resize(_v_diffusivity.size());
    _sigma_r[_qp].resize(_v_sigma_r.size());   
    _sigma_s[_qp].resize(_v_sigma_s.rows(), _v_sigma_s.cols());
    _chi_nu_sigma_f[_qp].resize(_v_sigma_s.rows(), _v_sigma_s.cols());

    _diffusivity[_qp]       = _v_diffusivity;
    _sigma_r[_qp]           = _v_sigma_r;
    _sigma_s[_qp]           = _v_sigma_s;
    _chi_nu_sigma_f[_qp]    = _v_chi_nu_sigma_f;

    
}