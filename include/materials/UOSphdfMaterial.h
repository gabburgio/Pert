#pragma once

#include "Material.h"

class SPHFactorsUserObject;
class NormalizationFactorsUserObject;

class UOSphdfMaterial : public Material
{
public:
    
    UOSphdfMaterial(const InputParameters & parameters);

    static InputParameters validParams();
    
protected:
    virtual void computeQpProperties() override;
    
    const RealEigenVector & _v_diffusivity;
    const RealEigenVector & _v_sigma_r;
    const RealEigenVector & _v_nu_sigma_f;
    const RealEigenVector & _v_chi;
    const RealEigenMatrix & _v_sigma_s;
    const Real & _ref_k;

    
    const SPHFactorsUserObject & _sph_factors_uo;
    const NormalizationFactorsUserObject & _normalization_factors_uo;

    MaterialProperty<RealEigenVector> & _diffusivity;
    MaterialProperty<RealEigenVector> & _sigma_r;
    MaterialProperty<RealEigenMatrix> & _sigma_s;
    MaterialProperty<RealEigenMatrix> & _chi_nu_sigma_f;
    
};

