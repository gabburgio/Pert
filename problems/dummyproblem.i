[Mesh]
    file = untitled.msh
    []
    
    [Variables]
    [./flux]
        type = ArrayMooseVariable
        components = 2
        initial_condition = '1 1'
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
            ref_diffusivity = '1 1'
            ref_sigma_r = '1 1'
            ref_nu_sigma_f = '-1 -1'
            chi = '1 0'
            ref_k = 1.00838
            ref_sigma_s = '0 -1
                           -1 0'
            ref_phi_mg = '1 1'
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