#pragma once


#include "NuclearMaterial.h"


class TransientNuclearMaterial : public NuclearMaterial
{
public:
    
    TransientNuclearMaterial(const InputParameters & parameters);

    static InputParameters validParams();
    
protected:
    virtual void computeQpProperties() override;
    
    const RealEigenVector & _v_inverse_v;
    const RealEigenVector & _v_delayed_spectrum;
    const RealEigenVector & _v_delayed_fraction;
    const RealEigenVector & _v_decay_constants;

    MaterialProperty<RealEigenVector> & _inverse_v;
    MaterialProperty<RealEigenVector> & _delayed_spectrum;
    MaterialProperty<RealEigenVector> & _delayed_fraction;
    MaterialProperty<RealEigenVector> & _decay_constants;
    MaterialProperty<RealEigenVector> & _prec_tcoeff;

    RealEigenVector _v_prec_tcoeff;
    
};