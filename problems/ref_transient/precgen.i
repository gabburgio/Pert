[Mesh]
file = cube.msh
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
dt = 0.05
end_time = 1
[]

[Outputs]
exodus = true
[]