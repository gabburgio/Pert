[Mesh]
file = rectangle.msh
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
    reaction_coefficient = sigma_t
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
    nu_sigma_f ='-1.13493E-02  -2.38874E-02'
    sigma_t = '2.82389E-02 3.02821E-02'
    chi = '1 0'
    sigma_s =  '0 -1.07259E-04;
    -2.17199E-02 0'  
    diffusivity = ' 1.88477E+00 1.55265E-01'
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