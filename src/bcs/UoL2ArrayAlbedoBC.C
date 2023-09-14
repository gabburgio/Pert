#include "UoL2ArrayAlbedoBC.h"
#include "NormalizationFactorsUserObject.h"


registerMooseObject("pertApp", UoL2ArrayAlbedoBC);

InputParameters
UoL2ArrayAlbedoBC::validParams()
{
  InputParameters params = ArrayIntegratedBC::validParams();
  params.addRequiredParam<UserObjectName>("normalization_factors_uo", "___");        
  params.addRequiredParam<RealEigenMatrix>("albedo_matrix","(incoming current in group i)/(outgoing current in group j)");
  params.addRequiredParam<std::vector<PostprocessorName>>("surface_integrators","to calculate the flux integral over the vacuum boundary");
  params.addRequiredParam<RealEigenVector>("ref_current_integral","reference current integrated over the vacuum boundary");

  return params;
}

UoL2ArrayAlbedoBC::UoL2ArrayAlbedoBC(const InputParameters & parameters)
  : ArrayIntegratedBC(parameters),
  _normalization_factors_uo(getUserObject<NormalizationFactorsUserObject>("normalization_factors_uo")),
    _surface_integrators( getParam<std::vector<PostprocessorName>>("surface_integrators")),
    _ref_current_integral(getParam<RealEigenVector>("ref_current_integral")),
    _albedo_matrix(getParam<RealEigenMatrix>("albedo_matrix"))
{
    auto one = Eigen::MatrixXd::Identity(_albedo_matrix.rows(), _albedo_matrix.cols() );
    _corrective_matrix = 0.5*( ((one + _albedo_matrix).inverse()) * (one - _albedo_matrix) );
}

void
UoL2ArrayAlbedoBC::computeQpResidual(RealEigenVector & residual)
{

  RealEigenVector normalization_factors = _normalization_factors_uo.getNormalizationFactors();
  RealEigenVector surface_flux_integrators =   RealEigenVector::Zero(_ref_current_integral.size());

  for(int i=0; i<_ref_current_integral.size(); ++i)
  {
    surface_flux_integrators(i) = getPostprocessorValueByName(_surface_integrators[i]);
  }
  
  RealEigenVector gamma = normalization_factors.cwiseProduct(_ref_current_integral.cwiseQuotient(surface_flux_integrators));


  residual = (_corrective_matrix *_u[_qp]).cwiseProduct(gamma)* _test[_i][_qp];

}




RealEigenVector
UoL2ArrayAlbedoBC::computeQpJacobian()
{

  RealEigenVector normalization_factors = _normalization_factors_uo.getNormalizationFactors();
  RealEigenVector surface_flux_integrators =   RealEigenVector::Zero(_ref_current_integral.size());

  for(int i=0; i<_ref_current_integral.size(); ++i)
  {
    surface_flux_integrators(i) = getPostprocessorValueByName(_surface_integrators[i]);
  }
  
  RealEigenVector gamma = normalization_factors.cwiseProduct(_ref_current_integral.cwiseQuotient(surface_flux_integrators));

  return _phi[_j][_qp] * _test[_i][_qp] * (_corrective_matrix.diagonal()).cwiseProduct(gamma);

}


RealEigenMatrix
UoL2ArrayAlbedoBC::computeQpOffDiagJacobian(const MooseVariableFEBase & jvar)
{

  RealEigenVector normalization_factors = _normalization_factors_uo.getNormalizationFactors();
  RealEigenVector surface_flux_integrators =   RealEigenVector::Zero(_ref_current_integral.size());

  for(int i=0; i<_ref_current_integral.size(); ++i)
  {
    surface_flux_integrators(i) = getPostprocessorValueByName(_surface_integrators[i]);
  }
  
  RealEigenVector gamma = normalization_factors.cwiseProduct(_ref_current_integral.cwiseQuotient(surface_flux_integrators));



  if (jvar.number() == _var.number())
    return _phi[_j][_qp] * _test[_i][_qp] * _corrective_matrix * gamma.asDiagonal();
  else
    return RealEigenMatrix::Zero(_var.count(), jvar.count());

}