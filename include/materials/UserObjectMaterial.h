#pragma once

#include "Material.h"

class ArrayElementIntegralUserObject;

class UserObjectMaterial : public Material
{
public:
    
    UserObjectMaterial(const InputParameters & parameters);

    static InputParameters validParams();
    
protected:
    virtual void computeQpProperties() override;
    
    ArrayElementIntegralUserObject & _uo;
    const Real & _v_cross_section;
    const Real & _ref_int;
    
    MaterialProperty<Real> & _cross_section;
    
};
