[Mesh]
file = fourzone.msh
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
    extra_matrix_tags = 'eigen'
[]
[]



[Materials]
[./external_u]
    type = NuclearMaterial
    block = 'control_ul control_lr'
    nu_sigma_f = '1.43370E-02 3.32368E-02'
    diffusivity = '1.39517E+00 1.56417E-01'
    sigma_r = '2.74755E-02 4.04116E-02'
    chi = '1.00000E+00 0.00000E+00'
    sigma_s = '0 1.41390E-04; 1.62221E-02 0'
[]
[./test]
    type = UserObjectMaterial
    user_object = aa
    cross_section = 1
    ref_int = 1
[]
[./internal_u]
    type = NuclearMaterial
    block = 'norm_ur norm_ll'
    nu_sigma_f = '1.66881E-02 5.03533E-02'
    diffusivity = '1.59260E+00 1.58740E-01'
    sigma_r = '2.53214E-02 4.27537E-02'
    chi = '1.00000E+00 0.00000E+00'
    sigma_s = '0 1.55568E-04; 1.59909E-02 0'
[]
[../]

[BCs]
[./abc]    
    type = ArrayVacuumBC
    variable = 'flux'
    boundary = 'boundary'
[]
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

[UserObjects]
[./aa]
    type = ArrayElementIntegralUserObject
    var_size = 2
    variable = flux
    execute_on = 'LINEAR'
[]
[]

[Postprocessors]
[./a]
    type = ElementIntegralArrayVariablePostprocessor
    variable = flux
    component = 0
    execute_on = 'LINEAR'
[]
[./b]
    type = ElementIntegralArrayVariablePostprocessor
    variable = flux
    component = 1
    execute_on = 'LINEAR'
[]
[./c]
    type = ElementIntegralMaterialProperty
    mat_prop = cross_section
[]
[]

[Variables]
[./flux]
    type = ArrayMooseVariable
    components = 2
[../]
[]


[Executioner]
type = Eigenvalue
[]

[Outputs]
exodus = true
[]