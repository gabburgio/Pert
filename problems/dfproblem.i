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
    type = SideIntegralVariablePostprocessor
    variable = flux
    
[]

[BCs]
[./vacBC]
    type = DFArrayVacuumBC
    boundary = 'boundary'
    total_integrators = 'first_pp second_pp'
    surface_integrators = 
    ref_current_integral = 
    ref_phi_g = 
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
    [a]
        type = GenericConstantArray
        prop_name = diffusivity
        prop_value = '5.31164E-01 6.24872E-01'
    []
    [b]
        type =GenericConstantArray
        prop_name = sigma_r
        prop_value = '2.70473E-02 1.94181E-01'
    []
    [c]
        type =GenericConstant2DArray
        prop_name = sigma_s
        prop_value =  '0 -9.21474E-03
                    -6.53093E-05 0'
    []
    [d]
        type =GenericConstant2DArray
        prop_name = chi_nu_sigma_f
        prop_value = '-5.22795E-02 -4.12232E-01
                        0   0'
    []
[]


[Executioner]
type = Steady
solve_type = 'PJFNK'
[]

[Outputs]
exodus = true
[]