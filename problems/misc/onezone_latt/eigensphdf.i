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
    nu_sigma_f ='1.20830E-02 2.76223E-02'
    sigma_r = '2.92964E-02 3.20223E-02'
    chi = '1 0'
    sigma_s =  '0 1.21721E-04;
                2.23871E-02 0'
    diffusivity = '1.72532E+00 1.56049E-01'
[]
[../]

[BCs]
[./abc]    
    type = ArrayVacuumBC
    variable = 'flux'
    boundary = 'boundary'
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
initial_eigenvalue = 1
[]

[Outputs]
exodus = true
[]