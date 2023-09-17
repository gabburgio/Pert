#pragma once

#include "ArrayIntegratedBC.h"

class L2ArrayAlbedoBC : public ArrayIntegratedBC 
{
public:
  static InputParameters validParams();

  L2ArrayAlbedoBC(const InputParameters & parameters);

protected:
  virtual void computeQpResidual(RealEigenVector & residual) override;
  virtual RealEigenVector computeQpJacobian() override;
//  virtual RealEigenMatrix computeQpOffDiagJacobian(const MooseVariableFEBase & jvar) override;

   const RealEigenMatrix & _albedo_matrix; 
   RealEigenMatrix _corrective_matrix; 
   const RealEigenVector & _gamma_factors;

};
