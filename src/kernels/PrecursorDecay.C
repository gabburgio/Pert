#include "PrecursorDecay.h"

registerMooseObject("pertApp", PrecursorDecay);

InputParameters
PrecursorDecay::validParams()
{
  InputParameters params = ArrayKernel::validParams();
  params.addRequiredParam<MaterialPropertyName>(
      "decay_constants",
      "The array containing the values of the decay constants of the various groups.");
  params.addRequiredParam<MaterialPropertyName>(
      "delayed_spectrum",
      "The array containing the average (multigroup) energy spectrum of delayed neutrons.");

  params.addRequiredCoupledVar("concentrations",
                               "The array variable holding the concentrations of the precursors");
  
  return params;
}

PrecursorDecay::PrecursorDecay(const InputParameters & parameters)
  : ArrayKernel(parameters),
    _decay_constants(&getMaterialProperty<RealEigenVector>("decay_constants")),
    _delayed_spectrum(&getMaterialProperty<RealEigenVector>("delayed_spectrum")),
    _concentrations(coupledArrayValue("concentrations"))    

{
  addMooseVariableDependency(&mooseVariableField());
}


void
PrecursorDecay::computeQpResidual(RealEigenVector & residual)
{
residual.noalias() = ((*_decay_constants)[_qp].dot(_concentrations[_qp]) * (*_delayed_spectrum)[_qp])
* _test[_i][_qp];
}

