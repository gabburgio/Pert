[Mesh]
file = twozone.msh
[]


[Variables]
[./flux]
    type = ArrayMooseVariable
    components = 2
    initial_condition = '1.5 1.5'
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
[./third_pp]
    type = ElementIntegralArrayVariablePostprocessor
    variable = flux
    execute_on = 'LINEAR NONLINEAR'
    component = 0
[]
[./fourth_pp]
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
        ref_diffusivity = '1.30646E+00 8.27501E-01'
        ref_sigma_r = '1.11061E-02 3.98377E-02'
        ref_nu_sigma_f = '-9.62345E-03 -8.10772E-02'
        chi = '1 0'
        ref_k = 0.8
        ref_sigma_s = '-3.24191E-01 -5.16796E-03 
                       -3.69005E-04 -4.43029E-01'
        ref_phi_mg = '1.195E+10 3.32211E+13'
        zone_integrators = 'first_pp second_pp'
        block = 'domain'
    []
    [dd]
    type = SPHMaterial
    ref_diffusivity = '2 2'
    ref_sigma_r = '2 2'
    ref_nu_sigma_f = '2 2'
    chi = '2 0'
    ref_k = 1
    ref_sigma_s = '0 -2
                    -2 0'
    ref_phi_mg = '-2 -2'
    zone_integrators = 'third_pp fourth_pp'
    block = 'sotto'
    []
[]


[Executioner]
type = Steady
solve_type = 'PJFNK'
[]

[Outputs]
exodus = true
[]