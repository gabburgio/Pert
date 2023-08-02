#include "UserObjectMaterial.h"
#include "SPHFactorsUserObject.h"

registerMooseObject("pertApp",UserObjectMaterial);

InputParameters
UserObjectMaterial::validParams()
{
    InputParameters params = Material::validParams();
    params.addRequiredParam<UserObjectName>("user_object", "___");    
    params.addRequiredParam<Real>("cross_section","___");        
    params.addRequiredParam<Real>("ref_int","___");
    return params;
}



UserObjectMaterial::UserObjectMaterial(const InputParameters & parameters) :
    Material(parameters),

    _uo(const_cast<SPHFactorsUserObject&>(getUserObject<SPHFactorsUserObject>("user_object"))),
    _v_cross_section(     getParam<Real>("cross_section")),
    _ref_int(     getParam<Real>("ref_int")),
    _cross_section(       declareProperty<Real>("cross_section"))
{
}


void UserObjectMaterial::computeQpProperties()
{
    _cross_section[_qp] = (_ref_int*_uo.getIntegrals()(0))*_v_cross_section;
}
