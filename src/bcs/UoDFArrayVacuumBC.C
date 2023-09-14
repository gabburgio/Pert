#include "UoDFArrayVacuumBC.h"
#include "NormalizationFactorsUserObject.h"


registerMooseObject("pertApp", UoDFArrayVacuumBC);

InputParameters
UoDFArrayVacuumBC::validParams()
{
  InputParameters params = ArrayIntegratedBC::validParams();
  params.addRequiredParam<UserObjectName>("normalization_factors_uo", "___");        
  params.addRequiredParam<std::vector<PostprocessorName>>("surface_integrators","to calculate the flux integral over the vacuum boundary");
  params.addRequiredParam<RealEigenVector>("ref_current_integral","reference current integrated over the vacuum boundary");

  return params;
}

UoDFArrayVacuumBC::UoDFArrayVacuumBC(const InputParameters & parameters)
  : ArrayIntegratedBC(parameters),
  _normalization_factors_uo(getUserObject<NormalizationFactorsUserObject>("normalization_factors_uo")),
    _surface_integrators( getParam<std::vector<PostprocessorName>>("surface_integrators")),
    _ref_current_integral(getParam<RealEigenVector>("ref_current_integral"))
{
}

void
UoDFArrayVacuumBC::computeQpResidual(RealEigenVector & residual)
{

  RealEigenVector normalization_factors = _normalization_factors_uo.getNormalizationFactors();
  RealEigenVector surface_flux_integrators =   RealEigenVector::Zero(_ref_current_integral.size());

  for(int i=0; i<_ref_current_integral.size(); ++i)
  {
    surface_flux_integrators(i) = getPostprocessorValueByName(_surface_integrators[i]);
  }
  
  RealEigenVector gamma = normalization_factors.cwiseProduct(_ref_current_integral.cwiseQuotient(surface_flux_integrators));

  // no need to divide by two because the postprocessor only gives the integral, and not the integral divided by two
  
     
  residual = _u[_qp].cwiseProduct(gamma)* _test[_i][_qp];

}



RealEigenVector
UoDFArrayVacuumBC::computeQpJacobian ()
{

  RealEigenVector normalization_factors = _normalization_factors_uo.getNormalizationFactors();
  RealEigenVector surface_flux_integrators =   RealEigenVector::Zero(_ref_current_integral.size());

  for(int i=0; i<_ref_current_integral.size(); ++i)
  {
    surface_flux_integrators(i) = getPostprocessorValueByName(_surface_integrators[i]);
  }
  
  RealEigenVector gamma = normalization_factors.cwiseProduct(_ref_current_integral.cwiseQuotient(surface_flux_integrators));  
     
  return _test[_i][_qp] * _phi[_j][_qp] * gamma;

}


