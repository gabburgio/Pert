[Mesh]
file = onecyl.msh
[]

[Variables]
[./flux]
    type = ArrayMooseVariable
    components = 2
    initial_condition = '1 5.45E-04'
[../]
[]

[Kernels]
[diffusion]
    type = ArrayDiffusion 
    variable = flux 
    diffusion_coefficient = sph_diffusivity
[]
[absorption]
    type = ArrayReaction
    variable = flux
    reaction_coefficient = sph_sigma_r
[]
[scattering]
    type = ArrayReaction
    variable = flux
    reaction_coefficient = sph_sigma_s
[]
[fission]
    type = ArrayReaction
    variable = flux
    reaction_coefficient = sph_chi_nu_sigma_f
[]
[]

[Postprocessors]
[./first_pp]
    type = ElementIntegralArrayVariablePostprocessor
    variable = flux
    execute_on = 'LINEAR NONLINEAR'
    component = 0
[]
[./second_pp]
    type = ElementIntegralArrayVariablePostprocessor
    variable = flux
    execute_on = 'LINEAR NONLINEAR'
    component = 1
[]
[]

[BCs]
[./vacBC]
    type = ArrayVacuumBC
    boundary = 'boundary'
    variable = flux
    alpha = '1 1'
[]
[]


[Materials]
    [external_u]
        type = SPHMaterial
        ref_diffusivity = '5.31164E-01 6.24872E-01'
        ref_sigma_r = '2.70473E-02 1.94181E-01'
        ref_nu_sigma_f = '-5.22795E-02 -4.12232E-01'
        chi = '1 0'
        ref_k = 1.00838
        ref_sigma_s = '0 -9.21474E-03
                       -6.53093E-05 0'
        ref_phi_mg = '1 5.45E-04'
        zone_integrators = 'first_pp second_pp'
        block = 'domain'
    []
[]


[Executioner]
type = Steady
solve_type = 'PJFNK'
[]

[Outputs]
exodus = true
[]