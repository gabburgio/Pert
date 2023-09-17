#include "NormalizationFactorsUserObject.h"
#include "SPHFactorsUserObject.h"
#include "OutputUserObject.h"



registerMooseObject("pertApp", OutputUserObject);

InputParameters
OutputUserObject::validParams()
{
  InputParameters params = GeneralUserObject::validParams();
  params.addRequiredParam<std::vector<UserObjectName>>("SPH_uo_names", "___");    
  params.addRequiredParam<RealEigenVector>("ref_surface_integrals", "___");
  params.addRequiredParam<std::vector<PostprocessorName>>("surface_integrators","___");
  params.addRequiredParam<UserObjectName>("normalization_uo_name", "___");
  return params;
}

OutputUserObject::OutputUserObject(const InputParameters & parameters)
  : GeneralUserObject(parameters),
  _ref_surface_integrals(   getParam<RealEigenVector>("ref_surface_integrals")),
  _SPH_uo_names(  getParam<std::vector<UserObjectName>>("SPH_uo_names")),
  _surface_integrators( getParam<std::vector<PostprocessorName>>("surface_integrators")),
  _normalization_uo_name(  getParam<UserObjectName>("normalization_uo_name"))

{
  for(int i =0; i<std::size(_SPH_uo_names); ++i)
  {
    SPH_user_objects.push_back( getUserObjectByName<SPHFactorsUserObject>(_SPH_uo_names[i]));
  }
  _normalization_user_object = &getUserObjectByName<NormalizationFactorsUserObject>(_normalization_uo_name);
  
}


void OutputUserObject::execute()
{


RealEigenVector normalization_factors = (*_normalization_user_object).getNormalizationFactors();


for(int i =0; i<std::size(SPH_user_objects); ++i)
{
  RealEigenVector zone_integral = SPH_user_objects[i].get().getIntegrals();
  RealEigenVector sph_factors = SPH_user_objects[i].get().getValue();
  RealEigenVector ref_integrals = SPH_user_objects[i].get().getRefValue();
  std::cout  << std::endl;
  std::cout<< "sph factors of " << _SPH_uo_names[i] << " = "<< sph_factors << std::endl;
  //std::cout<< "reference zone integrals = " << ref_integrals << std::endl;
}

//std::cout<< "total integrals = " << (*_normalization_user_object).getIntegrals() << std::endl;
std::cout<< "normalization factors  = " << (*_normalization_user_object).getNormalizationFactors() << std::endl;
//std::cout<< "ref total integrals = " << _ref_total_integrals << std::endl;


RealEigenVector surface_integrals = RealEigenVector::Zero(std::size(_surface_integrators));

for (int j = 0; j< std::size(_surface_integrators); j++)
{ 
  std::cout<< "surface integral of "  << _surface_integrators[j] << " = " << getPostprocessorValueByName(_surface_integrators[j]) << std::endl;

}
}
