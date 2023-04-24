#pragma once

#include "Action.h"

class DiffusionProblemAction : public Action
{
public:
  DiffusionProblemAction(const InputParameters & params);

  static InputParameters validParams();

  virtual void act() override;
};
