#include "UoArrayAlbedoBC.h"
#include "NormalizationFactorsUserObject.h"


registerMooseObject("pertApp", UoArrayAlbedoBC);

InputParameters
UoArrayAlbedoBC::validParams()
{
  InputParameters params = ArrayIntegratedBC::validParams();

  params.addRequiredParam<UserObjectName>("normalization_factors_uo", "___");        
  params.addRequiredParam<RealEigenMatrix>("albedo_matrix","(incoming current in group i)/(outgoing current in group j)");
  params.addRequiredParam<MaterialPropertyName>("diffusivity", "____");
  params.addRequiredParam<std::vector<PostprocessorName>>("surface_integrators","of side flux type");
  params.addRequiredParam<RealEigenVector>("ref_current_integral","reference current integrated over the albedo boundary");


  return params;
}

UoArrayAlbedoBC::UoArrayAlbedoBC(const InputParameters & parameters)
  : ArrayIntegratedBC(parameters),
  _normalization_factors_uo(getUserObject<NormalizationFactorsUserObject>("normalization_factors_uo")),
    _surface_integrators( getParam<std::vector<PostprocessorName>>("surface_integrators")),
    _ref_current_integral(getParam<RealEigenVector>("ref_current_integral")),
    _array_normals(_assembly.mappedNormals()),
    _grad_u(_var.gradSln()),
    _diffusivity(getMaterialProperty<RealEigenVector>("diffusivity")),
    _albedo_matrix(getParam<RealEigenMatrix>("albedo_matrix"))
{
}


void
UoArrayAlbedoBC::computeQpResidual(RealEigenVector & residual)
{
  auto one = Eigen::MatrixXd::Identity(_ref_current_integral.size(),_ref_current_integral.size());

  RealEigenVector normalization_factors = _normalization_factors_uo.getNormalizationFactors();
  RealEigenVector surface_flux_integrators =   RealEigenVector::Zero(_ref_current_integral.size());

  for(int i=0; i<_ref_current_integral.size(); ++i)
  {
    surface_flux_integrators(i) = getPostprocessorValueByName(_surface_integrators[i]);
  }


  RealEigenVector gamma_tilde =  ((_albedo_matrix - one) * surface_flux_integrators).cwiseProduct(normalization_factors);

  //source = (A - Id)* (1/4 Phi - 1/2 D dPhi / dn)  cfr. Stacey 76

  residual = -gamma_tilde.cwiseProduct((_albedo_matrix - one) * ( 0.25*_u[_qp] - 0.5* (_diffusivity[_qp].asDiagonal() * _grad_u[_qp]) * _array_normals[_qp]) ) * _test[_i][_qp];

}

