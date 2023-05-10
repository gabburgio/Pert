#pragma once
#include "Material.h"


class NewSPHMaterial : public Material
{
public:
    
    NewSPHMaterial(const InputParameters & parameters);

    static InputParameters validParams();
    
protected:
    virtual void computeQpProperties() override;
    
    const RealEigenVector & _v_diffusivity;
    const RealEigenVector & _v_ref_phi_mg;
    const RealEigenVector & _v_sigma_r;


    MaterialProperty<RealEigenVector> & _diffusivity;
    MaterialProperty<RealEigenVector> & _sigma_r;
    


    //pp declarations

    const std::vector<PostprocessorName> & _flux_integrators;

    

};

