#pragma once

#include "AuxKernel.h"

class PrecursorSourceAux : public ArrayAuxKernel
{
public:
  static InputParameters validParams();

  PrecursorSourceAux(const InputParameters & parameters);

protected:
  virtual RealEigenVector computeValue() override;

  const MaterialProperty<RealEigenMatrix> * const _chi_nu_sigma_f;
  const MaterialProperty<RealEigenVector> * const _delayed_fraction;
  const MaterialProperty<RealEigenVector> * const _decay_constants;

  const ArrayVariableValue & _flux;

};
