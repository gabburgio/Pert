#include "SideFluxArrayVariablePostprocessor.h"


registerMooseObject("pertApp", SideFluxArrayVariablePostprocessor);

InputParameters
SideFluxArrayVariablePostprocessor::validParams()
{
  InputParameters params = SideIntegralPostprocessor::validParams();
  params.addRequiredCoupledVar("variable",
                               "The name of the array variable which this postprocessor integrates");
  params.addRequiredParam<unsigned int>("component", "the component to integrate");
  params.addClassDescription("Computes a surface flux of the specified variable component");
  params.addRequiredParam<MaterialPropertyName>("diffusivity", "____");
  return params;
}

SideFluxArrayVariablePostprocessor::SideFluxArrayVariablePostprocessor(
    const InputParameters & parameters)
  : SideIntegralPostprocessor(parameters),
    _array_normals(_assembly.mappedNormals()),
    _diffusivity(getMaterialProperty<RealEigenVector>("diffusivity")),
    MooseVariableInterface<RealEigenVector>(
        this, false, "variable", Moose::VarKindType::VAR_ANY, Moose::VarFieldType::VAR_FIELD_ARRAY),
    _u(coupledArrayValue("variable")),
    _grad_u(coupledArrayGradient("variable")),
    _component(getParam<unsigned int>("component"))

{
  addMooseVariableDependency(&mooseVariableField());
}



Real
SideFluxArrayVariablePostprocessor::computeQpIntegral()
{

  return (0.25*_u[_qp] -  0.5 *_diffusivity[_qp].asDiagonal() * _grad_u[_qp] * _array_normals[_qp])(_component);
   
}





//obligatory override

Real
SideFluxArrayVariablePostprocessor::computeFaceInfoIntegral(const FaceInfo * const fi)
{
  return 0;
}

bool
SideFluxArrayVariablePostprocessor::hasFaceSide(const FaceInfo & fi, const bool fi_elem_side) const
{
  return false;
}
