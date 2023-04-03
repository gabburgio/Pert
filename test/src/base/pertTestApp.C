//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html
#include "pertTestApp.h"
#include "pertApp.h"
#include "Moose.h"
#include "AppFactory.h"
#include "MooseSyntax.h"
#include "ModulesApp.h"

InputParameters
pertTestApp::validParams()
{
  InputParameters params = pertApp::validParams();
  return params;
}

pertTestApp::pertTestApp(InputParameters parameters) : MooseApp(parameters)
{
  pertTestApp::registerAll(
      _factory, _action_factory, _syntax, getParam<bool>("allow_test_objects"));
}

pertTestApp::~pertTestApp() {}

void
pertTestApp::registerAll(Factory & f, ActionFactory & af, Syntax & s, bool use_test_objs)
{
  pertApp::registerAll(f, af, s);
  if (use_test_objs)
  {
    Registry::registerObjectsTo(f, {"pertTestApp"});
    Registry::registerActionsTo(af, {"pertTestApp"});
  }
}

void
pertTestApp::registerApps()
{
  registerApp(pertApp);
  registerApp(pertTestApp);
}

/***************************************************************************************************
 *********************** Dynamic Library Entry Points - DO NOT MODIFY ******************************
 **************************************************************************************************/
// External entry point for dynamic application loading
extern "C" void
pertTestApp__registerAll(Factory & f, ActionFactory & af, Syntax & s)
{
  pertTestApp::registerAll(f, af, s);
}
extern "C" void
pertTestApp__registerApps()
{
  pertTestApp::registerApps();
}
