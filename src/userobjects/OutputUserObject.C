#include "NormalizationFactorsUserObject.h"
#include "SPHFactorsUserObject.h"
#include "OutputUserObject.h"

#include <iostream>
#include <fstream> 


registerMooseObject("pertApp", OutputUserObject);

InputParameters
OutputUserObject::validParams()
{
  InputParameters params = GeneralUserObject::validParams();
  params.addRequiredParam<std::vector<UserObjectName>>("SPH_uo_names", "___");    
  params.addRequiredParam<RealEigenVector>("ref_surface_integrals", "___");
  params.addRequiredParam<std::vector<PostprocessorName>>("surface_integrators","___");
  params.addRequiredParam<UserObjectName>("normalization_uo_name", "___");
  return params;
}

OutputUserObject::OutputUserObject(const InputParameters & parameters)
  : GeneralUserObject(parameters),
  _ref_surface_integrals(   getParam<RealEigenVector>("ref_surface_integrals")),
  _SPH_uo_names(  getParam<std::vector<UserObjectName>>("SPH_uo_names")),
  _surface_integrators( getParam<std::vector<PostprocessorName>>("surface_integrators")),
  _normalization_uo_name(  getParam<UserObjectName>("normalization_uo_name"))

{
  for(int i =0; i<std::size(_SPH_uo_names); ++i)
  {
    SPH_user_objects.push_back( getUserObjectByName<SPHFactorsUserObject>(_SPH_uo_names[i]));
  }
  _normalization_user_object = &getUserObjectByName<NormalizationFactorsUserObject>(_normalization_uo_name);
  
}


void OutputUserObject::execute()
{


std::ofstream outputFile("Sphdf_Output.txt");

if (outputFile.is_open()){

outputFile << "normalization factors  = " << (*_normalization_user_object).getNormalizationFactors() << std::endl << std::endl;
outputFile << "sph_factors = {" << std::endl;

for(int i =0; i<std::size(SPH_user_objects); ++i)
{
  RealEigenVector sph_factors = SPH_user_objects[i].get().getValue();

  outputFile << "    '" << _SPH_uo_names[i] << "': np.array([";
  for(int j =0; j<sph_factors.size(); j++){
    outputFile << sph_factors[j];
    if (j == sph_factors.size()-1 )
    {outputFile << "]),";}
    else
    {outputFile << ", ";}
  }
  outputFile << std::endl;
}

outputFile << "}" << std::endl;

// Close the file
outputFile.close();
std::cout << "SPHDF Output file has been written." << std::endl;
} 
else 
{
std::cerr << "Unable to write Output file." << std::endl;
}


for (int j = 0; j< std::size(_surface_integrators); j++)
{ 
  std::cout<< "surface integral of "  << _surface_integrators[j] << " = " << getPostprocessorValueByName(_surface_integrators[j]) << std::endl;
  std::cout<< "gamma factor of "  << _surface_integrators[j] << " = " << _ref_surface_integrals(j)/getPostprocessorValueByName(_surface_integrators[j]) << std::endl;
}


}
