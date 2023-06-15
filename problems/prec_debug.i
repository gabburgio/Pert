[Mesh]
file = rectangle.msh
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
[decay]
    type = PrecursorDecay
    variable = flux
    concentrations = precs
    decay_constants = decay_constants
    delayed_spectrum = delayed_spectrum
[]
[precs_decay]
    type = ArrayReaction
    variable = precs
    reaction_coefficient  = decay_constants
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
    nu_sigma_f ='1.20830E-02 2.76223E-02'
    sigma_r = '2.92964E-02 3.20223E-02'
    chi = '1 0'
    sigma_s =  '0 1.21721E-04;
                2.23871E-02 0'
    diffusivity = '1.72532E+00 1.56049E-01'
    inverse_v = '1 1'
    decay_constants = '0.1 0.1'
    delayed_spectrum = '1 0'
    delayed_fraction = '0.003 0.003'
[]
[]

[BCs]
[./abc]    
    type = ArrayVacuumBC
    variable = 'flux'
    boundary = 'boundary'
    alpha = '0.4043 0.2083'
[]
[]

[Variables]
[./flux]
    type = ArrayMooseVariable
    components = 2
    initial_condition = '1 1'
[../]
[./precs]
    type = ArrayMooseVariable
    components= 2
    initial_condition = '1 1'
[]
[]


[Executioner]
type = Transient
dt = 0.1
end_time = 1
[]

[Outputs]
exodus = true
[]