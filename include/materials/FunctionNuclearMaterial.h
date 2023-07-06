#pragma once

#include "Material.h"

class FunctionNuclearMaterial : public Material
{
public:
  static InputParameters validParams();

  FunctionNuclearMaterial(const InputParameters & parameters);

protected:
  virtual void computeQpProperties() override;

  
  unsigned int _group_number; 

  MaterialProperty<RealEigenVector> & _diffusivity;    
  MaterialProperty<RealEigenVector> & _sigma_r;    

  std::vector<FunctionName> _diffusivity_functions;
  std::vector<FunctionName> _removal_functions;

};