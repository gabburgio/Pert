[Mesh]
file = untitled.msh
[]

[Materials]
    [dc]
        type = GenericConstantArray
        prop_name = coefficiente_diff
        prop_value = '1 1'
    []
[]

[DiffusionProblem]
    vacuum_boundaries='boundary'
    group_number = 2
[]


[Executioner]
type = Steady
solve_type = 'PJFNK'
[]

[Outputs]
exodus = true
[]