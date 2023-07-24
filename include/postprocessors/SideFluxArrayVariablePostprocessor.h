#pragma once

#include "SideIntegralPostprocessor.h"
#include "MooseVariableInterface.h"
#include "FaceArgInterface.h"
#include "Assembly.h"

class SideFluxArrayVariablePostprocessor : public SideIntegralPostprocessor,
                                          public MooseVariableInterface<RealEigenVector>,
                                          public FaceArgProducerInterface
{
public:
  static InputParameters validParams();

  SideFluxArrayVariablePostprocessor(const InputParameters & parameters);
  bool hasFaceSide(const FaceInfo & fi, const bool fi_elem_side) const override;


protected:
  Real computeQpIntegral() override;

  Real computeFaceInfoIntegral(const FaceInfo * fi) override;

  const ArrayVariableValue & _u;
  
  const ArrayVariableGradient & _grad_u;

  const MaterialProperty<RealEigenVector> & _diffusivity;    

  /// Normals in type of Eigen map
  const std::vector<Eigen::Map<RealDIMValue>> & _array_normals;

  const unsigned int  _component;

};
