#include "AlbedoCorrectedArraySideIntegralPostprocessor.h"


registerMooseObject("pertApp", AlbedoCorrectedArraySideIntegralPostprocessor);

InputParameters
AlbedoCorrectedArraySideIntegralPostprocessor::validParams()
{
  InputParameters params = SideIntegralPostprocessor::validParams();
  params.addRequiredCoupledVar("variable",
                               "The name of the array variable which this postprocessor integrates");
  params.addRequiredParam<unsigned int>("component", "the component to integrate");
  params.addRequiredParam<RealEigenMatrix>("albedo_matrix","(incoming current in group i)/(outgoing current in group j)");
  params.addClassDescription("Computes a surface integral of the specified variable component");
  return params;
}

AlbedoCorrectedArraySideIntegralPostprocessor::AlbedoCorrectedArraySideIntegralPostprocessor(
    const InputParameters & parameters)
  : SideIntegralPostprocessor(parameters),
    MooseVariableInterface<RealEigenVector>(
        this, false, "variable", Moose::VarKindType::VAR_ANY, Moose::VarFieldType::VAR_FIELD_ARRAY),
    _u(coupledArrayValue("variable")),
    _component(getParam<unsigned int>("component")),
    _albedo_matrix(getParam<RealEigenMatrix>("albedo_matrix"))


{
  addMooseVariableDependency(&mooseVariableField());
  auto one = Eigen::MatrixXd::Identity(_albedo_matrix.rows(), _albedo_matrix.cols() );
  _corrective_matrix = 0.5*( ((one + _albedo_matrix).inverse()) * (one - _albedo_matrix) );

}



Real
AlbedoCorrectedArraySideIntegralPostprocessor::computeQpIntegral()
{
  return (_corrective_matrix *_u[_qp])(_component);
}





//obligatory override

Real
AlbedoCorrectedArraySideIntegralPostprocessor::computeFaceInfoIntegral(const FaceInfo * const fi)
{
  return 0;
}

bool
AlbedoCorrectedArraySideIntegralPostprocessor::hasFaceSide(const FaceInfo & fi, const bool fi_elem_side) const
{
  return false;
}
