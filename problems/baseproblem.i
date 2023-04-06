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

[ProblemSetup]
    vacuum_boundaries='boundary'
    Sn_degree = 2
[]


[Executioner]
type = Steady
solve_type = 'PJFNK'
[]

[Outputs]
exodus = true
[]