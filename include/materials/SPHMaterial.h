#pragma once

#include "Material.h"


class SPHMaterial : public Material
{
public:
    
    SPHMaterial(const InputParameters & parameters);

    static InputParameters validParams();
    
protected:
    virtual void computeQpProperties() override;
    
    const RealEigenVector & _v_diffusivity;
    const RealEigenVector & _v_sigma_r;
    const RealEigenVector & _v_nu_sigma_f;
    const RealEigenVector & _v_chi;
    const RealEigenVector & _v_ref_phi_mg;
    const RealEigenMatrix & _v_sigma_s;
    
    MaterialProperty<RealEigenVector> & _diffusivity;
    MaterialProperty<RealEigenVector> & _sigma_r;
    MaterialProperty<RealEigenVector> & _nu_sigma_f;
    MaterialProperty<RealEigenVector> & _chi;
    MaterialProperty<RealEigenMatrix> & _sigma_s;
    MaterialProperty<RealEigenMatrix> & _chi_nu_sigma_f;
    
};