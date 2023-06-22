#include "TransientNuclearMaterial.h"

registerMooseObject("pertApp",TransientNuclearMaterial);

InputParameters
TransientNuclearMaterial::validParams()
{
    InputParameters params = NuclearMaterial::validParams();
    
    params.addRequiredParam<RealEigenVector>("inverse_v","inverse velocities of the neutron groups");
    params.addRequiredParam<RealEigenVector>("delayed_spectrum","energy spectrum of delayed fission neutrons");
    params.addRequiredParam<RealEigenVector>("delayed_fraction","fraction of precursors in each delayed group");
    params.addRequiredParam<RealEigenVector>("decay_constants","decay constants for the various delayed groups");
    
    
    return params;
}

TransientNuclearMaterial::TransientNuclearMaterial(const InputParameters & parameters) :
    NuclearMaterial(parameters),
    _v_inverse_v(     getParam<RealEigenVector>("inverse_v")),
    _v_delayed_spectrum(         getParam<RealEigenVector>("delayed_spectrum")),
    _v_delayed_fraction(      getParam<RealEigenVector>("delayed_fraction")),
    _v_decay_constants(             getParam<RealEigenVector>("decay_constants")),

    _inverse_v(       declareProperty<RealEigenVector>("inverse_v")),
    _delayed_spectrum(           declareProperty<RealEigenVector>("delayed_spectrum")),
    _delayed_fraction(           declareProperty<RealEigenVector>("delayed_fraction")),
    _decay_constants(    declareProperty<RealEigenVector>("decay_constants")),
    _prec_tcoeff(    declareProperty<RealEigenVector>("prec_tcoeff"))
{
}


void TransientNuclearMaterial::computeQpProperties()
{
    NuclearMaterial::computeQpProperties();
    _chi_nu_sigma_f[_qp] = (1 - (_v_delayed_fraction).sum()) * _chi_nu_sigma_f[_qp];
    _inverse_v[_qp]       = _v_inverse_v;
    _delayed_spectrum[_qp]           = _v_delayed_spectrum;
    _delayed_fraction[_qp]           =  _v_delayed_fraction;
    _decay_constants[_qp]    = _v_decay_constants ;
    _prec_tcoeff[_qp]  = MatrixXf::Constant(_v_decay_constants.size(), 1, 1);
}