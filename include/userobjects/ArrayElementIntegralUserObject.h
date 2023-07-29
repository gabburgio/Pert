/*
#pragma once

#include "ElementUserObject.h"


class ElementIntegralUserObject : public ElementUserObject
{
public:
  static InputParameters validParams();

  ElementIntegralUserObject(const InputParameters & parameters);

  virtual void initialize() override;
  virtual void execute() override;
  virtual void threadJoin(const UserObject & y) override;
  virtual void finalize() override {}

  /// Returns the integral value
  virtual RealEigenVector getValue();

protected:
  virtual RealEigenVector computeQpIntegral() = 0;
  virtual RealEigenVector computeIntegral();

  const VariableValue & _u;

  const unsigned int & variable_size;

  unsigned int _qp;

  RealEigenVector _integral_value;
};
*/