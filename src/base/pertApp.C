#include "pertApp.h"
#include "Moose.h"
#include "AppFactory.h"
#include "ModulesApp.h"
#include "MooseSyntax.h"

InputParameters
pertApp::validParams()
{
  InputParameters params = MooseApp::validParams();

  return params;
}

pertApp::pertApp(InputParameters parameters) : MooseApp(parameters)
{
  pertApp::registerAll(_factory, _action_factory, _syntax);
}

pertApp::~pertApp() {}

void
pertApp::registerAll(Factory & f, ActionFactory & af, Syntax & syntax)
{
  ModulesApp::registerAll(f, af, syntax);
  Registry::registerObjectsTo(f, {"pertApp"});
  Registry::registerActionsTo(af, {"pertApp"});

  /* register custom execute flags, action syntax, etc. here */
}

void
pertApp::registerApps()
{
  registerApp(pertApp);
}

/***************************************************************************************************
 *********************** Dynamic Library Entry Points - DO NOT MODIFY ******************************
 **************************************************************************************************/
extern "C" void
pertApp__registerAll(Factory & f, ActionFactory & af, Syntax & s)
{
  pertApp::registerAll(f, af, s);
}
extern "C" void
pertApp__registerApps()
{
  pertApp::registerApps();
}
