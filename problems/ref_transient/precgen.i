[Mesh]
file = cube.msh
[]

[Kernels]
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


[Variables]
[./precs]
    type = ArrayMooseVariable
    components= 6
    initial_condition = '0 0 0 0 0 0'
[]
[]

[AuxVariables]
[./flux]
    type = ArrayMooseVariable
    components = 2
    initial_from_file_var = flux
    initial_from_file_timestep = 1
[../]
[]



[Materials]
[a]
    type = GenericConstantArray
    prop_name = decay_constants
    prop_value = '1.33461E-02  3.26661E-02 1.20943E-01  3.04465E-01 8.56396E-01 2.87596E+00'    
[]
[b]
    type = GenericConstantArray
    prop_name = delayed_spectrum
    prop_value = '1 0'
[]
[c]
    type = GenericConstantArray
    prop_name = delayed_fraction
    prop_value = '2.25342E-04 1.17948E-03 1.13041E-03 2.58359E-03 1.11298E-03 4.65734E-04 '
[]
[d]
    type = GenericConstantArray
    prop_name = prec_tcoeff
    prop_value = '1 1 1 1 1 1'
[]
[]

[Postprocessors]
[./first_pp]
    type = ElementIntegralArrayVariablePostprocessor
    variable = flux
    component = 0
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

[Executioner]
type = Transient
dt = 0.01
end_time = 1
[]

[Outputs]
file_base = eigen_out.e
[norm]
type = Exodus
[]
[pp]
type = CSV
[]
[]