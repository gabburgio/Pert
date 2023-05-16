[Mesh]
file = rectangle.msh
[]

[Kernels]
[diffusion]
    type = ArrayDiffusion 
    variable = flux 
    diffusion_coefficient = sphdf_diffusivity
[]
[absorption]
    type = ArrayReaction
    variable = flux
    reaction_coefficient = sphdf_sigma_r
[]
[scattering]
    type = ArrayReaction
    variable = flux
    reaction_coefficient = sphdf_sigma_s
[]
[fission]
    type = ArrayReaction
    variable = flux
    reaction_coefficient = sphdf_chi_nu_sigma_f
[]
[]

[Postprocessors]
[./first_pp]
    type = ElementIntegralArrayVariablePostprocessor
    variable = flux
    execute_on = 'LINEAR'
    component = 0
[]
[./second_pp]
    type = ElementIntegralArrayVariablePostprocessor
    variable = flux
    execute_on = 'LINEAR '
    component = 1
[]
[]


[Materials]
[./mate]
    type = SPHDFMaterial
    ref_diffusivity = ' 1.88477E+00 1.55265E-01'
    ref_nu_sigma_f = '-1.13493E-02  -2.38874E-02'
    ref_sigma_r = '2.82389E-02 3.02821E-02'
    ref_sigma_s =  '0 -1.07259E-04;
                    -2.17199E-02 0'
    ref_phi_g = '160 114.78'
    ref_phi_mg = '160 114.78'
    total_integrators = 'first_pp second_pp'
    zone_integrators = 'first_pp second_pp'
    ref_k = 1.0116
    chi = '1 0'
[]
[]

[Variables]
[./flux]
    type = ArrayMooseVariable
    components = 2
    initial_condition = '1 0.717'
[../]
[]


[Executioner]
type = Steady
solve_type = 'PJFNK'
[]

[Outputs]
exodus = true
[]