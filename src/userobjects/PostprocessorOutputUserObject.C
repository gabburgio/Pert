#include "PostprocessorOutputUserObject.h"



registerMooseObject("pertApp", PostprocessorOutputUserObject);

InputParameters
PostprocessorOutputUserObject::validParams()
{
  InputParameters params = GeneralUserObject::validParams();
  
  params.addRequiredParam<RealEigenVector>("ref_total_integrals", "___");
  params.addRequiredParam<RealEigenVector>("ref_surface_integrals", "___");
  params.addRequiredParam<RealEigenMatrix>("ref_zone_integrals", "___");

  params.addRequiredParam<std::vector<PostprocessorName>>("total_integrators", "___");
  params.addRequiredParam<std::vector<PostprocessorName>>("zone_integrators", "___");    
  params.addRequiredParam<std::vector<PostprocessorName>>("surface_integrators","___");
  return params;
}

PostprocessorOutputUserObject::PostprocessorOutputUserObject(const InputParameters & parameters)
  : GeneralUserObject(parameters),
  _ref_total_integrals(   getParam<RealEigenVector>("ref_total_integrals")),
  _ref_surface_integrals(   getParam<RealEigenVector>("ref_surface_integrals")),
  _ref_zone_integrals(   getParam<RealEigenMatrix>("ref_zone_integrals")),

  _zone_integrators(  getParam<std::vector<PostprocessorName>>("zone_integrators")),
  _surface_integrators( getParam<std::vector<PostprocessorName>>("surface_integrators")),
  _total_integrators(  getParam<std::vector<PostprocessorName>>("total_integrators"))

{
}


void PostprocessorOutputUserObject::execute()
{

int zones_number = std::size(_zone_integrators)/std::size(_total_integrators);
int group_number = std::size(_total_integrators);

for(int i =0; i< zones_number ; ++i)
{

RealEigenVector zone_integral = RealEigenVector::Zero(group_number);

for(int j = 0; j< group_number; ++j)
    {
        zone_integral(j) = getPostprocessorValueByName(_zone_integrators[ i*group_number + j]); 
    }

  std::cout<< "zone integral = " << zone_integral  << std::endl;
  std::cout<< "reference zone integrals = " << _ref_zone_integrals.row(i) << std::endl;
  std::cout<< "sph factors = " << (_ref_zone_integrals.row(i)).cwiseQuotient(zone_integral) << std::endl;

}


RealEigenVector total_integrals = RealEigenVector::Zero(std::size(_total_integrators));
for (int i =0; i<group_number; ++i)
    total_integrals(i) = getPostprocessorValueByName(_total_integrators[i]);


std::cout<< "total integrals = " << total_integrals << std::endl;
std::cout<< "ref total integrals = " << _ref_total_integrals << std::endl;
std::cout<< "normalization factors = " << total_integrals.cwiseQuotient(_ref_total_integrals) <<std::endl;




RealEigenVector surface_integrals = RealEigenVector::Zero(std::size(_surface_integrators));

for (int j = 0; j< std::size(_surface_integrators); j++)
{
  surface_integrals(j) = getPostprocessorValueByName(_surface_integrators[j]); 
}

std::cout<< "surface integrals = " << surface_integrals << std::endl;
std::cout<< "ref surface integrals = " << _ref_surface_integrals << std::endl;


}

