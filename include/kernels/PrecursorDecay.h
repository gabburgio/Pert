#pragma once

#include "ArrayKernel.h"
#include "MooseVariableInterface.h"
//#include "MooseVariableDependencyInterface.h"



class PrecursorDecay : public ArrayKernel
{
public:
  static InputParameters validParams();

  PrecursorDecay(const InputParameters & parameters);

protected:
  virtual void computeQpResidual(RealEigenVector & residual) override;
  
  const MaterialProperty<RealEigenVector> * const _decay_constants;
  const MaterialProperty<RealEigenVector> * const _delayed_spectrum;

  const ArrayVariableValue & _concentrations;

  
};
