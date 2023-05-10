#pragma once

#include "SideIntegralPostprocessor.h"
#include "MooseVariableInterface.h"
#include "FaceArgInterface.h"


class SideIntegralArrayVariablePostprocessor : public SideIntegralPostprocessor,
                                          public MooseVariableInterface<RealEigenVector>,
                                          public FaceArgProducerInterface
{
public:
  static InputParameters validParams();

  SideIntegralArrayVariablePostprocessor(const InputParameters & parameters);
  bool hasFaceSide(const FaceInfo & fi, const bool fi_elem_side) const override;


protected:
  Real computeQpIntegral() override;

  Real computeFaceInfoIntegral(const FaceInfo * fi) override;

  const ArrayVariableValue & _u;

  const unsigned int & _component;

};
