#include "PrecursorSourceAux.h"

registerMooseObject("pertApp", PrecursorSourceAux);

InputParameters
PrecursorSourceAux::validParams()
{
  InputParameters params = ArrayAuxKernel::validParams();
 params.addRequiredCoupledVar("flux",
                               "the flux variable");
  params.addRequiredParam<MaterialPropertyName>(
      "chi_nu_sigma_f",
      "For the fission term.");
  params.addRequiredParam<MaterialPropertyName>(
      "delayed_fraction",
      "The array containing the fission production fraction in each delayed group.");
  params.addRequiredParam<MaterialPropertyName>(
      "decay_constants",
      "The array containing the decay constant in each delayed group.");

  return params;
}

PrecursorSourceAux::PrecursorSourceAux(const InputParameters & parameters)
  : ArrayAuxKernel(parameters),
  _flux(coupledArrayValue("flux")),
    _chi_nu_sigma_f(&getMaterialProperty<RealEigenMatrix>("chi_nu_sigma_f")),
    _delayed_fraction(&getMaterialProperty<RealEigenVector>("delayed_fraction")),
    _decay_constants(&getMaterialProperty<RealEigenVector>("decay_constants"))
{
}

RealEigenVector
PrecursorSourceAux::computeValue()
{
  return ((*_chi_nu_sigma_f)[_qp] * _flux[_qp]).sum() * 
  ( (*_delayed_fraction)[_qp].array() / (*_decay_constants)[_qp].array()  );
}
