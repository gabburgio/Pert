#pragma once

#include "ArrayIntegratedBC.h"

class ArrayAlbedoBC : public ArrayIntegratedBC 
{
public:
  static InputParameters validParams();

  ArrayAlbedoBC(const InputParameters & parameters);

protected:
  virtual void computeQpResidual(RealEigenVector & residual) override;


   const MaterialProperty<RealEigenVector> & _diffusivity;    

   const ArrayVariableGradient & _grad_u;
   const RealEigenMatrix & _albedo_matrix; 

  /// Normals in type of Eigen map
  const std::vector<Eigen::Map<RealDIMValue>> & _array_normals;

};
