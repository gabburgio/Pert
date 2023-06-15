#include "PrecursorProduction.h"

registerMooseObject("pertApp", PrecursorProduction);

InputParameters
PrecursorProduction::validParams()
{
  InputParameters params = ArrayKernel::validParams();
  params.addRequiredParam<MaterialPropertyName>(
      "chi_nu_sigma_f",
      "For the fission term.");
  params.addRequiredParam<MaterialPropertyName>(
      "delayed_fraction",
      "The array containing the fission production fraction in each delayed group.");

  params.addRequiredCoupledVar("flux",
                               "The array variable holding the multigroup flux");
  
  return params;
}

PrecursorProduction::PrecursorProduction(const InputParameters & parameters)
  : ArrayKernel(parameters),
    _chi_nu_sigma_f(&getMaterialProperty<RealEigenMatrix>("chi_nu_sigma_f")),
    _delayed_fraction(&getMaterialProperty<RealEigenVector>("delayed_fraction")),
    _flux(coupledArrayValue("flux"))    

{
  addMooseVariableDependency(&mooseVariableField());
}


void
PrecursorProduction::computeQpResidual(RealEigenVector & residual)
{
residual.noalias() = - ( ((*_chi_nu_sigma_f)[_qp] * _flux[_qp]).sum() * (*_delayed_fraction)[_qp] )
* _test[_i][_qp];
}

