#pragma once

#include "GeneralUserObject.h"

class SPHFactorsUserObject;

class NormalizationFactorsUserObject : public GeneralUserObject

{
public:
  static InputParameters validParams();

  NormalizationFactorsUserObject(const InputParameters & parameters);


virtual void initialize() override {}
virtual void execute() override {}
virtual void finalize() override {}


RealEigenVector getNormalizationFactors();

protected:

std::vector<UserObjectName> _SPH_user_objects;
//std::vector<SPHFactorsUserObject> UO_vector;
std::vector<std::reference_wrapper<SPHFactorsUserObject>> UO_vector; // Use std::reference_wrapper

RealEigenVector _ref_integrals;
RealEigenVector _current_integrals;



};
