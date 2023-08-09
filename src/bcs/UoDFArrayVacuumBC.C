#include "UoDFArrayVacuumBC.h"
#include "NormalizationFactorsUserObject.h"


registerMooseObject("pertApp", UoDFArrayVacuumBC);

InputParameters
UoDFArrayVacuumBC::validParams()
{
  InputParameters params = ArrayIntegratedBC::validParams();
  params.addRequiredParam<UserObjectName>("normalization_factors_uo", "___");        
  params.addRequiredParam<std::vector<PostprocessorName>>("surface_integrators","to calculate the flux integral over the vacuum boundary");
  params.addRequiredParam<RealEigenVector>("ref_phi_g","reference flux integrated over the whole geometry");
  params.addRequiredParam<RealEigenVector>("ref_current_integral","reference current integrated over the vacuum boundary");

  return params;
}

UoDFArrayVacuumBC::UoDFArrayVacuumBC(const InputParameters & parameters)
  : ArrayIntegratedBC(parameters),
  _normalization_factors_uo(const_cast<NormalizationFactorsUserObject&>(getUserObject<NormalizationFactorsUserObject>("normalization_factors_uo"))),
    _surface_integrators( getParam<std::vector<PostprocessorName>>("surface_integrators")),
    _ref_phi_g(getParam<RealEigenVector>("ref_phi_g")),
    _ref_current_integral(getParam<RealEigenVector>("ref_current_integral"))

{

}

void
UoDFArrayVacuumBC::computeQpResidual(RealEigenVector & residual)
{

  RealEigenVector normalization_factors = _normalization_factors_uo.getNormalizationFactors();
  Real surface_flux_integrator =  



  RealEigenVector gamma;
  gamma.conservativeResize(_ref_phi_g.size());

  for(int i=0; i<_ref_phi_g.size(); ++i)
  {
    Real volume_flux_integrator = getPostprocessorValueByName(_total_integrators[i]);
    Real surface_flux_integrator = getPostprocessorValueByName(_surface_integrators[i]);
    gamma(i)=(_ref_current_integral(i)*volume_flux_integrator)/(surface_flux_integrator*_ref_phi_g(i));
  }
 
  residual = _u[_qp].cwiseProduct(gamma)* _test[_i][_qp];
}

