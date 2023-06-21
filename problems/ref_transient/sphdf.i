[Mesh]
file = cube.msh
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
[./third_pp]
    type = SideIntegralArrayVariablePostprocessor
    variable = flux
    component = 0    
    execute_on = 'LINEAR'
    boundary = 'boundary'
[]
[./fourth_pp]
    type = SideIntegralArrayVariablePostprocessor
    variable = flux
    component = 1
    execute_on = 'LINEAR'
    boundary = 'boundary'    
[]
[]


[Materials]
[./mate]
    type = SPHDFMaterial
    ref_diffusivity = '1.72532E+00 1.56049E-01'
    ref_nu_sigma_f = '-1.20830E-02 -2.76223E-02'
    ref_sigma_r = '2.92964E-02 3.20223E-02'
    ref_sigma_s = '0 -1.21721E-04;
                -2.23871E-02 0'
    ref_phi_g = '1600 1023.94'
    ref_phi_mg = '1600 1023.94'
    total_integrators = 'first_pp second_pp'
    zone_integrators = 'first_pp second_pp'
    ref_k = 0.7504
    chi = '1 0'
[]
[]

[Variables]
[./flux]
    type = ArrayMooseVariable
    components = 2
    initial_condition = '1 0.6399'
[../]
[]


[Executioner]
type = Steady
solve_type = 'PJFNK'
[]

[Outputs]
exodus = true
[]