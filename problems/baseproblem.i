[Mesh]
file = untitled.msh
[]

[Variables]
[./flux]
    type = ArrayMooseVariable
    components = 2
    initial_condition = '2 2'
[../]
[]

[Kernels]
[diffusion]
    type = ArrayDiffusion 
    variable = flux 
    diffusion_coefficient = oneprop
[]
[absorption]
    type = ArrayReaction
    variable = flux
    reaction_coefficient = oneprop
[]
[scattering]
    type = ArrayReaction
    variable = flux
    reaction_coefficient = scatter
[]
[fission]
    type = ArrayReaction
    variable = flux
    reaction_coefficient = fiss
    extra_matrix_tags = 'eigen'
[]
[]

[BCs]
[./vacBC]
    type = ArrayVacuumBC
    boundary = 'boundary'
    variable = flux
    alpha = '1 1'
[]
[]


[Materials]
    [dc]
        type = GenericConstantArray
        prop_value = '1.52761 1.52761'
        prop_name = oneprop
    []

    [dd]
        type = GenericConstant2DArray
        prop_value = '0 -1.52761 
                      -1.52761 0'
        prop_name = scatter
    []
    [de]
        type = GenericConstant2DArray
        prop_value = '-1.52761 0 
                    -1.52761 0'
        prop_name = fiss
    []
[]

[Postprocessors]
[vall]
    type = ElementIntegralArrayVariablePostprocessor
    variable = flux
    component = 0
[]
[ball]
    type = ElementIntegralArrayVariablePostprocessor
    variable = flux
    component = 1
[]
[]


[Executioner]
type = Eigenvalue
solve_type = 'PJFNK'
[]

[Outputs]
exodus = true
[]

