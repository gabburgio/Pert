#pragma once

#include "Material.h"


class NuclearMaterial : public Material
{
public:
    
    NuclearMaterial(const InputParameters & parameters);

    static InputParameters validParams();
    
protected:
    virtual void computeQpProperties() override;
    
    const RealEigenVector & _v_diffusivity;
    const RealEigenVector & _v_sigma_t;
    const RealEigenVector & _v_nu_sigma_f;
    const RealEigenVector & _v_chi;
    const RealEigenMatrix & _v_sigma_s;
    
    MaterialProperty<RealEigenVector> & _sphdf_diffusivity;
    MaterialProperty<RealEigenVector> & _sphdf_sigma_r;
    MaterialProperty<RealEigenVector> & _sphdf_nu_sigma_f;
    MaterialProperty<RealEigenVector> & _chi;
    MaterialProperty<RealEigenMatrix> & _sphdf_sigma_s;
    MaterialProperty<RealEigenMatrix> & _sphdf_chi_nu_sigma_f;
    
};