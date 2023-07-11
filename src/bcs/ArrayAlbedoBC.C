#include "ArrayAlbedoBC.h"

registerMooseObject("pertApp", ArrayAlbedoBC);

InputParameters
ArrayAlbedoBC::validParams()
{
  InputParameters params = ArrayIntegratedBC::validParams();

  params.addRequiredParam<RealEigenMatrix>("albedo_matrix","(incoming current in group i)/(outgoing current in group j)");
  params.addRequiredParam<MaterialPropertyName>("diffusivity", "____");

  return params;
}

ArrayAlbedoBC::ArrayAlbedoBC(const InputParameters & parameters)
  : ArrayIntegratedBC(parameters),
    _array_normals(_assembly.mappedNormals()),
    _grad_u(_var.gradSln()),
    _diffusivity(getMaterialProperty<RealEigenVector>("diffusivity")),
    _albedo_matrix(getParam<RealEigenMatrix>("albedo_matrix"))

{
}


void
ArrayAlbedoBC::computeQpResidual(RealEigenVector & residual)
{
  auto one = Eigen::MatrixXd::Identity(_diffusivity.size(),_diffusivity.size());

  //(A - Id)* (1/4 Phi - 1/2 D dPhi / dn)  cfr. Stacey 76

  residual = ((_albedo_matrix - one) * ( 0.25*_u[_qp] + 0.5*_diffusivity[_qp].asDiagonal() * _grad_u[_qp] * _array_normals[_qp]) ) * _test[_i][_qp];

}

