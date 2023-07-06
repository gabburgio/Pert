#pragma once

#include "ElementIntegralPostprocessor.h"


class ArrayMaterialPropertyIntegralPostprocessor : public ElementIntegralPostprocessor
{
public:
  static InputParameters validParams();

  ArrayMaterialPropertyIntegralPostprocessor(const InputParameters & parameters);

protected:
  virtual Real computeQpIntegral() override;

  const unsigned int _component;
  const MaterialProperty<RealEigenVector> & _property;
  
};
