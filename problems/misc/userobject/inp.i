[Mesh]
file = rectangle.msh
[]

[Kernels]
[diffusion]
    type = Diffusion
    variable = flux 
[]
#[absorption]
#    type = ArrayReaction
#    variable = flux
#    reaction_coefficient = sigma_r
#[]
[]

#[Materials]
#[a]
#    type = GenericConstantMaterial
#    prop_value = '1 1'
#    prop_name = sigma_r
#    block = primo
#[]
#[]

[Variables]
[./flux]
[../]
[]
    
    
[BCs]
[a] 
    type = DirichletBC
    variable = flux
    boundary = boundary
    value = 1
[]
[]

[UserObjects]
[./int]
    type = ElementIntegralVariableUserObject
    variable = flux
[]
[]





[Executioner]
    type = Steady
    solve_type = 'PJFNK'
[]

[Outputs]
exodus = true
[]