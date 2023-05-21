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
    extra_matrix_tags = 'eigen'
[]
[]



[Materials]
[./external_u]
    type = NuclearMaterial
	block = 'external_u'
	nu_sigma_f = '9.62823E-03 8.10872E-02'
	diffusivity = '1.30645E+00 8.27522E-01'
	sigma_t = '1.11069E-02 3.98384E-02'
	chi = '1.00000E+00 0.00000E+00'
	sigma_s = '0 3.66742E-04; 5.16626E-03 0'
[]
[./internal_u]
    type = NuclearMaterial
    block = 'internal_u'
    nu_sigma_f = '0.00000E+00 0.00000E+00'
    diffusivity = '1.31099E+00 8.86690E-01'
    sigma_t = '6.21810E-03 3.89226E-04'
    chi = '0.00000E+00 0.00000E+00'
    sigma_s = '0 3.03035E-04; 6.17165E-03 0'
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

[Variables]
[./flux]
    type = ArrayMooseVariable
    components = 2
[../]
[]


[Executioner]
type = Eigenvalue
initial_eigenvalue = 0.997
[]

[Outputs]
exodus = true
[]