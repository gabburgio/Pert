#pragma once

#include "ElementUserObject.h"
#include "MooseVariableInterface.h"



class SPHFactorsUserObject : public ElementUserObject,
                             public MooseVariableInterface<RealEigenVector>
{
public:
  static InputParameters validParams();

  SPHFactorsUserObject(const InputParameters & parameters);

  virtual void initialize() override;
  virtual void execute() override;
  virtual void threadJoin(const UserObject & y) override;
  virtual void finalize() override;

  /// Returns the integral value
  virtual RealEigenVector getValue();
  RealEigenVector getIntegrals();

protected:
  RealEigenVector computeQpIntegral();
  RealEigenVector computeIntegral();

  const ArrayVariableValue & _u;

  const unsigned int  _var_size;

  unsigned int _qp;

  RealEigenVector _integral_value;
  const RealEigenVector & _ref_fluxes;
};
