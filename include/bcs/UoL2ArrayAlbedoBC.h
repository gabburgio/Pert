#pragma once

#include "ArrayIntegratedBC.h"

class NormalizationFactorsUserObject;


class UoL2ArrayAlbedoBC : public ArrayIntegratedBC
{
public:
  static InputParameters validParams();

  UoL2ArrayAlbedoBC(const InputParameters & parameters);

protected:
  virtual void computeQpResidual(RealEigenVector & residual) override;
  virtual RealEigenVector computeQpJacobian() override;
  virtual RealEigenMatrix computeQpOffDiagJacobian(const MooseVariableFEBase & jvar) override;


  const NormalizationFactorsUserObject & _normalization_factors_uo;

  const std::vector<PostprocessorName> & _surface_integrators;
  const RealEigenVector & _ref_current_integral;

  const RealEigenMatrix & _albedo_matrix; 
  RealEigenMatrix _corrective_matrix; 



};
