#pragma once

#include "Material.h"


class SPHDFMaterial : public Material
{
public:
    
    SPHDFMaterial(const InputParameters & parameters);

    static InputParameters validParams();
    
protected:
    virtual void computeQpProperties() override;
    
    const RealEigenVector & _v_diffusivity;
    const RealEigenVector & _v_sigma_r;
    const RealEigenVector & _v_nu_sigma_f;
    const RealEigenVector & _v_chi;
    const RealEigenMatrix & _v_sigma_s;
    const Real & _ref_k;

    
    const RealEigenVector & _ref_phi_mg;
    const std::vector<PostprocessorName> & _zone_integrators;
    const RealEigenVector & _ref_phi_g;
    const std::vector<PostprocessorName> & _total_integrators;

    
    MaterialProperty<RealEigenVector> & _diffusivity;
    MaterialProperty<RealEigenVector> & _sigma_r;
    MaterialProperty<RealEigenMatrix> & _sigma_s;
    MaterialProperty<RealEigenMatrix> & _chi_nu_sigma_f;
    
};