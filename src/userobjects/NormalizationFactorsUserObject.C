#include "NormalizationFactorsUserObject.h"
#include "SPHFactorsUserObject.h"


registerMooseObject("pertApp", NormalizationFactorsUserObject);

InputParameters
NormalizationFactorsUserObject::validParams()
{
  InputParameters params = GeneralUserObject::validParams();
  params.addRequiredParam<std::vector<UserObjectName>>("SPH_user_objects", "___");    
  params.addRequiredParam<RealEigenVector>("ref_integrals", "___");

  return params;
}

NormalizationFactorsUserObject::NormalizationFactorsUserObject(const InputParameters & parameters)
  : GeneralUserObject(parameters),
  _ref_integrals(   getParam<RealEigenVector>("ref_integrals")),
  _SPH_user_objects(  getParam<std::vector<UserObjectName>>("SPH_user_objects"))
{
  for(int i =0; i<std::size(_SPH_user_objects); ++i)
  {
    //UO_vector.push_back(std::ref( const_cast<SPHFactorsUserObject &>(getUserObject<SPHFactorsUserObject>(_SPH_user_objects[i])) ));
    UO_vector.push_back( const_cast<SPHFactorsUserObject &>(getUserObjectByName<SPHFactorsUserObject>(_SPH_user_objects[i])) );
  }
  _current_integrals = RealEigenVector::Zero(std::size(_SPH_user_objects));
}

RealEigenVector NormalizationFactorsUserObject::getNormalizationFactors()
{
  for(int i =0; i<std::size(UO_vector); ++i)
  {
    _current_integrals += UO_vector[i].get().getIntegrals();
  }
  
  return _current_integrals;
}
