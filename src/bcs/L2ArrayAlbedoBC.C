#include "L2ArrayAlbedoBC.h"

registerMooseObject("pertApp", L2ArrayAlbedoBC);

InputParameters
L2ArrayAlbedoBC::validParams()
{
  InputParameters params = ArrayIntegratedBC::validParams();
  params.addRequiredParam<RealEigenMatrix>("albedo_matrix","(incoming current in group i)/(outgoing current in group j)");
  return params;
}

L2ArrayAlbedoBC::L2ArrayAlbedoBC(const InputParameters & parameters)
  : ArrayIntegratedBC(parameters),
    _albedo_matrix(getParam<RealEigenMatrix>("albedo_matrix"))

{
    auto one = Eigen::MatrixXd::Identity(_albedo_matrix.rows(), _albedo_matrix.cols() );
    _corrective_matrix = 0.5*( ((one + _albedo_matrix).inverse()) * (one - _albedo_matrix) );
}


void
L2ArrayAlbedoBC::computeQpResidual(RealEigenVector & residual)
{

  residual = (_corrective_matrix *_u[_qp]) * _test[_i][_qp];

}


RealEigenVector
L2ArrayAlbedoBC::computeQpJacobian()
{
  return _phi[_j][_qp] * _test[_i][_qp] * _corrective_matrix.diagonal();
}



RealEigenMatrix
L2ArrayAlbedoBC::computeQpOffDiagJacobian(const MooseVariableFEBase & jvar)
{
  if (jvar.number() == _var.number())
  return _phi[_j][_qp] * _test[_i][_qp] * _corrective_matrix;
  else
    return RealEigenMatrix::Zero(_var.count(), jvar.count());

}