[Mesh]
file = rectangle.msh
[]

[Kernels]
[time]
    type = ArrayTimeDerivative
    variable = flux
    time_derivative_coefficient = inverse_v  
[]
[diffusion]
    type = ArrayDiffusion 
    variable = flux 
    diffusion_coefficient = diffusivity
[]
[reaction]
    type = ArrayReaction
    variable = flux
    reaction_coefficient = sigma_r
[]
[]

[Functions]
[diff_func]
    type = ParsedFunction
    expression = 1
[]
[rem_func]
    type = ParsedFunction
    expression = '-1'
[]
[]




[Materials]
[dc]
    type = FunctionNuclearMaterial
    group_number = 1
    diffusivity_functions = diff_func
    removal_functions = rem_func
[]
[./10]
    type = GenericConstantArray
    prop_name = inverse_v
    prop_value = '1'
[]
[../]


[Variables]
[./flux]
    type = ArrayMooseVariable
    components = 1
[../]
[]

[ICs]
[internalIC]
    type = ArrayConstantIC
    variable = flux
    value = 0
[]
[]

#[Postprocessors]
#[diff]
#    type = ElementIntegralMaterialProperty
#    mat_prop = diffusivity
#    execute_on = 'LINEAR'
#[]
#[reac]
#    type = ElementIntegralMaterialProperty
#    mat_prop = sigma_r
#    execute_on = 'LINEAR'
#[]
#[]


[BCs]
[./a]
    type = ArrayDirichletBC
    variable = flux
    boundary = boundary
    values = '1'
[]
[]

[Executioner]
    end_time = 1
    dt = 0.1
    type = Transient
[]

[Outputs]
exodus = true
[]