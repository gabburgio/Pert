[Mesh]
    file = onecyl.msh
    []
    
    [Variables]
    [./flux]
        type = ArrayMooseVariable
        components = 2
        initial_condition = '1 5.45E-04'
    [../]
    []
    
    [Kernels]
    [diffusion]
        type = ArrayDiffusion 
        variable = flux 
        diffusion_coefficient = sph_diffusivity
    []
    [absorption]
        type = ArrayReaction
        variable = flux
        reaction_coefficient = sph_sigma_r
    []
    [scattering]
        type = ArrayReaction
        variable = flux
        reaction_coefficient = sph_sigma_s
    []
    [fission]
        type = ArrayReaction
        variable = flux
        reaction_coefficient = sph_chi_nu_sigma_f
    []
    []
    
    [Postprocessors]
    [./first_pp]
        type = ElementIntegralArrayVariablePostprocessor
        variable = flux
        execute_on = 'LINEAR'
        component = 0
    []
    [./second_pp]
        type = ElementIntegralArrayVariablePostprocessor
        variable = flux
        execute_on = 'LINEAR'
        component = 1
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
        [external_u]
            type = SPHMaterial
            ref_diffusivity = ' 5.88099E-01 6.37020E-01'
            ref_nu_sigma_f = '-4.72646E-02 -3.37123E-01'
            ref_sigma_r = '2.56339E-02 1.65331E-01'
            chi = '1 0'
            ref_k = 0.981
            ref_sigma_s =  '0 -1.29020E-03
                            -9.05288E-05 0'
            ref_phi_mg = '1 5.45E-04'
            zone_integrators = 'first_pp second_pp'
            block = 'domain'
        []
    []
    
    
    [Executioner]
    type = Steady
    solve_type = 'PJFNK'
    []
    
    [Outputs]
    exodus = true
    []