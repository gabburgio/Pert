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
    nu_sigma_f = '-0.0121431 -0.0318641'
    diffusivity = '1.18167612 0.14995689'
    sigma_t = '0.0232711  0.03874258'
    chi = '1.00000E+00 0.00000E+00'
    sigma_s = '0 0.00013555; 0.01373974 0'
[]
[./internal_u]
    type = NuclearMaterial
    block = 'norm_ur norm_ll'
    nu_sigma_f = '-0.01847052 -0.05169175'
    diffusivity = '1.76270207 0.16295949'
    sigma_t = '0.02802592 0.04389014'
    chi = '1.00000E+00 0.00000E+00'
    sigma_s = '0 0.0001597;0.01769885 0'
[]
[../]

[BCs]
[./abc]    
    type = ArrayVacuumBC
    variable = 'flux'
    boundary = 'boundary'
    alpha = '0.7242198  0.20256749'
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