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
	albedo_matrix = '3.21335E-01  7.95606E-06; 2.05120E-01 7.76475E-01'
    execute_on = 'LINEAR'
    boundary = 'north south west east bottom top'
[]
[./alb_1]
    type = AlbedoCorrectedArraySideIntegralPostprocessor
    variable = flux
	albedo_matrix = '3.21335E-01  7.95606E-06; 2.05120E-01 7.76475E-01'
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
	albedo_matrix = '3.21335E-01  7.95606E-06; 2.05120E-01 7.76475E-01'
	ref_current_integral = '845.23202653 -21.00394309' 
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
[./mat_gcu_A9plug]
	block = 'A9plug'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.42686  0.149983'
	ref_sigma_r = '0.067407  0.0191726'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 5.31449e-05; 0.0668303 0.       '
	sph_factors_uo = uo_gcu_A9plug
	normalization_factors_uo = total

[]
[./mat_gcu_B9plug]
	block = 'B9plug'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.37202 0.15045'
	ref_sigma_r = '0.0697863 0.0191368'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 5.63355e-05; 0.0692024 0.       '
	sph_factors_uo = uo_gcu_B9plug
	normalization_factors_uo = total

[]
[./mat_gcu_C9rifl]
	block = 'C9rifl'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '2.26134  0.265591'
	ref_sigma_r = '0.0389067 0.011662 '
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 3.83858e-05; 0.0385657 0.       '
	sph_factors_uo = uo_gcu_C9rifl
	normalization_factors_uo = total

[]
[./mat_gcu_D9graph]
	block = 'D9graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.29207  0.329429'
	ref_sigma_r = '0.0245758  0.00771401'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 4.08744e-05; 0.0243296 0.       '
	sph_factors_uo = uo_gcu_D9graph
	normalization_factors_uo = total

[]
[./mat_gcu_E9rifl]
	block = 'E9rifl'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '2.273    0.266104'
	ref_sigma_r = '0.0387904 0.0116588'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 3.57544e-05; 0.0384448 0.       '
	sph_factors_uo = uo_gcu_E9rifl
	normalization_factors_uo = total

[]
[./mat_gcu_F9plug]
	block = 'F9plug'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.41773  0.149909'
	ref_sigma_r = '0.0682728 0.0191691'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 5.38422e-05; 0.0676944 0.       '
	sph_factors_uo = uo_gcu_F9plug
	normalization_factors_uo = total

[]
[./mat_gcu_A8graph]
	block = 'A8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.2903   0.331313'
	ref_sigma_r = '0.022376   0.00764855'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 5.54935e-05; 0.0221412 0.       '
	sph_factors_uo = uo_gcu_A8graph
	normalization_factors_uo = total

[]
[./mat_gcu_B8graph]
	block = 'B8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.30027  0.334449'
	ref_sigma_r = '0.0204643  0.00763731'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.0000e+00 7.4667e-05; 0.0202496 0.       '
	sph_factors_uo = uo_gcu_B8graph
	normalization_factors_uo = total

[]
[./mat_gcu_C8graph]
	block = 'C8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.29445  0.334451'
	ref_sigma_r = '0.0207814 0.0076296'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 7.53292e-05; 0.0205649 0.       '
	sph_factors_uo = uo_gcu_C8graph
	normalization_factors_uo = total

[]
[./mat_gcu_D8graph]
	block = 'D8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.27828  0.332318'
	ref_sigma_r = '0.0221893  0.00766862'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 7.11234e-05; 0.0219627 0.       '
	sph_factors_uo = uo_gcu_D8graph
	normalization_factors_uo = total

[]
[./mat_gcu_E8graph]
	block = 'E8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.30521  0.334296'
	ref_sigma_r = '0.0205937  0.00763869'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 6.97319e-05; 0.0203792 0.       '
	sph_factors_uo = uo_gcu_E8graph
	normalization_factors_uo = total

[]
[./mat_gcu_F8graph]
	block = 'F8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.30007  0.331165'
	ref_sigma_r = '0.0221445 0.0076661'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 5.54128e-05; 0.021913 0.      '
	sph_factors_uo = uo_gcu_F8graph
	normalization_factors_uo = total

[]
[./mat_gcu_A7rifl]
	block = 'A7rifl'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '2.35996  0.276159'
	ref_sigma_r = '0.0307239 0.0114272'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 8.22102e-05; 0.0304321 0.       '
	sph_factors_uo = uo_gcu_A7rifl
	normalization_factors_uo = total

[]
[./mat_gcu_MNR398]
	block = 'MNR398'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00336538 0.113321  '
	ref_diffusivity = '1.63822  0.247173'
	ref_sigma_r = '0.0304851 0.0728505'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00022492; 0.0266231 0.       '
	sph_factors_uo = uo_gcu_MNR398
	normalization_factors_uo = total

[]
[./mat_gcu_MNR379]
	block = 'MNR379'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00253018 0.0877909 '
	ref_diffusivity = '1.61455  0.244901'
	ref_sigma_r = '0.0315401 0.0621308'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.        0.0002077; 0.0277299 0.       '
	sph_factors_uo = uo_gcu_MNR379
	normalization_factors_uo = total

[]
[./mat_gcu_D7rifl]
	block = 'D7rifl'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '2.35117 0.27885'
	ref_sigma_r = '0.030082  0.0113963'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 9.91257e-05; 0.0297969 0.       '
	sph_factors_uo = uo_gcu_D7rifl
	normalization_factors_uo = total

[]
[./mat_gcu_MNR394]
	block = 'MNR394'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00330408 0.111506  '
	ref_diffusivity = '1.65201  0.245947'
	ref_sigma_r = '0.0305472 0.0724467'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00019421; 0.0267206 0.       '
	sph_factors_uo = uo_gcu_MNR394
	normalization_factors_uo = total

[]
[./mat_gcu_F7rifl]
	block = 'F7rifl'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '2.37438 0.27598'
	ref_sigma_r = '0.0304537 0.0114428'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 8.05433e-05; 0.0301618 0.       '
	sph_factors_uo = uo_gcu_F7rifl
	normalization_factors_uo = total

[]
[./mat_gcu_MNR397]
	block = 'MNR397'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00337058 0.113736  '
	ref_diffusivity = '1.64898  0.246878'
	ref_sigma_r = '0.0304994 0.0731982'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00020974; 0.0266375 0.       '
	sph_factors_uo = uo_gcu_MNR397
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC79]
	block = 'MNRC79'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00154305 0.0494753 '
	ref_diffusivity = '1.58795  0.232132'
	ref_sigma_r = '0.0332714 0.0440771'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00018944; 0.0305181 0.       '
	sph_factors_uo = uo_gcu_MNRC79
	normalization_factors_uo = total

[]
[./mat_gcu_MNR393]
	block = 'MNR393'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00329229 0.111041  '
	ref_diffusivity = '1.63872 0.24486'
	ref_sigma_r = '0.0306049 0.0725409'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.        0.0002256; 0.026742 0.      '
	sph_factors_uo = uo_gcu_MNR393
	normalization_factors_uo = total

[]
[./mat_gcu_MNR392]
	block = 'MNR392'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00322191 0.108515  '
	ref_diffusivity = '1.632    0.247271'
	ref_sigma_r = '0.0308107 0.0714053'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.        0.0002366; 0.0269412 0.       '
	sph_factors_uo = uo_gcu_MNR392
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC77]
	block = 'MNRC77'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.0011599 0.0377577'
	ref_diffusivity = '1.57151 0.23106'
	ref_sigma_r = '0.0341264 0.0387782'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00018078; 0.0313675 0.       '
	sph_factors_uo = uo_gcu_MNRC77
	normalization_factors_uo = total

[]
[./mat_gcu_MNR396]
	block = 'MNR396'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00336157 0.113412  '
	ref_diffusivity = '1.651    0.246882'
	ref_sigma_r = '0.0304768 0.0730465'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00020535; 0.0266288 0.       '
	sph_factors_uo = uo_gcu_MNR396
	normalization_factors_uo = total

[]
[./mat_gcu_MNR376]
	block = 'MNR376'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00247102 0.0856923 '
	ref_diffusivity = '1.62066  0.245887'
	ref_sigma_r = '0.0313028 0.0611264'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00020938; 0.0275006 0.       '
	sph_factors_uo = uo_gcu_MNR376
	normalization_factors_uo = total

[]
[./mat_gcu_MNR385]
	block = 'MNR385'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00301085 0.103576  '
	ref_diffusivity = '1.63828  0.248098'
	ref_sigma_r = '0.030659  0.0692846'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00021796; 0.0268531 0.       '
	sph_factors_uo = uo_gcu_MNR385
	normalization_factors_uo = total

[]
[./mat_gcu_010400]
	block = 'u10400'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.42772  0.171624'
	ref_sigma_r = '0.0514227 0.0181205'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00013613; 0.0509457 0.       '
	sph_factors_uo = uo_gcu_010400
	normalization_factors_uo = total

[]
[./mat_gcu_MNR381]
	block = 'MNR381'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00271062 0.0935486 '
	ref_diffusivity = '1.62129  0.247503'
	ref_sigma_r = '0.0313168 0.0649376'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00022116; 0.0274873 0.       '
	sph_factors_uo = uo_gcu_MNR381
	normalization_factors_uo = total

[]
[./mat_gcu_MNR377]
	block = 'MNR377'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00269541 0.0933103 '
	ref_diffusivity = '1.61438  0.247302'
	ref_sigma_r = '0.0312573 0.0646224'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00024494; 0.0274398 0.       '
	sph_factors_uo = uo_gcu_MNR377
	normalization_factors_uo = total

[]
[./mat_gcu_MNR375]
	block = 'MNR375'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00247222 0.0855822 '
	ref_diffusivity = '1.62171  0.245891'
	ref_sigma_r = '0.0313726 0.0610853'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00020988; 0.0275748 0.       '
	sph_factors_uo = uo_gcu_MNR375
	normalization_factors_uo = total

[]
[./mat_gcu_MNR366]
	block = 'MNR366'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00206144 0.0722383 '
	ref_diffusivity = '1.61209  0.243964'
	ref_sigma_r = '0.0322035 0.0552659'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00018227; 0.0284021 0.       '
	sph_factors_uo = uo_gcu_MNR366
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC78]
	block = 'MNRC78'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00122341 0.0396345 '
	ref_diffusivity = '1.57365  0.231331'
	ref_sigma_r = '0.0342341 0.0397269'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00017544; 0.0314522 0.       '
	sph_factors_uo = uo_gcu_MNRC78
	normalization_factors_uo = total

[]
[./mat_gcu_MNR384]
	block = 'MNR384'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00302522 0.103704  '
	ref_diffusivity = '1.62674  0.245762'
	ref_sigma_r = '0.0310524 0.0695697'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00022928; 0.0272053 0.       '
	sph_factors_uo = uo_gcu_MNR384
	normalization_factors_uo = total

[]
[./mat_gcu_MNR391]
	block = 'MNR391'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00309498 0.104929  '
	ref_diffusivity = '1.61912  0.249064'
	ref_sigma_r = '0.0310961 0.0699391'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00025095; 0.0272199 0.       '
	sph_factors_uo = uo_gcu_MNR391
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC76]
	block = 'MNRC76'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00111614 0.0357977 '
	ref_diffusivity = '1.56232  0.231167'
	ref_sigma_r = '0.0345557 0.0379377'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00018096; 0.0317634 0.       '
	sph_factors_uo = uo_gcu_MNRC76
	normalization_factors_uo = total

[]
[./mat_gcu_MNR374]
	block = 'MNR374'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00228299 0.0799115 '
	ref_diffusivity = '1.61678  0.245367'
	ref_sigma_r = '0.0319109 0.0587623'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00019522; 0.0280934 0.       '
	sph_factors_uo = uo_gcu_MNR374
	normalization_factors_uo = total

[]
[./mat_gcu_MNR362]
	block = 'MNR362'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00195939 0.0677102 '
	ref_diffusivity = '1.58887  0.242032'
	ref_sigma_r = '0.0327108 0.0532383'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00017621; 0.0288819 0.       '
	sph_factors_uo = uo_gcu_MNR362
	normalization_factors_uo = total

[]
[./mat_gcu_MNR358]
	block = 'MNR358'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00216804 0.0756598 '
	ref_diffusivity = '1.59667 0.24532'
	ref_sigma_r = '0.0320637 0.0567168'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00022376; 0.0282611 0.       '
	sph_factors_uo = uo_gcu_MNR358
	normalization_factors_uo = total

[]
[./mat_gcu_MNR383]
	block = 'MNR383'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00270698 0.0929828 '
	ref_diffusivity = '1.6098   0.247355'
	ref_sigma_r = '0.0314499 0.0645551'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00024907; 0.0275986 0.       '
	sph_factors_uo = uo_gcu_MNR383
	normalization_factors_uo = total

[]
[./mat_gcu_MNR388]
	block = 'MNR388'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00304787 0.102563  '
	ref_diffusivity = '1.61296  0.249011'
	ref_sigma_r = '0.0312119 0.0687417'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00026503; 0.0273341 0.       '
	sph_factors_uo = uo_gcu_MNR388
	normalization_factors_uo = total

[]
[./mat_gcu_MNR395]
	block = 'MNR395'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00338385 0.112554  '
	ref_diffusivity = '1.62331  0.249812'
	ref_sigma_r = '0.0308017 0.0728426'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00026913; 0.0268962 0.       '
	sph_factors_uo = uo_gcu_MNR395
	normalization_factors_uo = total

[]
[./mat_gcu_MNR372]
	block = 'MNR372'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00245772 0.0848827 '
	ref_diffusivity = '1.61841  0.245767'
	ref_sigma_r = '0.0314826 0.060762 '
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00021376; 0.0276805 0.       '
	sph_factors_uo = uo_gcu_MNR372
	normalization_factors_uo = total

[]
[./mat_gcu_010500]
	block = 'u10500'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '0.896274 0.30348 '
	ref_sigma_r = '0.0177369  0.00601289'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00012524; 0.0165992 0.       '
	sph_factors_uo = uo_gcu_010500
	normalization_factors_uo = total

[]
[./mat_gcu_MNR373]
	block = 'MNR373'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.0024074 0.0836988'
	ref_diffusivity = '1.59097  0.246023'
	ref_sigma_r = '0.0322274 0.0604261'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00020821; 0.028356 0.      '
	sph_factors_uo = uo_gcu_MNR373
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC74]
	block = 'MNRC74'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00094131 0.0302906 '
	ref_diffusivity = '1.55497  0.230474'
	ref_sigma_r = '0.0351161 0.0354281'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00016917; 0.0323096 0.       '
	sph_factors_uo = uo_gcu_MNRC74
	normalization_factors_uo = total

[]
[./mat_gcu_MNR378]
	block = 'MNR378'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00268982 0.0930782 '
	ref_diffusivity = '1.60953  0.247997'
	ref_sigma_r = '0.0316692 0.0646157'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00023353; 0.0278138 0.       '
	sph_factors_uo = uo_gcu_MNR378
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC80]
	block = 'MNRC80'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00155854 0.0483204 '
	ref_diffusivity = '1.55288  0.236648'
	ref_sigma_r = '0.0326894 0.0452126'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00020871; 0.0302201 0.       '
	sph_factors_uo = uo_gcu_MNRC80
	normalization_factors_uo = total

[]
[./mat_gcu_MNR382]
	block = 'MNR382'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00292869 0.0993252 '
	ref_diffusivity = '1.62789  0.247389'
	ref_sigma_r = '0.0312122 0.0671297'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.        0.0002219; 0.0273647 0.       '
	sph_factors_uo = uo_gcu_MNR382
	normalization_factors_uo = total

[]
[./mat_gcu_MNR369]
	block = 'MNR369'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00228078 0.0784626 '
	ref_diffusivity = '1.61311  0.239744'
	ref_sigma_r = '0.0318812 0.0578378'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00016326; 0.0280896 0.       '
	sph_factors_uo = uo_gcu_MNR369
	normalization_factors_uo = total

[]
[./mat_gcu_MNR365]
	block = 'MNR365'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00227277 0.0785367 '
	ref_diffusivity = '1.61218  0.242604'
	ref_sigma_r = '0.0317843 0.0577917'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00019576; 0.0279855 0.       '
	sph_factors_uo = uo_gcu_MNR365
	normalization_factors_uo = total

[]
[./mat_gcu_MNR361]
	block = 'MNR361'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00204601 0.0715026 '
	ref_diffusivity = '1.61165  0.242032'
	ref_sigma_r = '0.031886  0.0547899'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00019465; 0.02812 0.     '
	sph_factors_uo = uo_gcu_MNR361
	normalization_factors_uo = total

[]
[./mat_gcu_MNR390]
	block = 'MNR390'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.0031143 0.103927 '
	ref_diffusivity = '1.63149  0.245739'
	ref_sigma_r = '0.0308555 0.0690847'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00023068; 0.0270073 0.       '
	sph_factors_uo = uo_gcu_MNR390
	normalization_factors_uo = total

[]
[./mat_gcu_MNR387]
	block = 'MNR387'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00299397 0.100637  '
	ref_diffusivity = '1.62924  0.245757'
	ref_sigma_r = '0.0308203 0.0675531'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00023843; 0.0269946 0.       '
	sph_factors_uo = uo_gcu_MNR387
	normalization_factors_uo = total

[]
[./mat_gcu_MNR389]
	block = 'MNR389'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00302801 0.101654  '
	ref_diffusivity = '1.64398  0.245082'
	ref_sigma_r = '0.0306198 0.0679045'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00020543; 0.0268029 0.       '
	sph_factors_uo = uo_gcu_MNR389
	normalization_factors_uo = total

[]
[]



[UserObjects]
[./uo_gcu_A9plug]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = ' 76.29473089 346.72953571'
	block  = A9plug 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_B9plug]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '121.93696128 513.13298806'
	block  = B9plug 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_C9rifl]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '177.37594674 648.14616917'
	block  = C9rifl 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_D9graph]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '183.09982122 667.38915305'
	block  = D9graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_E9rifl]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '143.35634992 554.13055606'
	block  = E9rifl 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_F9plug]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = ' 75.75001457 353.65489009'
	block  = F9plug 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_A8graph]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '372.99440119 879.48783112'
	block  = A8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_B8graph]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = ' 649.15308049 1017.2643403 '
	block  = B8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_C8graph]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = ' 749.52434815 1178.88685655'
	block  = C8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_D8graph]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = ' 693.35118806 1291.62496367'
	block  = D8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_E8graph]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = ' 595.00699188 1017.89649891'
	block  = E8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_F8graph]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '349.65942054 827.1492619 '
	block  = F8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_A7rifl]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = ' 879.84176424 1180.29312556'
	block  = A7rifl 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR398]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1810.63854098  818.87252652'
	block  = MNR398 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR379]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2059.17151036 1059.10604825'
	block  = MNR379 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_D7rifl]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1612.76721708 1714.6942763 '
	block  = D7rifl 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR394]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1680.84918553  885.80563187'
	block  = MNR394 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_F7rifl]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = ' 839.53692094 1125.95208983'
	block  = F7rifl 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR397]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1789.27952916  867.79100409'
	block  = MNR397 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC79]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2380.13395817 1453.19637728'
	block  = MNRC79 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR393]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3066.6884948 1374.706504 '
	block  = MNR393 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR392]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3106.03752942 1351.01001947'
	block  = MNR392 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC77]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2360.73388098 1563.53833827'
	block  = MNRC77 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR396]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1790.56277329  875.52075192'
	block  = MNR396 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR376]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2120.00258167 1066.23392051'
	block  = MNR376 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR385]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3071.42022094 1435.97667949'
	block  = MNR385 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_010400]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2720.09901819 3615.0198473 '
	block  = u10400 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR381]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3887.28336964 1837.91410316'
	block  = MNR381 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR377]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3405.66935577 1457.52685305'
	block  = MNR377 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR375]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2261.27299743 1132.72792167'
	block  = MNR375 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR366]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2067.72647123 1239.38481434'
	block  = MNR366 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC78]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2936.14963393 2000.97127878'
	block  = MNRC78 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR384]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '4166.81482334 1877.70602735'
	block  = MNR384 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR391]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '4501.1964465  1846.21165813'
	block  = MNR391 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC76]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3364.33299618 2233.60186294'
	block  = MNRC76 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR374]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2410.62520145 1329.99169193'
	block  = MNR374 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR362]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1905.16328782 1197.62449209'
	block  = MNR362 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR358]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3086.25891413 1502.60695437'
	block  = MNR358 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR383]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '4038.37684888 1720.21903974'
	block  = MNR383 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR388]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '4410.08232787 1725.6813444 '
	block  = MNR388 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR395]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3852.62820736 1461.82515308'
	block  = MNR395 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR372]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2452.51044128 1206.19837986'
	block  = MNR372 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_010500]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1304.75077199 1419.04656335'
	block  = u10500 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR373]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2496.91295941 1293.39841463'
	block  = MNR373 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC74]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2754.8866688  1986.00009726'
	block  = MNRC74 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR378]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3430.06613577 1545.47450054'
	block  = MNR378 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC80]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2835.72347825 1641.17839354'
	block  = MNRC80 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR382]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2096.04112047  992.93758985'
	block  = MNR382 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR369]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '951.85295808 638.082734  '
	block  = MNR369 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR365]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1546.81831077  840.61386181'
	block  = MNR365 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR361]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1914.66459391 1056.51116963'
	block  = MNR361 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR390]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2243.68990308  995.71605944'
	block  = MNR390 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR387]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2032.08710991  889.67239847'
	block  = MNR387 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR389]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1398.05473348  686.42583367'
	block  = MNR389 
	execute_on = 'LINEAR' 
[]
[./total]
	type = NormalizationFactorsUserObject
	SPH_user_objects = 'uo_gcu_A9plug uo_gcu_B9plug uo_gcu_C9rifl uo_gcu_D9graph uo_gcu_E9rifl uo_gcu_F9plug uo_gcu_A8graph uo_gcu_B8graph uo_gcu_C8graph uo_gcu_D8graph uo_gcu_E8graph uo_gcu_F8graph uo_gcu_A7rifl uo_gcu_MNR398 uo_gcu_MNR379 uo_gcu_D7rifl uo_gcu_MNR394 uo_gcu_F7rifl uo_gcu_MNR397 uo_gcu_MNRC79 uo_gcu_MNR393 uo_gcu_MNR392 uo_gcu_MNRC77 uo_gcu_MNR396 uo_gcu_MNR376 uo_gcu_MNR385 uo_gcu_010400 uo_gcu_MNR381 uo_gcu_MNR377 uo_gcu_MNR375 uo_gcu_MNR366 uo_gcu_MNRC78 uo_gcu_MNR384 uo_gcu_MNR391 uo_gcu_MNRC76 uo_gcu_MNR374 uo_gcu_MNR362 uo_gcu_MNR358 uo_gcu_MNR383 uo_gcu_MNR388 uo_gcu_MNR395 uo_gcu_MNR372 uo_gcu_010500 uo_gcu_MNR373 uo_gcu_MNRC74 uo_gcu_MNR378 uo_gcu_MNRC80 uo_gcu_MNR382 uo_gcu_MNR369 uo_gcu_MNR365 uo_gcu_MNR361 uo_gcu_MNR390 uo_gcu_MNR387 uo_gcu_MNR389 '
	ref_integrals = '109226.90644742  67438.45937635'
	execute_on = 'LINEAR' 
[]
[./output]
	type = OutputUserObject
	SPH_uo_names = 'uo_gcu_A9plug uo_gcu_B9plug uo_gcu_C9rifl uo_gcu_D9graph uo_gcu_E9rifl uo_gcu_F9plug uo_gcu_A8graph uo_gcu_B8graph uo_gcu_C8graph uo_gcu_D8graph uo_gcu_E8graph uo_gcu_F8graph uo_gcu_A7rifl uo_gcu_MNR398 uo_gcu_MNR379 uo_gcu_D7rifl uo_gcu_MNR394 uo_gcu_F7rifl uo_gcu_MNR397 uo_gcu_MNRC79 uo_gcu_MNR393 uo_gcu_MNR392 uo_gcu_MNRC77 uo_gcu_MNR396 uo_gcu_MNR376 uo_gcu_MNR385 uo_gcu_010400 uo_gcu_MNR381 uo_gcu_MNR377 uo_gcu_MNR375 uo_gcu_MNR366 uo_gcu_MNRC78 uo_gcu_MNR384 uo_gcu_MNR391 uo_gcu_MNRC76 uo_gcu_MNR374 uo_gcu_MNR362 uo_gcu_MNR358 uo_gcu_MNR383 uo_gcu_MNR388 uo_gcu_MNR395 uo_gcu_MNR372 uo_gcu_010500 uo_gcu_MNR373 uo_gcu_MNRC74 uo_gcu_MNR378 uo_gcu_MNRC80 uo_gcu_MNR382 uo_gcu_MNR369 uo_gcu_MNR365 uo_gcu_MNR361 uo_gcu_MNR390 uo_gcu_MNR387 uo_gcu_MNR389 '
	execute_on = 'TIMESTEP_END'
	normalization_uo_name = total
	surface_integrators = 'alb_0 alb_1'
	ref_surface_integrals = '845.23202653 -21.00394309'
[]
[]

[ICs]
[./IC_gcu_A9plug]
	type = ArrayConstantIC
	variable = flux 
	value = '0.01694988 0.07703053'
	block  = A9plug 
[]
[./IC_gcu_B9plug]
	type = ArrayConstantIC
	variable = flux 
	value = '0.0270899  0.11399924'
	block  = B9plug 
[]
[./IC_gcu_C9rifl]
	type = ArrayConstantIC
	variable = flux 
	value = '0.0394064 0.1439942'
	block  = C9rifl 
[]
[./IC_gcu_D9graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.04067803 0.14826928'
	block  = D9graph 
[]
[./IC_gcu_E9rifl]
	type = ArrayConstantIC
	variable = flux 
	value = '0.0318485  0.12310739'
	block  = E9rifl 
[]
[./IC_gcu_F9plug]
	type = ArrayConstantIC
	variable = flux 
	value = '0.01682886 0.07856909'
	block  = F9plug 
[]
[./IC_gcu_A8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.08286561 0.19538979'
	block  = A8graph 
[]
[./IC_gcu_B8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.1442179  0.22599865'
	block  = B8graph 
[]
[./IC_gcu_C8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.16651669 0.26190522'
	block  = C8graph 
[]
[./IC_gcu_D8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.15403709 0.28695148'
	block  = D8graph 
[]
[./IC_gcu_E8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.13218863 0.2261391 '
	block  = E8graph 
[]
[./IC_gcu_F8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.07768144 0.18376209'
	block  = F8graph 
[]
[./IC_gcu_A7rifl]
	type = ArrayConstantIC
	variable = flux 
	value = '0.19546842 0.26221764'
	block  = A7rifl 
[]
[./IC_gcu_MNR398]
	type = ArrayConstantIC
	variable = flux 
	value = '0.40225717 0.1819233 '
	block  = MNR398 
[]
[./IC_gcu_MNR379]
	type = ArrayConstantIC
	variable = flux 
	value = '0.45747204 0.23529434'
	block  = MNR379 
[]
[./IC_gcu_D7rifl]
	type = ArrayConstantIC
	variable = flux 
	value = '0.35829745 0.38094189'
	block  = D7rifl 
[]
[./IC_gcu_MNR394]
	type = ArrayConstantIC
	variable = flux 
	value = '0.37342276 0.19679337'
	block  = MNR394 
[]
[./IC_gcu_F7rifl]
	type = ArrayConstantIC
	variable = flux 
	value = '0.18651417 0.25014507'
	block  = F7rifl 
[]
[./IC_gcu_MNR397]
	type = ArrayConstantIC
	variable = flux 
	value = '0.39751198 0.19279119'
	block  = MNR397 
[]
[./IC_gcu_MNRC79]
	type = ArrayConstantIC
	variable = flux 
	value = '0.52877807 0.32284669'
	block  = MNRC79 
[]
[./IC_gcu_MNR393]
	type = ArrayConstantIC
	variable = flux 
	value = '0.68130519 0.30540913'
	block  = MNR393 
[]
[./IC_gcu_MNR392]
	type = ArrayConstantIC
	variable = flux 
	value = '0.69004709 0.30014465'
	block  = MNR392 
[]
[./IC_gcu_MNRC77]
	type = ArrayConstantIC
	variable = flux 
	value = '0.52446809 0.34736061'
	block  = MNRC77 
[]
[./IC_gcu_MNR396]
	type = ArrayConstantIC
	variable = flux 
	value = '0.39779707 0.19450845'
	block  = MNR396 
[]
[./IC_gcu_MNR376]
	type = ArrayConstantIC
	variable = flux 
	value = '0.47098646 0.23687789'
	block  = MNR376 
[]
[./IC_gcu_MNR385]
	type = ArrayConstantIC
	variable = flux 
	value = '0.6823564  0.31902111'
	block  = MNR385 
[]
[./IC_gcu_010400]
	type = ArrayConstantIC
	variable = flux 
	value = '0.60430578 0.80312421'
	block  = u10400 
[]
[./IC_gcu_MNR381]
	type = ArrayConstantIC
	variable = flux 
	value = '0.86361113 0.40831679'
	block  = MNR381 
[]
[./IC_gcu_MNR377]
	type = ArrayConstantIC
	variable = flux 
	value = '0.75661425 0.32380876'
	block  = MNR377 
[]
[./IC_gcu_MNR375]
	type = ArrayConstantIC
	variable = flux 
	value = '0.50237154 0.25165041'
	block  = MNR375 
[]
[./IC_gcu_MNR366]
	type = ArrayConstantIC
	variable = flux 
	value = '0.45937263 0.27534564'
	block  = MNR366 
[]
[./IC_gcu_MNRC78]
	type = ArrayConstantIC
	variable = flux 
	value = '0.65230426 0.44454209'
	block  = MNRC78 
[]
[./IC_gcu_MNR384]
	type = ArrayConstantIC
	variable = flux 
	value = '0.92571272 0.41715709'
	block  = MNR384 
[]
[./IC_gcu_MNR391]
	type = ArrayConstantIC
	variable = flux 
	value = '1.         0.41016021'
	block  = MNR391 
[]
[./IC_gcu_MNRC76]
	type = ArrayConstantIC
	variable = flux 
	value = '0.74743083 0.49622403'
	block  = MNRC76 
[]
[./IC_gcu_MNR374]
	type = ArrayConstantIC
	variable = flux 
	value = '0.5355521  0.29547515'
	block  = MNR374 
[]
[./IC_gcu_MNR362]
	type = ArrayConstantIC
	variable = flux 
	value = '0.42325709 0.26606803'
	block  = MNR362 
[]
[./IC_gcu_MNR358]
	type = ArrayConstantIC
	variable = flux 
	value = '0.68565301 0.3338239 '
	block  = MNR358 
[]
[./IC_gcu_MNR383]
	type = ArrayConstantIC
	variable = flux 
	value = '0.89717854 0.38216929'
	block  = MNR383 
[]
[./IC_gcu_MNR388]
	type = ArrayConstantIC
	variable = flux 
	value = '0.9797578  0.38338281'
	block  = MNR388 
[]
[./IC_gcu_MNR395]
	type = ArrayConstantIC
	variable = flux 
	value = '0.85591203 0.32476369'
	block  = MNR395 
[]
[./IC_gcu_MNR372]
	type = ArrayConstantIC
	variable = flux 
	value = '0.54485746 0.26797284'
	block  = MNR372 
[]
[./IC_gcu_010500]
	type = ArrayConstantIC
	variable = flux 
	value = '0.28986755 0.31525986'
	block  = u10500 
[]
[./IC_gcu_MNR373]
	type = ArrayConstantIC
	variable = flux 
	value = '0.55472206 0.28734547'
	block  = MNR373 
[]
[./IC_gcu_MNRC74]
	type = ArrayConstantIC
	variable = flux 
	value = '0.61203431 0.44121605'
	block  = MNRC74 
[]
[./IC_gcu_MNR378]
	type = ArrayConstantIC
	variable = flux 
	value = '0.76203431 0.34334749'
	block  = MNR378 
[]
[./IC_gcu_MNRC80]
	type = ArrayConstantIC
	variable = flux 
	value = '0.62999327 0.36460937'
	block  = MNRC80 
[]
[./IC_gcu_MNR382]
	type = ArrayConstantIC
	variable = flux 
	value = '0.46566311 0.22059415'
	block  = MNR382 
[]
[./IC_gcu_MNR369]
	type = ArrayConstantIC
	variable = flux 
	value = '0.21146666 0.14175847'
	block  = MNR369 
[]
[./IC_gcu_MNR365]
	type = ArrayConstantIC
	variable = flux 
	value = '0.34364603 0.18675343'
	block  = MNR365 
[]
[./IC_gcu_MNR361]
	type = ArrayConstantIC
	variable = flux 
	value = '0.42536793 0.23471785'
	block  = MNR361 
[]
[./IC_gcu_MNR390]
	type = ArrayConstantIC
	variable = flux 
	value = '0.49846523 0.22121142'
	block  = MNR390 
[]
[./IC_gcu_MNR387]
	type = ArrayConstantIC
	variable = flux 
	value = '0.45145488 0.19765243'
	block  = MNR387 
[]
[./IC_gcu_MNR389]
	type = ArrayConstantIC
	variable = flux 
	value = '0.31059625 0.15249853'
	block  = MNR389 
[]
[]


