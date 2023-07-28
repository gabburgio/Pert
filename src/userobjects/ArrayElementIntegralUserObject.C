#include "ElementIntegralUserObject.h"

#include "libmesh/quadrature.h"

InputParameters
ElementIntegralUserObject::validParams()
{
  InputParameters params = ElementUserObject::validParams();
  params.addRequiredCoupledVar("variable", "The name of the variable that this object operates on");
  params.addReqiredParam<unsigned int>("variable_size", "__");
  return params;
}

ElementIntegralUserObject::ElementIntegralUserObject(const InputParameters & parameters)
  : ElementUserObject(parameters), _qp(0),
      MooseVariableInterface<Real>(this,
                                 false,
                                 "variable",
                                 Moose::VarKindType::VAR_ANY,
                                 Moose::VarFieldType::VAR_FIELD_STANDARD),  
    _variable_size(getParam<unsigned int>("variable_size")),
    _u(coupledValue("variable")),
   _integral_value(0)
{
    addMooseVariableDependency(&mooseVariableField());
}

void
ElementIntegralUserObject::initialize()
{
  _integral_value = 0;
}

void
ElementIntegralUserObject::execute()
{
  _integral_value += computeIntegral();
}

RealEigenVector
ElementIntegralUserObject::getValue()
{
  gatherSum(_integral_value);
  return _integral_value;
}

void
ElementIntegralUserObject::threadJoin(const UserObject & y)
{
  const ElementIntegralUserObject & pps = static_cast<const ElementIntegralUserObject &>(y);
  _integral_value += pps._integral_value;
}

RealEigenVector
ElementIntegralUserObject::computeIntegral()
{
  RealEigenVector sum = 0;

  for (_qp = 0; _qp < _qrule->n_points(); _qp++)
    sum += _JxW[_qp] * _coord[_qp] * computeQpIntegral();
  return sum;
}
