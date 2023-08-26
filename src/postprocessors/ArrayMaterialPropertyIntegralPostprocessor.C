#include "ArrayMaterialPropertyIntegralPostprocessor.h"


registerMooseObject("MooseApp", ArrayMaterialPropertyIntegralPostprocessor);

InputParameters
ArrayMaterialPropertyIntegralPostprocessor::validParams()
{
  InputParameters params = ElementIntegralPostprocessor::validParams();
  params.addRequiredParam<MaterialPropertyName>("property", "The name of the material property");
  params.addRequiredParam<unsigned int>("component", "The index of the desired component");
  return params;
}


ArrayMaterialPropertyIntegralPostprocessor::ArrayMaterialPropertyIntegralPostprocessor(
    const InputParameters & parameters)
  : ElementIntegralPostprocessor(parameters),
    _property(getMaterialProperty<RealEigenVector>("property")),
    _component(getParam<unsigned int>("component"))
{
}


Real
ArrayMaterialPropertyIntegralPostprocessor::computeQpIntegral()
{
  return _property[_qp](_component);
}

//constcast