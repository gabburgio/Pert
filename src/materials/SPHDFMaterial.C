#include "SPHDFMaterial.h"

registerMooseObject("pertApp",SPHDFMaterial);

InputParameters
SPHDFMaterial::validParams()
{
    InputParameters params = Material::validParams();
    
    params.addRequiredParam<RealEigenVector>("ref_diffusivity","Serpent 2 diffusion coefficient for each energy group in this material (used as starting value in the iteration)");
    params.addRequiredParam<RealEigenVector>("ref_sigma_r","Serpent 2 removal cross section for each energy group in this material");
    params.addRequiredParam<RealEigenVector>("ref_nu_sigma_f","Fission cross section (multiplied by nubar) for each energy group in this material");
    params.addRequiredParam<RealEigenVector>("chi","Fission yield for each energy group in this material");  
    params.addRequiredParam<Real>("ref_k","reference keff from Serpent 2");    
    params.addRequiredParam<RealEigenMatrix>("ref_sigma_s","Scattering matrix for this material, given as tensor");
    
    params.addRequiredParam<RealEigenVector>("ref_phi_mg","reference flux integrated over the material region");
    params.addRequiredParam<std::vector<PostprocessorName>>("zone_integrators","ElementIntegralArrayVariablePostprocessors to calculate the flux integral over the material zone");   
    params.addRequiredParam<std::vector<PostprocessorName>>("total_integrators","ElementIntegralArrayVariablePostprocessors to calculate the flux integral over the whole geometry");   
    params.addRequiredParam<RealEigenVector>("ref_phi_g","reference flux integrated over the whole geometry");
    
    
    return params;
}

SPHDFMaterial::SPHDFMaterial(const InputParameters & parameters) :
    Material(parameters),
    _v_diffusivity(     getParam<RealEigenVector>("ref_diffusivity")),
    _v_sigma_r(         getParam<RealEigenVector>("ref_sigma_r")),
    _v_nu_sigma_f(      getParam<RealEigenVector>("ref_nu_sigma_f")),
    _v_chi(             getParam<RealEigenVector>("chi")),
    _v_sigma_s(         getParam<RealEigenMatrix>("ref_sigma_s")),
    _ref_k(             getParam<Real>("ref_k")),
    
    
    _ref_phi_mg(  getParam<RealEigenVector>("ref_phi_mg")),
    _zone_integrators(  getParam<std::vector<PostprocessorName>>("zone_integrators")),    
    _ref_phi_g(getParam<RealEigenVector>("ref_phi_g")),
    _total_integrators( getParam<std::vector<PostprocessorName>>("total_integrators")),


    _diffusivity(       declareProperty<RealEigenVector>("sphdf_diffusivity")),
    _sigma_r(           declareProperty<RealEigenVector>("sphdf_sigma_r")),
    _sigma_s(           declareProperty<RealEigenMatrix>("sphdf_sigma_s")),
    _chi_nu_sigma_f(    declareProperty<RealEigenMatrix>("sphdf_chi_nu_sigma_f"))
{
}


void
SPHDFMaterial::computeQpProperties()
{

    _diffusivity[_qp].resize(_v_diffusivity.size());
    _sigma_r[_qp].resize(_v_sigma_r.size());   
    _sigma_s[_qp].resize(_v_sigma_s.rows(), _v_sigma_s.cols());
    _chi_nu_sigma_f[_qp].resize(_v_sigma_s.rows(), _v_sigma_s.cols());

    RealEigenVector sph_factors;
    RealEigenVector normalization_factors;
    RealEigenVector tilde_factors;

    sph_factors.conservativeResize(_v_diffusivity.size());
    normalization_factors.conservativeResize(_v_diffusivity.size());
    tilde_factors.conservativeResize(_v_diffusivity.size());

    for(int i=0; i< _v_diffusivity.size(); i++ ) 
    {
    normalization_factors(i) = getPostprocessorValueByName(_total_integrators[i])/_ref_phi_g(i);
    sph_factors(i)= _ref_phi_mg(i)/getPostprocessorValueByName(_zone_integrators[i]);
    }

    tilde_factors = sph_factors.cwiseProduct(normalization_factors);
    

    _diffusivity[_qp]       = _v_diffusivity.cwiseProduct(tilde_factors);
    _sigma_r[_qp]           = _v_sigma_r.cwiseProduct(tilde_factors);
    _chi_nu_sigma_f[_qp]    = (1/_ref_k)*(_v_chi*(_v_nu_sigma_f.cwiseProduct(sph_factors).transpose()));


    for (int j =0;  j< _v_diffusivity.size(); j++)
    {
        _sigma_s[_qp].row(j)    = _v_sigma_s.row(j).cwiseProduct(tilde_factors.transpose());
    }


    
}