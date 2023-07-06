[Mesh]
file = prova.msh
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
[]

[Materials]
[a]
    type = GenericConstantArray
    prop_value = '1 1'
    prop_name = sigma_r
    block = primo
[]
[b]
    type = GenericConstantArray
    prop_value = '10 10'
    prop_name = sigma_r
    block = secondo
[]
[c]
    type = GenericConstantArray
    prop_value = '100 100'
    prop_name = sigma_r
    block = terzo
[]
[d]
    type = GenericConstantArray
    prop_value = '1 1'
    prop_name = diffusivity
[]
[]

[Variables]
[./flux]
    type = ArrayMooseVariable
    components = 2
  [../]
[]
    
    
[BCs]
[a] 
    type = ArrayDirichletBC
    variable = flux
    boundary = boundary
    values = '10 10'
[]
[]

[Executioner]
    type = Steady
    solve_type = 'PJFNK'
[]

[Outputs]
exodus = true
[]