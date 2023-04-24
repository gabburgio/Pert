/*#pragma once

#include "Material.h"


class DummySPHMaterial : public Material
{
public:
    
    DummySPHMaterial(const InputParameters & parameters);

    static InputParameters validParams();
    
protected:
    virtual void computeQpProperties() override;
    
    const RealEigenVector & _v_diffusivity;
    const RealEigenVector & _v_ref_phi_mg;
    const RealEigenVector & _v_sigma_r;
    const std::vector<VariableName> & _flux;
    
    MaterialProperty<RealEigenVector> & _diffusivity;
    MaterialProperty<RealEigenVector> & _sigma_r;
    
};*/