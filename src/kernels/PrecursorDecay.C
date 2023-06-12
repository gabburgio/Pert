#include "ArrayReaction.h"

registerMooseObject("MooseApp", ArrayReaction);

InputParameters
ArrayReaction::validParams()
{
  InputParameters params = ArrayKernel::validParams();
  params.addRequiredParam<MaterialPropertyName>(
      "decay_constants",
      "The array containing the values of the decay constants of the various groups.");
  params.addRequiredParam<MaterialPropertyName>(
      "delayed_spectrum",
      "The array containing the average (multigroup) energy spectrum of delayed neutrons.");
  return params;
}

ArrayReaction::ArrayReaction(const InputParameters & parameters)
  : ArrayKernel(parameters),
    _decay_constants(getMaterialProperty<RealEigenVector>("decay_constants")),
    _delayed_spectrum(getMaterialProperty<RealEigenVector>("delayed_spectrum"))    
{
}

void
ArrayReaction::computeQpResidual()
{



mooseAssert((*_r_array)[_qp].size() == _var.count(),
            "reaction_coefficient size is inconsistent with the number of components of array "
            "variable");
// WARNING: use noalias() syntax with caution. See ArrayDiffusion.C for more details.
residual.noalias() = (*_r_array)[_qp].asDiagonal() * _u[_qp] * _test[_i][_qp];


}

RealEigenVector
ArrayReaction::computeQpJacobian()
{
  if (_r)
    return RealEigenVector::Constant(_var.count(), _phi[_j][_qp] * _test[_i][_qp] * (*_r)[_qp]);
  else if (_r_array)
    return _phi[_j][_qp] * _test[_i][_qp] * (*_r_array)[_qp];

  else
    return _phi[_j][_qp] * _test[_i][_qp] * (*_r_2d_array)[_qp].diagonal();
}

RealEigenMatrix
ArrayReaction::computeQpOffDiagJacobian(const MooseVariableFEBase & jvar)
{
  if (jvar.number() == _var.number() && _r_2d_array)
    return _phi[_j][_qp] * _test[_i][_qp] * (*_r_2d_array)[_qp];
  else
    return ArrayKernel::computeQpOffDiagJacobian(jvar);
}
