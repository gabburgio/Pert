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

[BCs]
[./vacBC]
    variable = flux
    type = DFArrayVacuumBC
    boundary = 'boundary'
    total_integrators = 'first_pp second_pp'
    surface_integrators = 'third_pp fourth_pp'
    ref_current_integral = '2.279271E-02 4.30124E-07'
    ref_phi_g = '1 5.45E-04'
[]
[]


[Materials]
[./mate]
    type = SPHDFMaterial
    ref_diffusivity = ' 5.88099E-01 6.37020E-01'
    ref_nu_sigma_f = '-4.72646E-02 -3.37123E-01'
    ref_sigma_r = '2.56339E-02 1.65331E-01'
    ref_sigma_s =  '0 -1.29020E-03
                    -9.05288E-05 0'
    ref_phi_g = '1 5.45E-04'
    ref_phi_mg = '1 5.45E-04'
    total_integrators = 'first_pp second_pp'
    zone_integrators = 'first_pp second_pp'
    ref_k = 1
    chi = '1 0'
[]
[]


[Executioner]
type = Steady
solve_type = 'PJFNK'
[]

[Outputs]
exodus = true
[]