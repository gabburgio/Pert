#pragma once

#include "Material.h"

class SPHFactorsUserObject;

class UserObjectMaterial : public Material
{
public:
    
    UserObjectMaterial(const InputParameters & parameters);

    static InputParameters validParams();
    
protected:
    virtual void computeQpProperties() override;
    
    SPHFactorsUserObject & _uo;
    const Real & _v_cross_section;
    const Real & _ref_int;
    
    MaterialProperty<Real> & _cross_section;
    
};
