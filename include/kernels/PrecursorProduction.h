#pragma once

#include "ArrayKernel.h"
#include "MooseVariableInterface.h"


class PrecursorProduction : public ArrayKernel
{
public:
  static InputParameters validParams();

  PrecursorProduction(const InputParameters & parameters);

protected:
  virtual void computeQpResidual(RealEigenVector & residual) override;
  
  const MaterialProperty<RealEigenMatrix> * const _chi_nu_sigma_f;
  const MaterialProperty<RealEigenVector> * const _delayed_fraction;

  const ArrayVariableValue & _flux;

  
};
