[Mesh]
file = fourzone.msh
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
[./full_volume_0]
    type = ElementIntegralArrayVariablePostprocessor
    variable = flux
    execute_on = 'LINEAR'
    component = 0
[]
[./full_volume_1]
    type = ElementIntegralArrayVariablePostprocessor
    variable = flux
    execute_on = 'LINEAR '
    component = 1
[]
[./control_volume_0]
    type = ElementIntegralArrayVariablePostprocessor
    variable = flux
    execute_on = 'LINEAR'
    component = 0
    block = 'control_ul control_lr'
[]
[./control_volume_1]
    type = ElementIntegralArrayVariablePostprocessor
    variable = flux
    execute_on = 'LINEAR'
    component = 1
    block = 'control_ul control_lr'
[]
[./norm_volume_0]
    type = ElementIntegralArrayVariablePostprocessor
    variable = flux
    execute_on = 'LINEAR'
    component = 0
    block = 'norm_ur norm_ll'
[]
[./norm_volume_1]
    type = ElementIntegralArrayVariablePostprocessor
    variable = flux
    execute_on = 'LINEAR'
    component = 1
    block = 'norm_ur norm_ll'
[]
[./surf_0]
    type = SideIntegralArrayVariablePostprocessor
    variable = flux
    component = 0    
    execute_on = 'LINEAR'
    boundary = 'boundary'
[]
[./surf_1]
    type = SideIntegralArrayVariablePostprocessor
    variable = flux
    component = 1
    execute_on = 'LINEAR'
    boundary = 'boundary'    
[]
[]

#[UserObjects]
#[./output]
#    type = PostprocessorOutputUserObject
#    ref_surface_integrals = '23.12 1.614' 
#    ref_total_integrals = '3600 1343.122' 
#    ref_zone_integrals = '1253.55 504.234; 2346.4 838.887'
#    total_integrators = 'full_volume_0 full_volume_1'
#    zone_integrators = 'control_volume_0 control_volume_1'
#    surface_integrators = 'surf_0 surf_1'
#    execute_on = 'NONLINEAR'
#[]
#[]



[BCs]
[./vacBC]
    variable = flux
    type = DFArrayVacuumBC
    boundary = 'boundary'
    total_integrators = 'full_volume_0 full_volume_1'
    surface_integrators = 'surf_0 surf_1'
    ref_current_integral = '23.12 1.614'
    ref_phi_g = '3600 1343.122'
[]
[]

[Materials]
[./internal_u]
    type = SPHDFMaterial
    block = 'control_ul control_lr'
	ref_nu_sigma_f = '1.43370E-02 3.32368E-02'
	ref_diffusivity = '1.39517E+00 1.56417E-01'
	ref_sigma_r = '2.74755E-02 4.04116E-02'
	chi = '1.00000E+00 0.00000E+00'
    ref_sigma_s = '0 1.41390E-04; 1.62221E-02 0'
    total_integrators = 'full_volume_0 full_volume_1'
    zone_integrators = 'control_volume_0 control_volume_1'
    ref_k = 0.995
    ref_phi_g = '3600 1343.122'
    ref_phi_mg = '1253.55 504.234'
[]
[./external_u]
    type = SPHDFMaterial
    block = 'norm_ur norm_ll'
	ref_nu_sigma_f = '1.66881E-02 5.03533E-02'
	ref_diffusivity = '1.59260E+00 1.58740E-01'
	ref_sigma_r = '2.53214E-02 4.27537E-02'
	chi = '1.00000E+00 0.00000E+00'
	ref_sigma_s = '0 1.55568E-04; 1.59909E-02 0'
    total_integrators = 'full_volume_0 full_volume_1'
    zone_integrators = 'norm_volume_0 norm_volume_1'
    ref_k = 0.995
    ref_phi_g = '3600 1343.122'
    ref_phi_mg = '2346.4 838.887'
[]
[]

[Variables]
[./flux]
    type = ArrayMooseVariable
    components = 2
[../]
[]

[ICs]
[internalIC]
    type = ArrayConstantIC
    variable = flux
    value = '1.303 0.466'
    block = 'norm_ur norm_ll'
[]
[externalIC]
    type = ArrayConstantIC
    variable = flux
    value = '0.6964 0.28'
    block = 'control_ul control_lr'
[]
[]


[Executioner]
type = Steady
solve_type = 'PJFNK'
[]

[Outputs]
exodus = true
[]