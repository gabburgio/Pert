#pragma once

#include "GeneralUserObject.h"


class SPHFactorsUserObject;
class NormalizationFactorsUserObject;


class OutputUserObject : public GeneralUserObject

{
public:
  static InputParameters validParams();

  OutputUserObject(const InputParameters & parameters);


virtual void initialize() override {};
virtual void execute() override;
virtual void finalize() override {};



protected:

std::vector<UserObjectName> _SPH_uo_names;
std::vector<std::reference_wrapper<const SPHFactorsUserObject>> SPH_user_objects; 

UserObjectName _normalization_uo_name;
const NormalizationFactorsUserObject* _normalization_user_object;

const std::vector<PostprocessorName> & _surface_integrators;


RealEigenVector _ref_surface_integrals;





};
