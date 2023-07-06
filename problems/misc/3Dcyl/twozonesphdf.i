[Mesh]
file = largecyl.msh
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
[./int_volume_0]
    type = ElementIntegralArrayVariablePostprocessor
    variable = flux
    execute_on = 'LINEAR'
    component = 0
    block = internal_u
[]
[./int_volume_1]
    type = ElementIntegralArrayVariablePostprocessor
    variable = flux
    execute_on = 'LINEAR'
    component = 1
    block = internal_u
[]
[./ext_volume_0]
    type = ElementIntegralArrayVariablePostprocessor
    variable = flux
    execute_on = 'LINEAR'
    component = 0
    block = external_u
[]
[./ext_volume_1]
    type = ElementIntegralArrayVariablePostprocessor
    variable = flux
    execute_on = 'LINEAR'
    component = 1
    block = external_u
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

[BCs]
[./vacBC]
    variable = flux
    type = DFArrayVacuumBC
    boundary = 'boundary'
    #total_integrators = 'ext_volume_0 ext_volume_1'
    total_integrators = 'full_volume_0 full_volume_1'
    surface_integrators = 'surf_0 surf_1'
    ref_current_integral = '2061.9862 343.899'
    ref_phi_g = '321699  44745.83'
[]
[]

[Materials]
[./internal_u]
    type = SPHDFMaterial
    block = 'internal_u'
    ref_nu_sigma_f = '0.00000E+00 0.00000E+00'
    ref_diffusivity = '1.31099E+00 8.86690E-01'
    ref_sigma_r = '6.21810E-03 3.89226E-04'
    chi = '0.00000E+00 0.00000E+00'
    ref_sigma_s = '0 -3.03035E-04; -6.17165E-03 0'
    total_integrators = 'full_volume_0 full_volume_1'
    zone_integrators = 'int_volume_0 int_volume_1'
    ref_k = 1.00291
    ref_phi_g = '321699  44745.83'
    ref_phi_mg = '264487.251 34428.718'
[]
[./external_u]
	type = SPHDFMaterial
	block = 'external_u'
	ref_nu_sigma_f = '-9.62823E-03 -8.10872E-02'
	ref_diffusivity = '1.30645E+00 8.27522E-01'
	ref_sigma_r = '1.11069E-02 3.98384E-02'
	chi = '1.00000E+00 0.00000E+00'
	ref_sigma_s = '0 -3.66742E-04; -5.16626E-03 0'
    total_integrators = 'full_volume_0 full_volume_1'
    zone_integrators = 'ext_volume_0 ext_volume_1'
    ref_k = 1.00291
    ref_phi_g = '321699   44745.83'
    ref_phi_mg = '57211.60 10317.11'
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
    value = '8.418  1.095'
    block = internal_u
[]
[externalIC]
    type = ArrayConstantIC
    variable = flux
    value =' 0.1971 0.0355'
    block = external_u
[]
[]


[Executioner]
type = Steady
solve_type = 'PJFNK'
[]

[Outputs]
exodus = true
[]