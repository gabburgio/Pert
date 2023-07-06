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
[]
[]



[Materials]
[./10]
    type = NuclearMaterial
    block = 'domain'
    nu_sigma_f ='3.80830E-02 3.76623E-02'
    sigma_r = '2.92964E-02 3.20223E-02'
    chi = '1 0'
    sigma_s =  '0 1.21721E-04;
                2.23871E-02 0'
    diffusivity = '1.72532E+00 1.56049E-01'
    inverse_v = '0.01 0.01'
[]
[../]

[BCs]
[./abc]    
    type = ArrayVacuumBC
    variable = 'flux'
    boundary = 'boundary'
    alpha = '0.4043 0.2083'
[]
[]

[Variables]
[./flux]
    type = ArrayMooseVariable
    components = 2
[../]
[]

[ICs]
    [internalIC]
        type = ArrayConstantIC
        variable = flux
        value = '1.303 0.466'
    []
[]

[Executioner]
    end_time = 1
    dt = 0.01
    type = Transient
[]

[Outputs]
exodus = true
[]