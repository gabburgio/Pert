[Mesh]
file = cube.msh
[]

[Kernels]
[time]
    type = ArrayTimeDerivative 
    variable = flux 
    time_derivative_coefficient  = inverse_v
[]    
[diffusion]
    type = ArrayDiffusion 
    variable = flux 
    diffusion_coefficient = diffusivity
[]
[absorption]
    type = ArrayReaction
    variable = flux
    reaction_coefficient = sigma_r
[]
[scattering]
    type = ArrayReaction
    variable = flux
    reaction_coefficient = sigma_s
[]
[fission]
    type = ArrayReaction
    variable = flux
    reaction_coefficient = chi_nu_sigma_f
[]
[delayed_production]
    type = PrecursorDecay
    variable = flux
    concentrations = precs
    decay_constants = decay_constants
    delayed_spectrum = delayed_spectrum
[]
[precs_tder]
    type = ArrayTimeDerivative
    variable = precs
    time_derivative_coefficient = prec_tcoeff
[]
[precs_decay]
    type = ArrayReaction
    variable = precs
    reaction_coefficient = decay_constants
[]
[precs_source]
    type = PrecursorProduction
    variable = precs
    flux = flux
    delayed_fraction = delayed_fraction
    chi_nu_sigma_f = chi_nu_sigma_f    
[]
[]

[Materials]
[./10]
    type = TransientNuclearMaterial
    block = 'domain'
    nu_sigma_f = '5.19417E-02 1.47749E+00'
    #nu_sigma_f = '5.19417E-02 1.67749E+00'
    chi = '1.00000E+00 0.00000E+00'
    diffusivity = '1.16299E-01 1.96645E-02'
    sigma_r = '5.08506E-01 1.28397E+00'
    sigma_s = '0 4.75265E-03; 3.95622E-01 0'
    inverse_v = '8.20209E-07 0.00010'
    decay_constants = '1.33461E-02  3.26661E-02 1.20943E-01  3.04465E-01 8.56396E-01 2.87596E+00'
    delayed_spectrum = '1 0'
    delayed_fraction = '2.25342E-04 1.17948E-03 1.13041E-03 2.58359E-03 1.11298E-03 4.65734E-04 '

[]
[]

[Postprocessors]
[./first_pp]
    type = ElementIntegralArrayVariablePostprocessor
    variable = flux
    component = 0
[]
[./second_pp]
    type = ElementIntegralArrayVariablePostprocessor
    variable = flux
    component = 1
[]
[./third_pp]
    type = ElementIntegralArrayVariablePostprocessor
    variable = precs
    component = 0
[]
[./fourth_pp]
    type = ElementIntegralArrayVariablePostprocessor
    variable = precs
    component = 1
[]
[./fifth_pp]
    type = ElementIntegralArrayVariablePostprocessor
    variable = precs
    component = 2
[]
[./sixth_pp]
    type = ElementIntegralArrayVariablePostprocessor
    variable = precs
    component = 3
[]
[./seventh_pp]
    type = ElementIntegralArrayVariablePostprocessor
    variable = precs
    component = 4
[]
[./eight_pp]
    type = ElementIntegralArrayVariablePostprocessor
    variable = precs
    component = 5
[]

[]

[Variables]
[./flux]
    type = ArrayMooseVariable
    components = 2
    initial_condition = '1 0.308176'
[../]
[./precs]
    type = ArrayMooseVariable
    components= 6
    initial_condition = '0.1 0.1 0.1 0.1 0.1 0.1'
[]
[]


[Executioner]
type = Transient
dt = 0.0001
end_time = 0.003
[]

[Outputs]
exodus = true
[]