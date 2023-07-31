
#include "ArrayElementIntegralUserObject.h"

#include "libmesh/quadrature.h"

registerMooseObject("pertApp", ArrayElementIntegralUserObject);

InputParameters
ArrayElementIntegralUserObject::validParams()
{
  InputParameters params = ElementUserObject::validParams();
  params.addRequiredParam<unsigned int>("var_size", "__");
  params.addRequiredCoupledVar("variable", "The name of the variable that this object operates on");
  return params;
}

ArrayElementIntegralUserObject::ArrayElementIntegralUserObject(const InputParameters & parameters)
  : ElementUserObject(parameters), _qp(0),
      MooseVariableInterface<RealEigenVector>(this,
                                 false,
                                 "variable",
                                 Moose::VarKindType::VAR_ANY,
                                 Moose::VarFieldType::VAR_FIELD_ARRAY),  
    _var_size(getParam<unsigned int>("var_size")),
    _u(coupledArrayValue("variable"))
{
  _integral_value = RealEigenVector::Zero(_var_size);
    addMooseVariableDependency(&mooseVariableField());
}

void
ArrayElementIntegralUserObject::initialize()
{
  _integral_value = RealEigenVector::Zero(_var_size);
}

void
ArrayElementIntegralUserObject::execute()
{

  RealEigenVector computed_value = computeIntegral(); 
  for(int i =0; i<_var_size; ++i)
  {
    _integral_value(i) += computed_value(i);
  }
}

RealEigenVector
ArrayElementIntegralUserObject::getValue()
{
  for(int i =0; i<_var_size; ++i)
  {
    gatherSum(_integral_value(i));
  }
  return _integral_value;
}

void
ArrayElementIntegralUserObject::threadJoin(const UserObject & y)
{
  const ArrayElementIntegralUserObject & pps = static_cast<const ArrayElementIntegralUserObject &>(y);
  RealEigenVector pp_vector_integral = pps._integral_value;

  for(int i =0; i<_var_size; ++i)
  {
    _integral_value(i) += pp_vector_integral(i);
  } 
}


RealEigenVector
ArrayElementIntegralUserObject::computeIntegral()
{
  RealEigenVector sum = RealEigenVector::Zero(_var_size);
  RealEigenVector vector_integral = computeQpIntegral();

  for(int i =0; i<_var_size; ++i)
  {
    for (_qp = 0; _qp < _qrule->n_points(); _qp++)
      sum(i) += _JxW[_qp] * _coord[_qp] * vector_integral(i); 
  }
  return sum;
}


RealEigenVector
ArrayElementIntegralUserObject::computeQpIntegral()
{
  return _u[_qp];
}
