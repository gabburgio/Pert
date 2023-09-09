#pragma once

#include "ArrayIntegratedBC.h"

class NormalizationFactorsUserObject;


class UoArrayAlbedoBC : public ArrayIntegratedBC 
{
public:
  static InputParameters validParams();

  UoArrayAlbedoBC(const InputParameters & parameters);

protected:
  virtual void computeQpResidual(RealEigenVector & residual) override;

   const NormalizationFactorsUserObject & _normalization_factors_uo;
   const std::vector<PostprocessorName> & _surface_integrators;
   const RealEigenVector & _ref_current_integral;


   const MaterialProperty<RealEigenVector> & _diffusivity;    
   const ArrayVariableGradient & _grad_u;
   const RealEigenMatrix & _albedo_matrix; 

  /// Normals in type of Eigen map
  const std::vector<Eigen::Map<RealDIMValue>> & _array_normals;

};
