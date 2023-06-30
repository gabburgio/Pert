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
    nu_sigma_f = '5.19417E-02 1.47749E+00'
    chi = '1.00000E+00 0.00000E+00'
    diffusivity = '1.16299E-01 1.96645E-02'
    sigma_r = '5.08506E-01 1.28397E+00'
    sigma_s = '0 4.75265E-03; 3.95622E-01 0'

[]
[a]
    type = GenericConstantArray
    prop_name = decay_constants
    prop_value = '1.33461E-02 3.26661E-02 1.20943E-01 3.04465E-01 8.56396E-01 2.87596E+00'    
[]
[c]
    type = GenericConstantArray
    prop_name = delayed_fraction
    prop_value = '2.25342E-04 1.17948E-03 1.13041E-03 2.58359E-03 1.11298E-03 4.65734E-04 '
[]
[../]

#precursor source generation
[AuxKernels]
  [precsource]
    type = PrecursorSourceAux
    variable = precs
    execute_on = timestep_end
    flux = flux
    chi_nu_sigma_f = chi_nu_sigma_f
    delayed_fraction = delayed_fraction
    decay_constants = decay_constants
  []
[]

[AuxVariables]
  [precs]
    type = ArrayMooseVariable
    components = 6
    family = MONOMIAL   
    order = FIRST
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