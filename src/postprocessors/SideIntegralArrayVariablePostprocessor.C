#include "SideIntegralArrayVariablePostprocessor.h"


registerMooseObject("pertApp", SideIntegralArrayVariablePostprocessor);

InputParameters
SideIntegralArrayVariablePostprocessor::validParams()
{
  InputParameters params = SideIntegralPostprocessor::validParams();
  params.addRequiredCoupledVar("variable",
                               "The name of the array variable which this postprocessor integrates");
  params.addRequiredParam<unsigned int>("component", "the component to integrate");
  params.addClassDescription("Computes a surface integral of the specified variable component");
  return params;
}

SideIntegralArrayVariablePostprocessor::SideIntegralArrayVariablePostprocessor(
    const InputParameters & parameters)
  : SideIntegralPostprocessor(parameters),
    MooseVariableInterface<RealEigenVector>(
        this, false, "variable", Moose::VarKindType::VAR_ANY, Moose::VarFieldType::VAR_FIELD_ARRAY),
    _u(coupledArrayValue("variable")),
    _component(getParam<unsigned int>("component"))

{
  addMooseVariableDependency(&mooseVariableField());
}



Real
SideIntegralArrayVariablePostprocessor::computeQpIntegral()
{
  return _u[_qp](_component);
}





//obligatory override

Real
SideIntegralArrayVariablePostprocessor::computeFaceInfoIntegral(const FaceInfo * const fi)
{
  return 0;
}

bool
SideIntegralArrayVariablePostprocessor::hasFaceSide(const FaceInfo & fi, const bool fi_elem_side) const
{
  return false;
}
