#include "UOSphdfMaterial.h"
#include "SPHFactorsUserObject.h"

registerMooseObject("pertApp",UOSphdfMaterial);

InputParameters
UOSphdfMaterial::validParams()
{
    InputParameters params = Material::validParams();
    
    params.addRequiredParam<RealEigenVector>("ref_diffusivity","Serpent 2 diffusion coefficient for each energy group in this material (used as starting value in the iteration)");
    params.addRequiredParam<RealEigenVector>("ref_sigma_r","Serpent 2 removal cross section for each energy group in this material");
    params.addRequiredParam<RealEigenVector>("ref_nu_sigma_f","Fission cross section (multiplied by nubar) for each energy group in this material");
    params.addRequiredParam<RealEigenVector>("chi","Fission yield for each energy group in this material");  
    params.addRequiredParam<Real>("ref_k","reference keff from Serpent 2");    
    params.addRequiredParam<RealEigenMatrix>("ref_sigma_s","Scattering matrix for this material, given as tensor");
    
    params.addRequiredParam<UserObjectName>("sph_factors_uo", "___");    
    params.addRequiredParam<UserObjectName>("normalization_factors_uo", "___");        
    
    return params;
}

UOSphdfMaterial::UOSphdfMaterial(const InputParameters & parameters) :
    Material(parameters),
    _v_diffusivity(     getParam<RealEigenVector>("ref_diffusivity")),
    _v_sigma_r(         getParam<RealEigenVector>("ref_sigma_r")),
    _v_nu_sigma_f(      getParam<RealEigenVector>("ref_nu_sigma_f")),
    _v_chi(             getParam<RealEigenVector>("chi")),
    _v_sigma_s(         getParam<RealEigenMatrix>("ref_sigma_s")),
    _ref_k(             getParam<Real>("ref_k")),
    

    _sph_factors_uo(const_cast<SPHFactorsUserObject&>(getUserObject<SPHFactorsUserObject>("sph_factors_uo"))),
    _normalization_factors_uo(const_cast<SPHFactorsUserObject&>(getUserObject<SPHFactorsUserObject>("normalization_factors_uo"))),


    _diffusivity(       declareProperty<RealEigenVector>("sphdf_diffusivity")),
    _sigma_r(           declareProperty<RealEigenVector>("sphdf_sigma_r")),
    _sigma_s(           declareProperty<RealEigenMatrix>("sphdf_sigma_s")),
    _chi_nu_sigma_f(    declareProperty<RealEigenMatrix>("sphdf_chi_nu_sigma_f"))
{
}


void
UOSphdfMaterial::computeQpProperties()
{

    _diffusivity[_qp].resize(_v_diffusivity.size());
    _sigma_r[_qp].resize(_v_sigma_r.size());   
    _sigma_s[_qp].resize(_v_sigma_s.rows(), _v_sigma_s.cols());
    _chi_nu_sigma_f[_qp].resize(_v_sigma_s.rows(), _v_sigma_s.cols());

    RealEigenVector sph_factors = _sph_factors_uo.getValue();
    RealEigenVector normalization_factors = _normalization_factors_uo.getValue();;
    

    //sph_factors.conservativeResize(_v_diffusivity.size());
    //normalization_factors.conservativeResize(_v_diffusivity.size());
    
    RealEigenVector tilde_factors = sph_factors.cwiseProduct(normalization_factors);
    

    _diffusivity[_qp]       = _v_diffusivity.cwiseProduct(tilde_factors);
    _sigma_r[_qp]           = _v_sigma_r.cwiseProduct(tilde_factors);
    _chi_nu_sigma_f[_qp]    = (-1/_ref_k)*(_v_chi*(_v_nu_sigma_f.cwiseProduct(sph_factors).transpose()));


    for (int j =0;  j< _v_diffusivity.size(); j++)
    {
        _sigma_s[_qp].row(j)    = -_v_sigma_s.row(j).cwiseProduct(tilde_factors.transpose());
    }


    
}
