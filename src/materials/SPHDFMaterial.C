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
    
    
    _v_ref_phi_mg(  getParam<RealEigenVector>("ref_phi_mg")),
    _zone_integrators(  getParam<std::vector<PostprocessorName>>("zone_integrators")),    


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

    RealEigenVector sphdf_factors;
    sphdf_factors.conservativeResize(_v_diffusivity.size());
    double default_sphdf = 1;


    for(int i=0; i< _v_diffusivity.size(); i++ ) 

    {
    
    double flux_integrator = getPostprocessorValueByName(_zone_integrators[i]);

    // Check if flux_integrator is nonzero
    if (flux_integrator != 0) 
    {sphdf_factors(i) = _v_ref_phi_mg(i)/flux_integrator;
    }
    else
    {sphdf_factors(i) = default_sphdf; std::cout<<"null integrator"<<std::endl;}  
    }

    _diffusivity[_qp]       = _v_diffusivity.array()*sphdf_factors.array();
    _sigma_r[_qp]           = _v_sigma_r.array()*sphdf_factors.array();
    _chi_nu_sigma_f[_qp]    = (1/_ref_k)*(_v_chi.array()* ((_v_nu_sigma_f.array()*sphdf_factors.array()).transpose()));

    for (int j =0;  j< _v_diffusivity.size(); j++)
    {
        _sigma_s[_qp].row(j)    = ((_v_sigma_s.row(j)).array())*sphdf_factors.array();
    }


    
}