#include "DFArrayVacuumBC.h"

registerMooseObject("pertApp", DFArrayVacuumBC);

InputParameters
DFArrayVacuumBC::validParams()
{
  InputParameters params = ArrayIntegratedBC::validParams();
  params.addRequiredParam<std::vector<PostprocessorName>>("total_integrators","ElementIntegralArrayVariablePostprocessors to calculate the flux integral over the whole geometry");   
  params.addRequiredParam<std::vector<PostprocessorName>>("surface_integrators","to calculate the flux integral over the vacuum boundary");
  params.addRequiredParam<RealEigenVector>("ref_phi_g","reference flux integrated over the whole geometry");
  params.addRequiredParam<RealEigenVector>("ref_current_integral","reference current integrated over the vacuum boundary");

  return params;
}

DFArrayVacuumBC::DFArrayVacuumBC(const InputParameters & parameters)
  : ArrayIntegratedBC(parameters),
    _total_integrators( getParam<std::vector<PostprocessorName>>("total_integrators")),
    _surface_integrators( getParam<std::vector<PostprocessorName>>("surface_integrators")),
    _ref_phi_g(getParam<RealEigenVector>("ref_phi_g")),
    _ref_current_integral(getParam<RealEigenVector>("ref_current_integral"))

{

}

void
DFArrayVacuumBC::computeQpResidual(RealEigenVector & residual)
{
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

