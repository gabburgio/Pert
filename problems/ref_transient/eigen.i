[Mesh]
file = cube.msh
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
[./10]
    type = NuclearMaterial
    block = 'domain'
#    nu_sigma_f = '5.19459E-02 1.47750E+00'
#    diffusivity = '1.35300E-01 1.78588E-02'
#    sigma_r = '5.08588E-01 1.28398E+00'
#    sigma_s = '0 4.75244E-03; 3.95691E-01 0'
    nu_sigma_f = '5.19417E-02 1.47749E+00'
    chi = '1.00000E+00 0.00000E+00'
    diffusivity = '1.16299E-01 1.96645E-02'
    sigma_r = '5.08506E-01 1.28397E+00'
    sigma_s = '0 4.75265E-03; 3.95622E-01 0'

[]
[../]


[Variables]
[./flux]
    type = ArrayMooseVariable
    components = 2
[../]
[]


[Executioner]
type = Eigenvalue
initial_eigenvalue = 1
[]

[Outputs]
exodus = true
[]