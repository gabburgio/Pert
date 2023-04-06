#pragma once

#include "Action.h"

class ProblemSetupAction : public Action
{
public:
  ProblemSetupAction(const InputParameters & params);

  static InputParameters validParams();

  virtual void act() override;
};
