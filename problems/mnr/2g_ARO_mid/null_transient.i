[Mesh]
file = mnr_active.msh
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


[Variables]
[./flux]
    type = ArrayMooseVariable
    components = 2
    initial_from_file_var = flux
    initial_from_file_timestep = 1    
[../]
[./precs]
    type = ArrayMooseVariable
    components= 6
    #initial_from_file_var = precs
    #initial_from_file_timestep = 1
    initial_condition = '2.29313738e-07 4.90383216e-07 1.26939726e-07 1.15246707e-07 1.76504196e-08 2.19936549e-09'
[]
[]


[Executioner]
type = Transient
dt = 0.0001
end_time = 0.001
[]

[Outputs]
[norm]
type = Exodus
[]
[pp]
type = CSV
[]
[]



[Postprocessors]
[./flux_0]
    type = ElementIntegralArrayVariablePostprocessor
    variable = flux
    component = 0
[]
[./flux_1]
    type = ElementIntegralArrayVariablePostprocessor
    variable = flux
    component = 1
[]
[./precs_0]
    type = ElementIntegralArrayVariablePostprocessor
    variable = precs
    component = 0
[]
[./precs_1]
    type = ElementIntegralArrayVariablePostprocessor
    variable = precs
    component = 1
[]
[./precs_2]
    type = ElementIntegralArrayVariablePostprocessor
    variable = precs
    component = 2
[]
[./precs_3]
    type = ElementIntegralArrayVariablePostprocessor
    variable = precs
    component = 3
[]
[./precs_4]
    type = ElementIntegralArrayVariablePostprocessor
    variable = precs
    component = 4
[]
[./precs_5]
    type = ElementIntegralArrayVariablePostprocessor
    variable = precs
    component = 5
[]
[]
