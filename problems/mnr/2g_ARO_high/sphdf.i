[Mesh]
file = mnr_active.msh
[]


[Outputs]
exodus = true
[]


[Executioner]
type = Steady
solve_type = 'PJFNK'	
[]


[Variables]
[./flux]
    type = ArrayMooseVariable
    components = 2
[../]
[]

[Postprocessors]
[./alb_0]
    type = AlbedoCorrectedArraySideIntegralPostprocessor
    variable = flux
    component = 0  
	albedo_matrix =  '3.21292E-01 7.73790E-06;  2.05225E-01    7.76575E-01' 
    execute_on = 'LINEAR'
    boundary = 'north south west east bottom top'
[]
[./alb_1]
    type = AlbedoCorrectedArraySideIntegralPostprocessor
    variable = flux
	albedo_matrix =  '3.21292E-01 7.73790E-06;  2.05225E-01    7.76575E-01' 
    component = 1
    execute_on = 'LINEAR'
    boundary = 'north south west east bottom top' 
[]
[]


[BCs]
[./albedo]
	variable = flux
	type = UoL2ArrayAlbedoBC
	surface_integrators = 'alb_0 alb_1'
	boundary = 'north south west east bottom top'
	normalization_factors_uo = total
	albedo_matrix =  '3.21292E-01 7.73790E-06;  2.05225E-01    7.76575E-01' 
	ref_current_integral = ' 846.47259563 -20.34916842' 
[]
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
[]
[]

[Materials]
[./mat_gcu_F9plug]
	block = 'F9plug'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.4212   0.149897'
	ref_sigma_r = '0.0681978 0.0191951'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 5.27202e-05; 0.0676146 0.       '
	sph_factors_uo = uo_gcu_F9plug
	normalization_factors_uo = total

[]
[./mat_gcu_F8graph]
	block = 'F8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.29949  0.331199'
	ref_sigma_r = '0.0221889  0.00767155'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 5.54508e-05; 0.0219575 0.       '
	sph_factors_uo = uo_gcu_F8graph
	normalization_factors_uo = total

[]
[./mat_gcu_F7rifl]
	block = 'F7rifl'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '2.37734  0.276258'
	ref_sigma_r = '0.0304152 0.0114179'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '1.00000e-06 8.01215e-05; 0.0301237 0.       '
	sph_factors_uo = uo_gcu_F7rifl
	normalization_factors_uo = total

[]
[./mat_gcu_MNR396]
	block = 'MNR396'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00336305 0.112937  '
	ref_diffusivity = '1.65117  0.246573'
	ref_sigma_r = '0.0304962 0.0728243'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '6.0000e-06 2.0602e-04; 0.0266408 0.       '
	sph_factors_uo = uo_gcu_MNR396
	normalization_factors_uo = total

[]
[./mat_gcu_MNR375]
	block = 'MNR375'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00247147 0.0853008 '
	ref_diffusivity = '1.62149  0.245547'
	ref_sigma_r = '0.0313872 0.0609517'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.00000e-06 2.10303e-04; 0.0275931 0.       '
	sph_factors_uo = uo_gcu_MNR375
	normalization_factors_uo = total

[]
[./mat_gcu_MNR374]
	block = 'MNR374'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00228074 0.0796738 '
	ref_diffusivity = '1.61756  0.245089'
	ref_sigma_r = '0.0319075 0.0586206'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.00000e-06 1.93673e-04; 0.0280971 0.       '
	sph_factors_uo = uo_gcu_MNR374
	normalization_factors_uo = total

[]
[./mat_gcu_MNR372]
	block = 'MNR372'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00245802 0.0846572 '
	ref_diffusivity = '1.61797  0.245636'
	ref_sigma_r = '0.0315022 0.0606476'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.00000e-06 2.15501e-04; 0.027702 0.      '
	sph_factors_uo = uo_gcu_MNR372
	normalization_factors_uo = total

[]
[./mat_gcu_MNR382]
	block = 'MNR382'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00293245 0.0992419 '
	ref_diffusivity = '1.62797  0.247324'
	ref_sigma_r = '0.0312377 0.0670643'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '6.00000e-06 2.19292e-04; 0.0273895 0.       '
	sph_factors_uo = uo_gcu_MNR382
	normalization_factors_uo = total

[]
[./mat_gcu_MNR389]
	block = 'MNR389'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00302619 0.101533  '
	ref_diffusivity = '1.64315  0.245006'
	ref_sigma_r = '0.0306398 0.0678702'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '6.00000e-06 2.08287e-04; 0.0268208 0.       '
	sph_factors_uo = uo_gcu_MNR389
	normalization_factors_uo = total

[]
[./mat_gcu_E9rifl]
	block = 'E9rifl'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '2.28471  0.266332'
	ref_sigma_r = '0.0386544 0.0116459'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 3.76191e-05; 0.0383069 0.       '
	sph_factors_uo = uo_gcu_E9rifl
	normalization_factors_uo = total

[]
[./mat_gcu_E8graph]
	block = 'E8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.30526  0.334211'
	ref_sigma_r = '0.0206083  0.00763142'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 6.97135e-05; 0.0203894 0.       '
	sph_factors_uo = uo_gcu_E8graph
	normalization_factors_uo = total

[]
[./mat_gcu_MNR394]
	block = 'MNR394'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00330417 0.111183  '
	ref_diffusivity = '1.65078  0.245679'
	ref_sigma_r = '0.0305572 0.0722962'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '6.0000e-06 1.9279e-04; 0.0267287 0.       '
	sph_factors_uo = uo_gcu_MNR394
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC77]
	block = 'MNRC77'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00116231 0.0375877 '
	ref_diffusivity = '1.57268  0.230974'
	ref_sigma_r = '0.0340728 0.0380254'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '3.00000e-06 1.78559e-04; 0.0315147 0.       '
	sph_factors_uo = uo_gcu_MNRC77
	normalization_factors_uo = total

[]
[./mat_gcu_MNR377]
	block = 'MNR377'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00269299 0.0929397 '
	ref_diffusivity = '1.61462  0.246891'
	ref_sigma_r = '0.031263  0.0644256'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.00000e-06 2.42648e-04; 0.0274532 0.       '
	sph_factors_uo = uo_gcu_MNR377
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC76]
	block = 'MNRC76'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00111324 0.0356467 '
	ref_diffusivity = '1.56385  0.230989'
	ref_sigma_r = '0.0344878 0.0371752'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '2.00000e-06 1.79393e-04; 0.0319143 0.       '
	sph_factors_uo = uo_gcu_MNRC76
	normalization_factors_uo = total

[]
[./mat_gcu_MNR395]
	block = 'MNR395'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00338422 0.112214  '
	ref_diffusivity = '1.62324 0.24944'
	ref_sigma_r = '0.0308298 0.072667 '
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.00000e-06 2.68377e-04; 0.0269244 0.       '
	sph_factors_uo = uo_gcu_MNR395
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC80]
	block = 'MNRC80'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.0015559 0.0483223'
	ref_diffusivity = '1.55282  0.236748'
	ref_sigma_r = '0.0326841 0.0452376'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '3.00000e-06 2.08714e-04; 0.0302149 0.       '
	sph_factors_uo = uo_gcu_MNRC80
	normalization_factors_uo = total

[]
[./mat_gcu_MNR387]
	block = 'MNR387'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.0029899 0.1005   '
	ref_diffusivity = '1.62974  0.245727'
	ref_sigma_r = '0.0308333 0.0674665'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.00000e-06 2.33727e-04; 0.0270119 0.       '
	sph_factors_uo = uo_gcu_MNR387
	normalization_factors_uo = total

[]
[./mat_gcu_D9graph]
	block = 'D9graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.29177  0.329422'
	ref_sigma_r = '0.0245758  0.00771127'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 4.04636e-05; 0.0243225 0.       '
	sph_factors_uo = uo_gcu_D9graph
	normalization_factors_uo = total

[]
[./mat_gcu_D8graph]
	block = 'D8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.27702  0.332294'
	ref_sigma_r = '0.0221869  0.00766453'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 6.99896e-05; 0.0219613 0.       '
	sph_factors_uo = uo_gcu_D8graph
	normalization_factors_uo = total

[]
[./mat_gcu_D7rifl]
	block = 'D7rifl'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '2.35395 0.27936'
	ref_sigma_r = '0.0300489 0.0113746'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 9.95962e-05; 0.0297635 0.       '
	sph_factors_uo = uo_gcu_D7rifl
	normalization_factors_uo = total

[]
[./mat_gcu_MNR392]
	block = 'MNR392'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00321442 0.108165  '
	ref_diffusivity = '1.63168  0.246875'
	ref_sigma_r = '0.0308241 0.0712095'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '6.00000e-06 2.33866e-04; 0.026963 0.      '
	sph_factors_uo = uo_gcu_MNR392
	normalization_factors_uo = total

[]
[./mat_gcu_MNR381]
	block = 'MNR381'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00270647 0.0932929 '
	ref_diffusivity = '1.62053  0.247254'
	ref_sigma_r = '0.0313348 0.0648211'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.00000e-06 2.22078e-04; 0.027511 0.      '
	sph_factors_uo = uo_gcu_MNR381
	normalization_factors_uo = total

[]
[./mat_gcu_MNR391]
	block = 'MNR391'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00309588 0.104605  '
	ref_diffusivity = '1.61918 0.24878'
	ref_sigma_r = '0.031114  0.0697816'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '6.00000e-06 2.51357e-04; 0.027241 0.      '
	sph_factors_uo = uo_gcu_MNR391
	normalization_factors_uo = total

[]
[./mat_gcu_MNR388]
	block = 'MNR388'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00304908 0.102287  '
	ref_diffusivity = '1.61254  0.248685'
	ref_sigma_r = '0.0312135 0.0686191'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.00000e-06 2.64468e-04; 0.0273316 0.       '
	sph_factors_uo = uo_gcu_MNR388
	normalization_factors_uo = total

[]
[./mat_gcu_MNR378]
	block = 'MNR378'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00268834 0.092882  '
	ref_diffusivity = '1.60914  0.247788'
	ref_sigma_r = '0.0316895 0.0645167'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.00000e-06 2.33712e-04; 0.0278386 0.       '
	sph_factors_uo = uo_gcu_MNR378
	normalization_factors_uo = total

[]
[./mat_gcu_MNR390]
	block = 'MNR390'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00311276 0.103592  '
	ref_diffusivity = '1.63073 0.2456 '
	ref_sigma_r = '0.0308769 0.0689235'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.00000e-06 2.29614e-04; 0.0270235 0.       '
	sph_factors_uo = uo_gcu_MNR390
	normalization_factors_uo = total

[]
[./mat_gcu_C9rifl]
	block = 'C9rifl'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '2.26152  0.266039'
	ref_sigma_r = '0.0389526 0.0116447'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 3.93782e-05; 0.0386032 0.       '
	sph_factors_uo = uo_gcu_C9rifl
	normalization_factors_uo = total

[]
[./mat_gcu_C8graph]
	block = 'C8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.29475  0.334315'
	ref_sigma_r = '0.0207577  0.00763082'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 7.66989e-05; 0.0205401 0.       '
	sph_factors_uo = uo_gcu_C8graph
	normalization_factors_uo = total

[]
[./mat_gcu_MNR379]
	block = 'MNR379'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00252899 0.0876386 '
	ref_diffusivity = '1.61394  0.244779'
	ref_sigma_r = '0.031556  0.0620231'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '6.00000e-06 2.06071e-04; 0.0277415 0.       '
	sph_factors_uo = uo_gcu_MNR379
	normalization_factors_uo = total

[]
[./mat_gcu_MNR393]
	block = 'MNR393'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00329083 0.110638  '
	ref_diffusivity = '1.6383  0.24467'
	ref_sigma_r = '0.0306235 0.0723654'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.00000e-06 2.26783e-04; 0.0267596 0.       '
	sph_factors_uo = uo_gcu_MNR393
	normalization_factors_uo = total

[]
[./mat_gcu_010400]
	block = 'u10400'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.42805 0.17163'
	ref_sigma_r = '0.0514179 0.0181288'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00013549; 0.0509411 0.       '
	sph_factors_uo = uo_gcu_010400
	normalization_factors_uo = total

[]
[./mat_gcu_MNR384]
	block = 'MNR384'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.0030267 0.103302 '
	ref_diffusivity = '1.62684  0.245539'
	ref_sigma_r = '0.0310775 0.0693558'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '6.00000e-06 2.28513e-04; 0.0272303 0.       '
	sph_factors_uo = uo_gcu_MNR384
	normalization_factors_uo = total

[]
[./mat_gcu_MNR383]
	block = 'MNR383'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00270641 0.0926896 '
	ref_diffusivity = '1.60948 0.24714'
	ref_sigma_r = '0.0314612 0.0644297'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.0000e-06 2.4639e-04; 0.0276173 0.       '
	sph_factors_uo = uo_gcu_MNR383
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC74]
	block = 'MNRC74'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00094418 0.0302689 '
	ref_diffusivity = '1.55594  0.230323'
	ref_sigma_r = '0.0350358 0.034731 '
	chi = '1.00000e+00 4.48371e-08'
	ref_k = 1
	ref_sigma_s = '2.00000e-06 1.68473e-04; 0.032462 0.      '
	sph_factors_uo = uo_gcu_MNRC74
	normalization_factors_uo = total

[]
[./mat_gcu_MNR361]
	block = 'MNR361'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00204863 0.0713645 '
	ref_diffusivity = '1.61143  0.241809'
	ref_sigma_r = '0.0319092 0.0546928'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.0000e-06 1.9302e-04; 0.0281452 0.       '
	sph_factors_uo = uo_gcu_MNR361
	normalization_factors_uo = total

[]
[./mat_gcu_B9plug]
	block = 'B9plug'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.3723   0.150438'
	ref_sigma_r = '0.0698604 0.0191762'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 6.02586e-05; 0.0692861 0.       '
	sph_factors_uo = uo_gcu_B9plug
	normalization_factors_uo = total

[]
[./mat_gcu_B8graph]
	block = 'B8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.30107  0.334429'
	ref_sigma_r = '0.0204342  0.00762389'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 7.55778e-05; 0.0202182 0.       '
	sph_factors_uo = uo_gcu_B8graph
	normalization_factors_uo = total

[]
[./mat_gcu_MNR398]
	block = 'MNR398'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00336683 0.112932  '
	ref_diffusivity = '1.63793  0.246857'
	ref_sigma_r = '0.0304929 0.0726554'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.00000e-06 2.24295e-04; 0.0266344 0.       '
	sph_factors_uo = uo_gcu_MNR398
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC79]
	block = 'MNRC79'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00153936 0.0491146 '
	ref_diffusivity = '1.58867 0.23209'
	ref_sigma_r = '0.0332161 0.0432405'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '3.00000e-06 1.85434e-04; 0.0306631 0.       '
	sph_factors_uo = uo_gcu_MNRC79
	normalization_factors_uo = total

[]
[./mat_gcu_MNR385]
	block = 'MNR385'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00300697 0.103096  '
	ref_diffusivity = '1.63757  0.247829'
	ref_sigma_r = '0.0306729 0.0690639'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '6.00000e-06 2.18663e-04; 0.0268713 0.       '
	sph_factors_uo = uo_gcu_MNR385
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC78]
	block = 'MNRC78'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00122344 0.039439  '
	ref_diffusivity = '1.57421  0.231154'
	ref_sigma_r = '0.0341396 0.0389513'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '3.0000e-06 1.7252e-04; 0.0315737 0.       '
	sph_factors_uo = uo_gcu_MNRC78
	normalization_factors_uo = total

[]
[./mat_gcu_MNR358]
	block = 'MNR358'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.0021667 0.0754923'
	ref_diffusivity = '1.59714  0.245037'
	ref_sigma_r = '0.032066  0.0566421'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.00000e-06 2.20482e-04; 0.0282608 0.       '
	sph_factors_uo = uo_gcu_MNR358
	normalization_factors_uo = total

[]
[./mat_gcu_MNR373]
	block = 'MNR373'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00240247 0.0834641 '
	ref_diffusivity = '1.59108  0.245833'
	ref_sigma_r = '0.0322517 0.0603141'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.00000e-06 2.08819e-04; 0.0283856 0.       '
	sph_factors_uo = uo_gcu_MNR373
	normalization_factors_uo = total

[]
[./mat_gcu_MNR365]
	block = 'MNR365'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.0022766 0.0783637'
	ref_diffusivity = '1.61203  0.242513'
	ref_sigma_r = '0.0317962 0.0577072'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.00000e-06 1.95539e-04; 0.0279955 0.       '
	sph_factors_uo = uo_gcu_MNR365
	normalization_factors_uo = total

[]
[./mat_gcu_A9plug]
	block = 'A9plug'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.42357  0.149957'
	ref_sigma_r = '0.0674418 0.0192126'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.0000e+00 5.2366e-05; 0.0668701 0.       '
	sph_factors_uo = uo_gcu_A9plug
	normalization_factors_uo = total

[]
[./mat_gcu_A8graph]
	block = 'A8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.29032  0.331265'
	ref_sigma_r = '0.0223901  0.00766654'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.0000e+00 5.5969e-05; 0.022156 0.      '
	sph_factors_uo = uo_gcu_A8graph
	normalization_factors_uo = total

[]
[./mat_gcu_A7rifl]
	block = 'A7rifl'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '2.36356  0.276558'
	ref_sigma_r = '0.0306622 0.0114026'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 8.05829e-05; 0.0303733 0.       '
	sph_factors_uo = uo_gcu_A7rifl
	normalization_factors_uo = total

[]
[./mat_gcu_MNR397]
	block = 'MNR397'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00336999 0.113186  '
	ref_diffusivity = '1.64878  0.246647'
	ref_sigma_r = '0.0305139 0.0729209'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.00000e-06 2.08047e-04; 0.0266531 0.       '
	sph_factors_uo = uo_gcu_MNR397
	normalization_factors_uo = total

[]
[./mat_gcu_MNR376]
	block = 'MNR376'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00247476 0.0855144 '
	ref_diffusivity = '1.62114  0.245512'
	ref_sigma_r = '0.0313082 0.0610158'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.00000e-06 2.07154e-04; 0.0275165 0.       '
	sph_factors_uo = uo_gcu_MNR376
	normalization_factors_uo = total

[]
[./mat_gcu_MNR366]
	block = 'MNR366'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.0020638 0.0720901'
	ref_diffusivity = '1.61161  0.243863'
	ref_sigma_r = '0.0322223 0.0551742'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.00000e-06 1.80004e-04; 0.0284296 0.       '
	sph_factors_uo = uo_gcu_MNR366
	normalization_factors_uo = total

[]
[./mat_gcu_MNR362]
	block = 'MNR362'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00195895 0.067613  '
	ref_diffusivity = '1.58982  0.241829'
	ref_sigma_r = '0.0327048 0.0531414'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '4.00000e-06 1.74733e-04; 0.0288765 0.       '
	sph_factors_uo = uo_gcu_MNR362
	normalization_factors_uo = total

[]
[./mat_gcu_010500]
	block = 'u10500'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '0.896781 0.303325'
	ref_sigma_r = '0.017763   0.00603727'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.002871   0.00012597; 0.0166225 0.       '
	sph_factors_uo = uo_gcu_010500
	normalization_factors_uo = total

[]
[./mat_gcu_MNR369]
	block = 'MNR369'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00228008 0.0783584 '
	ref_diffusivity = '1.61308  0.239721'
	ref_sigma_r = '0.0319097 0.0577809'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.00000e-06 1.59324e-04; 0.0281198 0.       '
	sph_factors_uo = uo_gcu_MNR369
	normalization_factors_uo = total

[]
[]


[UserObjects]
[./uo_gcu_F9plug]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = ' 75.72958374 353.56950443'
	block  = F9plug 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_F8graph]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '349.62767584 828.46689931'
	block  = F8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_F7rifl]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = ' 840.57313129 1127.14103441'
	block  = F7rifl 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR396]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1793.51872822  882.16340643'
	block  = MNR396 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR375]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2263.89572969 1137.98390843'
	block  = MNR375 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR374]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2413.08957874 1338.62450102'
	block  = MNR374 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR372]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2447.78449926 1208.05095486'
	block  = MNR372 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR382]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2089.87101626  991.57665524'
	block  = MNR382 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR389]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1392.85214962  684.82727265'
	block  = MNR389 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_E9rifl]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '143.7591335  555.58727101'
	block  = E9rifl 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_E8graph]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = ' 595.22180733 1019.49572797'
	block  = E8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR394]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1683.31066412  889.76252352'
	block  = MNR394 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC77]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2367.96152192 1589.93788813'
	block  = MNRC77 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR377]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3411.12339688 1467.59513805'
	block  = MNR377 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC76]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3372.02758978 2271.5403732 '
	block  = MNRC76 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR395]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3847.91139028 1465.92204237'
	block  = MNR395 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC80]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2828.25252599 1637.68561063'
	block  = MNRC80 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR387]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2024.27504297  888.27532737'
	block  = MNR387 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_D9graph]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '182.94011293 667.71123832'
	block  = D9graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_D8graph]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = ' 693.77700666 1292.17048742'
	block  = D8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_D7rifl]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1613.27586556 1717.77415871'
	block  = D7rifl 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR392]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3109.13152444 1359.05827269'
	block  = MNR392 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR381]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3888.05051101 1844.07201592'
	block  = MNR381 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR391]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '4501.1964465  1855.52190877'
	block  = MNR391 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR388]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '4409.61247915 1730.62588569'
	block  = MNR388 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR378]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3428.46137247 1551.59706071'
	block  = MNR378 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR390]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2239.10280398  996.91273023'
	block  = MNR390 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_C9rifl]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '176.94200803 647.13140274'
	block  = C9rifl 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_C8graph]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = ' 749.11625851 1179.86820832'
	block  = C8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR379]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2059.21656489 1061.60955687'
	block  = MNR379 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR393]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3068.42332354 1382.07187442'
	block  = MNR393 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_010400]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2721.30339428 3620.96222182'
	block  = u10400 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR384]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '4171.69903291 1889.58894418'
	block  = MNR384 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR383]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '4042.04360275 1727.69322593'
	block  = MNR383 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC74]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2763.16872484 2018.77393474'
	block  = MNRC74 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR361]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1915.27722267 1061.01391963'
	block  = MNR361 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_B9plug]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '121.85618654 512.68811149'
	block  = B9plug 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_B8graph]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = ' 648.62618663 1016.86088682'
	block  = B8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR398]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1810.37677954  821.90540505'
	block  = MNR398 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC79]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2386.94982998 1478.91414246'
	block  = MNRC79 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR385]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3078.81852116 1446.84078455'
	block  = MNR385 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC78]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2949.20102968 2036.33954239'
	block  = MNRC78 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR358]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3090.99683662 1509.92711434'
	block  = MNR358 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR373]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2499.19140719 1301.20178959'
	block  = MNR373 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR365]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1547.38017671  843.04293919'
	block  = MNR365 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_A9plug]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = ' 76.23246091 346.73485169'
	block  = A9plug 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_A8graph]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '373.34693698 879.5740917 '
	block  = A8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_A7rifl]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = ' 880.66103481 1182.4651108 '
	block  = A7rifl 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR397]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1793.96640462  875.13716337'
	block  = MNR397 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR376]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2126.15936124 1072.70092922'
	block  = MNR376 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR366]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2075.28359479 1250.09270027'
	block  = MNR366 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR362]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1906.70308157 1201.43634645'
	block  = MNR362 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_010500]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1304.80786088 1421.16768153'
	block  = u10500 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR369]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '951.52479347 639.44312976'
	block  = MNR369 
	execute_on = 'LINEAR' 
[]
[./total]
	type = NormalizationFactorsUserObject
	SPH_user_objects = 'uo_gcu_F9plug uo_gcu_F8graph uo_gcu_F7rifl uo_gcu_MNR396 uo_gcu_MNR375 uo_gcu_MNR374 uo_gcu_MNR372 uo_gcu_MNR382 uo_gcu_MNR389 uo_gcu_E9rifl uo_gcu_E8graph uo_gcu_MNR394 uo_gcu_MNRC77 uo_gcu_MNR377 uo_gcu_MNRC76 uo_gcu_MNR395 uo_gcu_MNRC80 uo_gcu_MNR387 uo_gcu_D9graph uo_gcu_D8graph uo_gcu_D7rifl uo_gcu_MNR392 uo_gcu_MNR381 uo_gcu_MNR391 uo_gcu_MNR388 uo_gcu_MNR378 uo_gcu_MNR390 uo_gcu_C9rifl uo_gcu_C8graph uo_gcu_MNR379 uo_gcu_MNR393 uo_gcu_010400 uo_gcu_MNR384 uo_gcu_MNR383 uo_gcu_MNRC74 uo_gcu_MNR361 uo_gcu_B9plug uo_gcu_B8graph uo_gcu_MNR398 uo_gcu_MNRC79 uo_gcu_MNR385 uo_gcu_MNRC78 uo_gcu_MNR358 uo_gcu_MNR373 uo_gcu_MNR365 uo_gcu_A9plug uo_gcu_A8graph uo_gcu_A7rifl uo_gcu_MNR397 uo_gcu_MNR376 uo_gcu_MNR366 uo_gcu_MNR362 uo_gcu_010500 uo_gcu_MNR369 '
	ref_integrals = '109295.60590387  67778.8358068 '
	execute_on = 'LINEAR' 
[]
[./output]
	type = OutputUserObject
	SPH_uo_names = 'uo_gcu_A9plug uo_gcu_B9plug uo_gcu_C9rifl uo_gcu_D9graph uo_gcu_E9rifl uo_gcu_F9plug uo_gcu_A8graph uo_gcu_B8graph uo_gcu_C8graph uo_gcu_D8graph uo_gcu_E8graph uo_gcu_F8graph uo_gcu_A7rifl uo_gcu_MNR398 uo_gcu_MNR379 uo_gcu_D7rifl uo_gcu_MNR394 uo_gcu_F7rifl uo_gcu_MNR397 uo_gcu_MNRC79 uo_gcu_MNR393 uo_gcu_MNR392 uo_gcu_MNRC77 uo_gcu_MNR396 uo_gcu_MNR376 uo_gcu_MNR385 uo_gcu_010400 uo_gcu_MNR381 uo_gcu_MNR377 uo_gcu_MNR375 uo_gcu_MNR366 uo_gcu_MNRC78 uo_gcu_MNR384 uo_gcu_MNR391 uo_gcu_MNRC76 uo_gcu_MNR374 uo_gcu_MNR362 uo_gcu_MNR358 uo_gcu_MNR383 uo_gcu_MNR388 uo_gcu_MNR395 uo_gcu_MNR372 uo_gcu_010500 uo_gcu_MNR373 uo_gcu_MNRC74 uo_gcu_MNR378 uo_gcu_MNRC80 uo_gcu_MNR382 uo_gcu_MNR369 uo_gcu_MNR365 uo_gcu_MNR361 uo_gcu_MNR390 uo_gcu_MNR387 uo_gcu_MNR389 '
	execute_on = 'TIMESTEP_END'
	normalization_uo_name = total
	surface_integrators = 'alb_0 alb_1'
	ref_surface_integrals = ' 846.47259563 -20.34916842'
[]
[]


[ICs]
[./IC_gcu_F9plug]
	type = ArrayConstantIC
	variable = flux 
	value = '0.01682432 0.07855012'
	block  = F9plug 
[]
[./IC_gcu_F8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.07767439 0.18405482'
	block  = F8graph 
[]
[./IC_gcu_F7rifl]
	type = ArrayConstantIC
	variable = flux 
	value = '0.18674438 0.25040921'
	block  = F7rifl 
[]
[./IC_gcu_MNR396]
	type = ArrayConstantIC
	variable = flux 
	value = '0.39845378 0.1959842 '
	block  = MNR396 
[]
[./IC_gcu_MNR375]
	type = ArrayConstantIC
	variable = flux 
	value = '0.50295422 0.25281809'
	block  = MNR375 
[]
[./IC_gcu_MNR374]
	type = ArrayConstantIC
	variable = flux 
	value = '0.53609959 0.29739304'
	block  = MNR374 
[]
[./IC_gcu_MNR372]
	type = ArrayConstantIC
	variable = flux 
	value = '0.54380753 0.26838441'
	block  = MNR372 
[]
[./IC_gcu_MNR382]
	type = ArrayConstantIC
	variable = flux 
	value = '0.46429234 0.2202918 '
	block  = MNR382 
[]
[./IC_gcu_MNR389]
	type = ArrayConstantIC
	variable = flux 
	value = '0.30944043 0.15214339'
	block  = MNR389 
[]
[./IC_gcu_E9rifl]
	type = ArrayConstantIC
	variable = flux 
	value = '0.03193798 0.12343102'
	block  = E9rifl 
[]
[./IC_gcu_E8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.13223635 0.22649439'
	block  = E8graph 
[]
[./IC_gcu_MNR394]
	type = ArrayConstantIC
	variable = flux 
	value = '0.37396961 0.19767245'
	block  = MNR394 
[]
[./IC_gcu_MNRC77]
	type = ArrayConstantIC
	variable = flux 
	value = '0.5260738  0.35322562'
	block  = MNRC77 
[]
[./IC_gcu_MNR377]
	type = ArrayConstantIC
	variable = flux 
	value = '0.75782593 0.32604556'
	block  = MNR377 
[]
[./IC_gcu_MNRC76]
	type = ArrayConstantIC
	variable = flux 
	value = '0.74914029 0.50465257'
	block  = MNRC76 
[]
[./IC_gcu_MNR395]
	type = ArrayConstantIC
	variable = flux 
	value = '0.85486413 0.32567386'
	block  = MNR395 
[]
[./IC_gcu_MNRC80]
	type = ArrayConstantIC
	variable = flux 
	value = '0.6283335 0.3638334'
	block  = MNRC80 
[]
[./IC_gcu_MNR387]
	type = ArrayConstantIC
	variable = flux 
	value = '0.44971933 0.19734205'
	block  = MNR387 
[]
[./IC_gcu_D9graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.04064255 0.14834083'
	block  = D9graph 
[]
[./IC_gcu_D8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.15413169 0.28707267'
	block  = D8graph 
[]
[./IC_gcu_D7rifl]
	type = ArrayConstantIC
	variable = flux 
	value = '0.35841045 0.38162613'
	block  = D7rifl 
[]
[./IC_gcu_MNR392]
	type = ArrayConstantIC
	variable = flux 
	value = '0.69073447 0.30193267'
	block  = MNR392 
[]
[./IC_gcu_MNR381]
	type = ArrayConstantIC
	variable = flux 
	value = '0.86378157 0.40968486'
	block  = MNR381 
[]
[./IC_gcu_MNR391]
	type = ArrayConstantIC
	variable = flux 
	value = '1.        0.4122286'
	block  = MNR391 
[]
[./IC_gcu_MNR388]
	type = ArrayConstantIC
	variable = flux 
	value = '0.97965342 0.38448131'
	block  = MNR388 
[]
[./IC_gcu_MNR378]
	type = ArrayConstantIC
	variable = flux 
	value = '0.76167779 0.3447077 '
	block  = MNR378 
[]
[./IC_gcu_MNR390]
	type = ArrayConstantIC
	variable = flux 
	value = '0.49744614 0.22147728'
	block  = MNR390 
[]
[./IC_gcu_C9rifl]
	type = ArrayConstantIC
	variable = flux 
	value = '0.03930999 0.14376875'
	block  = C9rifl 
[]
[./IC_gcu_C8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.16642603 0.26212324'
	block  = C8graph 
[]
[./IC_gcu_MNR379]
	type = ArrayConstantIC
	variable = flux 
	value = '0.45748205 0.23585053'
	block  = MNR379 
[]
[./IC_gcu_MNR393]
	type = ArrayConstantIC
	variable = flux 
	value = '0.6816906  0.30704545'
	block  = MNR393 
[]
[./IC_gcu_010400]
	type = ArrayConstantIC
	variable = flux 
	value = '0.60457335 0.80444439'
	block  = u10400 
[]
[./IC_gcu_MNR384]
	type = ArrayConstantIC
	variable = flux 
	value = '0.92679782 0.41979704'
	block  = MNR384 
[]
[./IC_gcu_MNR383]
	type = ArrayConstantIC
	variable = flux 
	value = '0.89799316 0.38382978'
	block  = MNR383 
[]
[./IC_gcu_MNRC74]
	type = ArrayConstantIC
	variable = flux 
	value = '0.61387428 0.44849718'
	block  = MNRC74 
[]
[./IC_gcu_MNR361]
	type = ArrayConstantIC
	variable = flux 
	value = '0.42550403 0.2357182 '
	block  = MNR361 
[]
[./IC_gcu_B9plug]
	type = ArrayConstantIC
	variable = flux 
	value = '0.02707195 0.11390041'
	block  = B9plug 
[]
[./IC_gcu_B8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.14410084 0.22590902'
	block  = B8graph 
[]
[./IC_gcu_MNR398]
	type = ArrayConstantIC
	variable = flux 
	value = '0.40219902 0.1825971 '
	block  = MNR398 
[]
[./IC_gcu_MNRC79]
	type = ArrayConstantIC
	variable = flux 
	value = '0.5302923  0.32856023'
	block  = MNRC79 
[]
[./IC_gcu_MNR385]
	type = ArrayConstantIC
	variable = flux 
	value = '0.68400003 0.32143471'
	block  = MNR385 
[]
[./IC_gcu_MNRC78]
	type = ArrayConstantIC
	variable = flux 
	value = '0.6552038  0.45239962'
	block  = MNRC78 
[]
[./IC_gcu_MNR358]
	type = ArrayConstantIC
	variable = flux 
	value = '0.68670561 0.33545017'
	block  = MNR358 
[]
[./IC_gcu_MNR373]
	type = ArrayConstantIC
	variable = flux 
	value = '0.55522825 0.28907909'
	block  = MNR373 
[]
[./IC_gcu_MNR365]
	type = ArrayConstantIC
	variable = flux 
	value = '0.34377086 0.18729308'
	block  = MNR365 
[]
[./IC_gcu_A9plug]
	type = ArrayConstantIC
	variable = flux 
	value = '0.01693604 0.07703171'
	block  = A9plug 
[]
[./IC_gcu_A8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.08294393 0.19540895'
	block  = A8graph 
[]
[./IC_gcu_A7rifl]
	type = ArrayConstantIC
	variable = flux 
	value = '0.19565043 0.26270018'
	block  = A7rifl 
[]
[./IC_gcu_MNR397]
	type = ArrayConstantIC
	variable = flux 
	value = '0.39855323 0.19442323'
	block  = MNR397 
[]
[./IC_gcu_MNR376]
	type = ArrayConstantIC
	variable = flux 
	value = '0.47235427 0.23831462'
	block  = MNR376 
[]
[./IC_gcu_MNR366]
	type = ArrayConstantIC
	variable = flux 
	value = '0.46105155 0.27772454'
	block  = MNR366 
[]
[./IC_gcu_MNR362]
	type = ArrayConstantIC
	variable = flux 
	value = '0.42359917 0.26691489'
	block  = MNR362 
[]
[./IC_gcu_010500]
	type = ArrayConstantIC
	variable = flux 
	value = '0.28988023 0.31573109'
	block  = u10500 
[]
[./IC_gcu_MNR369]
	type = ArrayConstantIC
	variable = flux 
	value = '0.21139375 0.1420607 '
	block  = MNR369 
[]
[]


