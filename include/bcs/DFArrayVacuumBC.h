#pragma once

#include "ArrayIntegratedBC.h"

class DFArrayVacuumBC : public ArrayIntegratedBC
{
public:
  static InputParameters validParams();

  DFArrayVacuumBC(const InputParameters & parameters);

protected:
  virtual void computeQpResidual(RealEigenVector & residual) override;


   const std::vector<PostprocessorName> & _total_integrators;
   const std::vector<PostprocessorName> & _surface_integrators;
   const RealEigenVector & _ref_phi_g;
   const RealEigenVector & _ref_current_integral;



};
