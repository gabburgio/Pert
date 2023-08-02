#include "SPHFactorsUserObject.h"

#include "libmesh/quadrature.h"

registerMooseObject("pertApp", SPHFactorsUserObject);

InputParameters
SPHFactorsUserObject::validParams()
{
  InputParameters params = ElementUserObject::validParams();
  params.addRequiredParam<unsigned int>("var_size", "__");
  params.addRequiredParam<RealEigenVector>("ref_fluxes", "__");
  params.addRequiredCoupledVar("variable", "The name of the variable that this object operates on");
  return params;
}

SPHFactorsUserObject::SPHFactorsUserObject(const InputParameters & parameters)
  : ElementUserObject(parameters), _qp(0),
      MooseVariableInterface<RealEigenVector>(this,
                                 false,
                                 "variable",
                                 Moose::VarKindType::VAR_ANY,
                                 Moose::VarFieldType::VAR_FIELD_ARRAY),  
    _var_size(getParam<unsigned int>("var_size")),
    _ref_fluxes(getParam<RealEigenVector>("ref_fluxes")),
    _u(coupledArrayValue("variable"))
{
  _integral_value = RealEigenVector::Zero(_var_size);
    addMooseVariableDependency(&mooseVariableField());
}




RealEigenVector
SPHFactorsUserObject::getValue() 
{
  return _ref_fluxes.cwiseQuotient(_integral_value);
}


RealEigenVector
SPHFactorsUserObject::getIntegrals() 
{
  return _integral_value;
}




void
SPHFactorsUserObject::initialize()
{
  _integral_value = RealEigenVector::Zero(_var_size);
}

void
SPHFactorsUserObject::execute()
{

  RealEigenVector computed_value = computeIntegral(); 
  _integral_value += computed_value;
  
}

void
SPHFactorsUserObject::threadJoin(const UserObject & y)
{
  const SPHFactorsUserObject & pps = static_cast<const SPHFactorsUserObject &>(y);
  RealEigenVector pp_vector_integral = pps._integral_value;

  _integral_value += pp_vector_integral;
}


RealEigenVector
SPHFactorsUserObject::computeIntegral()
{
  RealEigenVector sum = RealEigenVector::Zero(_var_size);

    for (_qp = 0; _qp < _qrule->n_points(); _qp++)
    {
      RealEigenVector vector_integral = computeQpIntegral();

      sum += _JxW[_qp] * _coord[_qp] * vector_integral; 

    }
  
  return sum;
}

void
SPHFactorsUserObject::finalize()
{
  for(int i =0; i<_var_size; ++i)
  {
    gatherSum(_integral_value(i));
  }
}


RealEigenVector
SPHFactorsUserObject::computeQpIntegral()
{
  return _u[_qp];
}
