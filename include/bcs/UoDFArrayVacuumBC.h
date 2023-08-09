#pragma once

#include "ArrayIntegratedBC.h"

class NormalizationFactorsUserObject;


class UoDFArrayVacuumBC : public ArrayIntegratedBC
{
public:
  static InputParameters validParams();

  UoDFArrayVacuumBC(const InputParameters & parameters);

protected:
  virtual void computeQpResidual(RealEigenVector & residual) override;

    NormalizationFactorsUserObject & _normalization_factors_uo;

   const std::vector<PostprocessorName> & _surface_integrators;
   const RealEigenVector & _ref_current_integral;



};
