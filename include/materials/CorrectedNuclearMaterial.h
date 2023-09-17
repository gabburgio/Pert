#pragma once

#include "Material.h"


class CorrectedNuclearMaterial : public Material
{
public:
    
    CorrectedNuclearMaterial(const InputParameters & parameters);

    static InputParameters validParams();
    
protected:
    virtual void computeQpProperties() override;
    
    RealEigenVector _v_diffusivity;
    RealEigenVector _v_sigma_r;
    RealEigenVector _v_nu_sigma_f;
    RealEigenVector _v_chi;
    RealEigenMatrix _v_sigma_s;
    RealEigenMatrix  _v_chi_nu_sigma_f;
    const RealEigenVector & _sph_factors;
    const RealEigenVector & _normalization_factors;
    
    MaterialProperty<RealEigenVector> & _diffusivity;
    MaterialProperty<RealEigenVector> & _sigma_r;
    MaterialProperty<RealEigenMatrix> & _sigma_s;
    MaterialProperty<RealEigenMatrix> & _chi_nu_sigma_f;
    
};