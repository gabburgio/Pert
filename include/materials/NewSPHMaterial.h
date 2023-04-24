#pragma once

#include "Material.h"


class NewSPHMaterial : public Material
{
public:
    
    NewSPHMaterial(const InputParameters & parameters);

    static InputParameters validParams();
    
protected:
    virtual void computeQpProperties() override;
    
    const std::vector<Real> & _v_diffusivity;
    const std::vector<Real> & _v_ref_phi_mg;
    const std::vector<Real> & _v_sigma_r;
    const std::vector<VariableName> & _flux;
    
    MaterialProperty<std::vector<Real>> & _diffusivity;
    MaterialProperty<std::vector<Real>> & _sigma_r;
    
};