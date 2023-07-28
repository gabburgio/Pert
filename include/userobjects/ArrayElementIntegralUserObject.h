#pragma once

#include "ElementUserObject.h"

/**
 * This postprocessor computes a volume integral of the specified
 * variable.
 *
 * Note that specializations of this integral are possible by deriving
 * from this class and overriding computeQpIntegral().
 */
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

  unsigned int _qp;

  RealEigenVector _integral_value;
};
