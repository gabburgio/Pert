#pragma once

#include "Action.h"

class SPHProblemAction : public Action
{
public:
  SPHProblemAction(const InputParameters & params);

  static InputParameters validParams();

  virtual void act() override;

  std::vector<PostprocessorName> flux_integrators;

  private:

  const unsigned int & _group_number;
  //std::string _flux_name;
};
