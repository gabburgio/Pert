#include "Function.h"
#include "FunctionNuclearMaterial.h"

registerMooseObject("pertApp", FunctionNuclearMaterial);


InputParameters FunctionNuclearMaterial::validParams()
{
  InputParameters params = Material::validParams();
  params.addParam<std::vector<FunctionName>>("diffusivity_functions", "Diffusion coefficient interpolation");
  params.addParam<std::vector<FunctionName>>("removal_functions", "Removal cross section interpolation");
  params.addParam<unsigned int>("group_number", "___");


  return params;
}

FunctionNuclearMaterial::FunctionNuclearMaterial(const InputParameters & parameters): Material(parameters),
    _group_number(getParam<unsigned int>("group_number")),
    _removal_functions(getParam<std::vector<FunctionName>>("removal_functions")), 
    _diffusivity_functions(getParam<std::vector<FunctionName>>("diffusivity_functions")),
    _diffusivity(declareProperty<RealEigenVector>("diffusivity")),
    _sigma_r(declareProperty<RealEigenVector>("sigma_r"))
{
}

void FunctionNuclearMaterial::computeQpProperties()
{
    _diffusivity[_qp].resize(_group_number);
    _sigma_r[_qp].resize(_group_number);

    for(int i=0; i<_group_number; ++i)
    {
        _diffusivity[_qp][i] =  getFunctionByName(_diffusivity_functions[i]).value(_t, _q_point[_qp]);
        _sigma_r[_qp][i] =  getFunctionByName(_removal_functions[i]).value(_t, _q_point[_qp]);
    }

}

