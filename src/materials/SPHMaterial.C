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
    params.addRequiredParam<std::vector<PostprocessorName>>("zone_integrators","ElementIntegralArrayVariablePostprocessors to calculate the flux integral over the material zone");   
    
    
    return params;
}

SPHMaterial::SPHMaterial(const InputParameters & parameters) :
    Material(parameters),
    _v_diffusivity(     getParam<RealEigenVector>("ref_diffusivity")),
    _v_sigma_r(         getParam<RealEigenVector>("ref_sigma_r")),
    _v_nu_sigma_f(      getParam<RealEigenVector>("ref_nu_sigma_f")),
    _v_chi(             getParam<RealEigenVector>("chi")),
    _v_sigma_s(         getParam<RealEigenMatrix>("ref_sigma_s")),
    _ref_k(             getParam<Real>("ref_k")),
    
    
    _ref_phi_mg(  getParam<RealEigenVector>("ref_phi_mg")),
    _zone_integrators(  getParam<std::vector<PostprocessorName>>("zone_integrators")),    


    _diffusivity(       declareProperty<RealEigenVector>("sph_diffusivity")),
    _sigma_r(           declareProperty<RealEigenVector>("sph_sigma_r")),
    _sigma_s(           declareProperty<RealEigenMatrix>("sph_sigma_s")),
    _chi_nu_sigma_f(    declareProperty<RealEigenMatrix>("sph_chi_nu_sigma_f"))
{
}


void
SPHMaterial::computeQpProperties()
{

    _diffusivity[_qp].resize(_v_diffusivity.size());
    _sigma_r[_qp].resize(_v_sigma_r.size());   
    _sigma_s[_qp].resize(_v_sigma_s.rows(), _v_sigma_s.cols());
    _chi_nu_sigma_f[_qp].resize(_v_sigma_s.rows(), _v_sigma_s.cols());

    RealEigenVector sph_factors;

    sph_factors.conservativeResize(_v_diffusivity.size());

    for(int i=0; i< _v_diffusivity.size(); i++ ) 
    {
    sph_factors(i)= _ref_phi_mg(i)/getPostprocessorValueByName(_zone_integrators[i]);
    }
    

    _diffusivity[_qp]       = _v_diffusivity.cwiseProduct(sph_factors);
    _sigma_r[_qp]           = _v_sigma_r.cwiseProduct(sph_factors);
    _chi_nu_sigma_f[_qp]    = (1/_ref_k)*(_v_chi*(_v_nu_sigma_f.cwiseProduct(sph_factors).transpose()));


    for (int j =0;  j< _v_diffusivity.size(); j++)
    {
        _sigma_s[_qp].row(j)    = _v_sigma_s.row(j).cwiseProduct(sph_factors.transpose());
    }


    
}