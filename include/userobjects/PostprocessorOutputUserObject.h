#pragma once

#include "GeneralUserObject.h"


class PostprocessorOutputUserObject : public GeneralUserObject

{
public:
  static InputParameters validParams();

  PostprocessorOutputUserObject(const InputParameters & parameters);


virtual void initialize() override {};
virtual void execute() override;
virtual void finalize() override {};



protected:

const std::vector<PostprocessorName> & _zone_integrators;

const std::vector<PostprocessorName> & _total_integrators;
const std::vector<PostprocessorName> & _surface_integrators;



RealEigenVector _ref_total_integrals;
RealEigenMatrix _ref_zone_integrals;
RealEigenVector _ref_surface_integrals;





};
