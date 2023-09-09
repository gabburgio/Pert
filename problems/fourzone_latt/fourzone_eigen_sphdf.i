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
    nu_sigma_f = '0.01214952 0.03188104'
    diffusivity = '1.18230054 0.15003659'
    sigma_r = '0.0232834  0.03876317'
    chi = '1.00000E+00 0.00000E+00'
    sigma_s = '0  0.00013562; 0.013747 0'
[]
[./internal_u]
    type = NuclearMaterial
    block = 'norm_ur norm_ll'
    nu_sigma_f = '0.01848024 0.05171939'
    diffusivity = '1.76362931 0.16304662'
    sigma_r = '0.02804067 0.04391361'
    chi = '1.00000E+00 0.00000E+00'
    sigma_s = '0 0.00015979;0.01770816 0'
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