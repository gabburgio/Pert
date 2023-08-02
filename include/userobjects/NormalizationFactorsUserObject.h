#pragma once

#include "UserObject.h"
#include "Coupleable.h"
#include "TransientInterface.h"

class SPHFactorsUserObject;

class NormalizationFactorsUserObject : public UserObject,
                          public Coupleable,
                          public TransientInterface
{
public:
  static InputParameters validParams();

  NormalizationFactorsUserObject(const InputParameters & parameters);

RealEigenVector getNormalizationFactors();

protected:

std::vector<UserObjectName> _SPH_user_objects;
//std::vector<SPHFactorsUserObject> UO_vector;
std::vector<std::reference_wrapper<SPHFactorsUserObject>> UO_vector; // Use std::reference_wrapper

RealEigenVector _ref_integrals;
RealEigenVector _current_integrals;



};
