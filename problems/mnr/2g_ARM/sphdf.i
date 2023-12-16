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
	albedo_matrix = '3.22201E-01 8.67124E-06; 2.03017E-01 7.72685E-01'
    execute_on = 'LINEAR'
    boundary = 'north south west east bottom top'
[]
[./alb_1]
    type = AlbedoCorrectedArraySideIntegralPostprocessor
    variable = flux
	albedo_matrix = '3.22201E-01 8.67124E-06; 2.03017E-01 7.72685E-01'
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
	albedo_matrix = '3.22201E-01 8.67124E-06; 2.03017E-01 7.72685E-01'
	ref_current_integral = '856.91699146 -19.52557558'
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
	ref_diffusivity = '1.4222   0.149933'
	ref_sigma_r = '0.0682088 0.0192188'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 4.73019e-05; 0.0676358 0.       '
	sph_factors_uo = uo_gcu_F9plug
	normalization_factors_uo = total

[]
[./mat_gcu_F8graph]
	block = 'F8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.29986  0.331376'
	ref_sigma_r = '0.0221386  0.00764132'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 5.51137e-05; 0.021906 0.      '
	sph_factors_uo = uo_gcu_F8graph
	normalization_factors_uo = total

[]
[./mat_gcu_F7rifl]
	block = 'F7rifl'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '2.28812  0.266106'
	ref_sigma_r = '0.0315503 0.011811 '
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 7.91071e-05; 0.031249 0.      '
	sph_factors_uo = uo_gcu_F7rifl
	normalization_factors_uo = total

[]
[./mat_gcu_MNR396]
	block = 'MNR396'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00335329 0.112358  '
	ref_diffusivity = '1.65173  0.246761'
	ref_sigma_r = '0.0302408 0.0725353'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.        0.0002134; 0.0264007 0.       '
	sph_factors_uo = uo_gcu_MNR396
	normalization_factors_uo = total

[]
[./mat_gcu_MNR375]
	block = 'MNR375'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00244972 0.0850705 '
	ref_diffusivity = '1.62506  0.246397'
	ref_sigma_r = '0.0311873 0.0608388'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00021061; 0.0274053 0.       '
	sph_factors_uo = uo_gcu_MNR375
	normalization_factors_uo = total

[]
[./mat_gcu_MNR374]
	block = 'MNR374'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00226137 0.0787432 '
	ref_diffusivity = '1.61647  0.245161'
	ref_sigma_r = '0.0317485 0.0581329'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00020639; 0.0279379 0.       '
	sph_factors_uo = uo_gcu_MNR374
	normalization_factors_uo = total

[]
[./mat_gcu_MNR372]
	block = 'MNR372'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00243157 0.0846448 '
	ref_diffusivity = '1.62057 0.24621'
	ref_sigma_r = '0.0311857 0.060627 '
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.        0.0002175; 0.0274028 0.       '
	sph_factors_uo = uo_gcu_MNR372
	normalization_factors_uo = total

[]
[./mat_gcu_MNR382]
	block = 'MNR382'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00291995 0.0994481 '
	ref_diffusivity = '1.63176  0.248009'
	ref_sigma_r = '0.0309053 0.0672019'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00022376; 0.0270788 0.       '
	sph_factors_uo = uo_gcu_MNR382
	normalization_factors_uo = total

[]
[./mat_gcu_MNR389]
	block = 'MNR389'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00301658 0.101766  '
	ref_diffusivity = '1.64662 0.24567'
	ref_sigma_r = '0.0302828 0.0680114'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00020944; 0.0264796 0.       '
	sph_factors_uo = uo_gcu_MNR389
	normalization_factors_uo = total

[]
[./mat_gcu_E9rifl]
	block = 'E9rifl'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '2.23703  0.260562'
	ref_sigma_r = '0.0394705 0.011922 '
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 3.77371e-05; 0.0391172 0.       '
	sph_factors_uo = uo_gcu_E9rifl
	normalization_factors_uo = total

[]
[./mat_gcu_E8graph]
	block = 'E8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.30734  0.334793'
	ref_sigma_r = '0.0204347  0.00760198'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.0000e+00 7.0198e-05; 0.020222 0.      '
	sph_factors_uo = uo_gcu_E8graph
	normalization_factors_uo = total

[]
[./mat_gcu_MNR394]
	block = 'MNR394'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00328531 0.111325  '
	ref_diffusivity = '1.65141  0.247048'
	ref_sigma_r = '0.0303268 0.0722926'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00019803; 0.026531 0.      '
	sph_factors_uo = uo_gcu_MNR394
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC77]
	block = 'MNRC77'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00113833 0.0387775 '
	ref_diffusivity = '1.5538   0.230778'
	ref_sigma_r = '0.0354015 0.0503698'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00020162; 0.0291267 0.       '
	sph_factors_uo = uo_gcu_MNRC77
	normalization_factors_uo = total

[]
[./mat_gcu_MNR377]
	block = 'MNR377'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00268942 0.0927015 '
	ref_diffusivity = '1.61369  0.248695'
	ref_sigma_r = '0.0311803 0.0642824'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00024793; 0.0273691 0.       '
	sph_factors_uo = uo_gcu_MNR377
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC76]
	block = 'MNRC76'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00109811 0.0368386 '
	ref_diffusivity = '1.54509  0.230946'
	ref_sigma_r = '0.0357852 0.0499701'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00020128; 0.0293529 0.       '
	sph_factors_uo = uo_gcu_MNRC76
	normalization_factors_uo = total

[]
[./mat_gcu_MNR395]
	block = 'MNR395'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00337353 0.112506  '
	ref_diffusivity = '1.62561  0.250515'
	ref_sigma_r = '0.0305749 0.0728119'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.        0.0002744; 0.0266791 0.       '
	sph_factors_uo = uo_gcu_MNR395
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC80]
	block = 'MNRC80'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00154457 0.0479719 '
	ref_diffusivity = '1.55699  0.233999'
	ref_sigma_r = '0.0328214 0.0445155'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00020954; 0.0303771 0.       '
	sph_factors_uo = uo_gcu_MNRC80
	normalization_factors_uo = total

[]
[./mat_gcu_MNR387]
	block = 'MNR387'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00298021 0.10083   '
	ref_diffusivity = '1.63375  0.246274'
	ref_sigma_r = '0.0304677 0.0676133'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00023471; 0.0266739 0.       '
	sph_factors_uo = uo_gcu_MNR387
	normalization_factors_uo = total

[]
[./mat_gcu_D9graph]
	block = 'D9graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.29476 0.32963'
	ref_sigma_r = '0.024521  0.0076921'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 3.90048e-05; 0.0242716 0.       '
	sph_factors_uo = uo_gcu_D9graph
	normalization_factors_uo = total

[]
[./mat_gcu_D8graph]
	block = 'D8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.27851  0.332824'
	ref_sigma_r = '0.0221427  0.00764972'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.0000e+00 6.9389e-05; 0.021912 0.      '
	sph_factors_uo = uo_gcu_D8graph
	normalization_factors_uo = total

[]
[./mat_gcu_D7rifl]
	block = 'D7rifl'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '2.27459  0.268766'
	ref_sigma_r = '0.0310472 0.0118151'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00010062; 0.0307469 0.       '
	sph_factors_uo = uo_gcu_D7rifl
	normalization_factors_uo = total

[]
[./mat_gcu_MNR392]
	block = 'MNR392'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00319747 0.10799   '
	ref_diffusivity = '1.63193 0.24743'
	ref_sigma_r = '0.030594  0.0710613'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.        0.0002414; 0.0267463 0.       '
	sph_factors_uo = uo_gcu_MNR392
	normalization_factors_uo = total

[]
[./mat_gcu_MNR381]
	block = 'MNR381'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00268802 0.0933567 '
	ref_diffusivity = '1.62315  0.248066'
	ref_sigma_r = '0.0311113 0.0648568'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00022322; 0.0273081 0.       '
	sph_factors_uo = uo_gcu_MNR381
	normalization_factors_uo = total

[]
[./mat_gcu_MNR391]
	block = 'MNR391'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00307618 0.104335  '
	ref_diffusivity = '1.61863 0.24937'
	ref_sigma_r = '0.0308898 0.0695991'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00025843; 0.0270273 0.       '
	sph_factors_uo = uo_gcu_MNR391
	normalization_factors_uo = total

[]
[./mat_gcu_MNR388]
	block = 'MNR388'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00303217 0.102526  '
	ref_diffusivity = '1.61536  0.249722'
	ref_sigma_r = '0.0309775 0.0687057'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00026917; 0.0271114 0.       '
	sph_factors_uo = uo_gcu_MNR388
	normalization_factors_uo = total

[]
[./mat_gcu_MNR378]
	block = 'MNR378'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00266777 0.0925235 '
	ref_diffusivity = '1.60883  0.248294'
	ref_sigma_r = '0.031461 0.064336'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00024285; 0.0276228 0.       '
	sph_factors_uo = uo_gcu_MNR378
	normalization_factors_uo = total

[]
[./mat_gcu_MNR390]
	block = 'MNR390'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00309292 0.103829  '
	ref_diffusivity = '1.63359  0.246406'
	ref_sigma_r = '0.0305916 0.0690108'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.        0.0002355; 0.0267611 0.       '
	sph_factors_uo = uo_gcu_MNR390
	normalization_factors_uo = total

[]
[./mat_gcu_C9rifl]
	block = 'C9rifl'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '2.18939  0.259615'
	ref_sigma_r = '0.0401205 0.0119411'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 3.76681e-05; 0.0397655 0.       '
	sph_factors_uo = uo_gcu_C9rifl
	normalization_factors_uo = total

[]
[./mat_gcu_C8graph]
	block = 'C8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.29602  0.334746'
	ref_sigma_r = '0.0206284  0.00759846'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 7.71426e-05; 0.0204172 0.       '
	sph_factors_uo = uo_gcu_C8graph
	normalization_factors_uo = total

[]
[./mat_gcu_MNR379]
	block = 'MNR379'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00251166 0.0876459 '
	ref_diffusivity = '1.61786  0.245478'
	ref_sigma_r = '0.0312808 0.0620286'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00021182; 0.0274893 0.       '
	sph_factors_uo = uo_gcu_MNR379
	normalization_factors_uo = total

[]
[./mat_gcu_MNR393]
	block = 'MNR393'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00327048 0.110441  '
	ref_diffusivity = '1.63878 0.24499'
	ref_sigma_r = '0.0303747 0.072246 '
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00023036; 0.0265274 0.       '
	sph_factors_uo = uo_gcu_MNR393
	normalization_factors_uo = total

[]
[./mat_gcu_010400]
	block = 'u10400'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.42725  0.171634'
	ref_sigma_r = '0.0513076 0.0181416'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00013755; 0.0508311 0.       '
	sph_factors_uo = uo_gcu_010400
	normalization_factors_uo = total

[]
[./mat_gcu_MNR384]
	block = 'MNR384'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00300923 0.103104  '
	ref_diffusivity = '1.62721  0.246053'
	ref_sigma_r = '0.0308562 0.0692342'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00023651; 0.0270222 0.       '
	sph_factors_uo = uo_gcu_MNR384
	normalization_factors_uo = total

[]
[./mat_gcu_MNR383]
	block = 'MNR383'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00268626 0.0926519 '
	ref_diffusivity = '1.61073  0.248355'
	ref_sigma_r = '0.0312872 0.0644124'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00025162; 0.0274447 0.       '
	sph_factors_uo = uo_gcu_MNR383
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC74]
	block = 'MNRC74'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00091548 0.0307491 '
	ref_diffusivity = '1.53805  0.230349'
	ref_sigma_r = '0.0363812 0.0474219'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00018862; 0.0297486 0.       '
	sph_factors_uo = uo_gcu_MNRC74
	normalization_factors_uo = total

[]
[./mat_gcu_MNR361]
	block = 'MNR361'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00203312 0.0709554 '
	ref_diffusivity = '1.61109  0.242917'
	ref_sigma_r = '0.0317859 0.0544347'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.        0.0001992; 0.0280173 0.       '
	sph_factors_uo = uo_gcu_MNR361
	normalization_factors_uo = total

[]
[./mat_gcu_B9plug]
	block = 'B9plug'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.37187  0.150461'
	ref_sigma_r = '0.0695575 0.0191825'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.0000e+00 5.8419e-05; 0.0689793 0.       '
	sph_factors_uo = uo_gcu_B9plug
	normalization_factors_uo = total

[]
[./mat_gcu_B8graph]
	block = 'B8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.30289 0.33505'
	ref_sigma_r = '0.020352   0.00759393'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 7.70885e-05; 0.0201382 0.       '
	sph_factors_uo = uo_gcu_B8graph
	normalization_factors_uo = total

[]
[./mat_gcu_MNR398]
	block = 'MNR398'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00335675 0.11301   '
	ref_diffusivity = '1.63748  0.247921'
	ref_sigma_r = '0.0303012 0.0727374'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00022759; 0.0264609 0.       '
	sph_factors_uo = uo_gcu_MNR398
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC79]
	block = 'MNRC79'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.0015275 0.0514373'
	ref_diffusivity = '1.56965  0.231958'
	ref_sigma_r = '0.034474  0.0562382'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00021191; 0.0283331 0.       '
	sph_factors_uo = uo_gcu_MNRC79
	normalization_factors_uo = total

[]
[./mat_gcu_MNR385]
	block = 'MNR385'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00299639 0.102967  '
	ref_diffusivity = '1.63749  0.249141'
	ref_sigma_r = '0.0305458 0.0689651'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00022504; 0.0267511 0.       '
	sph_factors_uo = uo_gcu_MNR385
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC78]
	block = 'MNRC78'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00119753 0.0407284 '
	ref_diffusivity = '1.55614  0.230926'
	ref_sigma_r = '0.0355011 0.0516546'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00019229; 0.0291317 0.       '
	sph_factors_uo = uo_gcu_MNRC78
	normalization_factors_uo = total

[]
[./mat_gcu_MNR358]
	block = 'MNR358'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00214806 0.0751653 '
	ref_diffusivity = '1.59778  0.245956'
	ref_sigma_r = '0.0319393 0.0564421'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00022382; 0.0281361 0.       '
	sph_factors_uo = uo_gcu_MNR358
	normalization_factors_uo = total

[]
[./mat_gcu_MNR373]
	block = 'MNR373'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00238575 0.082812  '
	ref_diffusivity = '1.58998  0.246131'
	ref_sigma_r = '0.0320853 0.0599448'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00021687; 0.0282065 0.       '
	sph_factors_uo = uo_gcu_MNR373
	normalization_factors_uo = total

[]
[./mat_gcu_MNR365]
	block = 'MNR365'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00226415 0.0782591 '
	ref_diffusivity = '1.61461  0.243344'
	ref_sigma_r = '0.0315399 0.0576899'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00020027; 0.0277563 0.       '
	sph_factors_uo = uo_gcu_MNR365
	normalization_factors_uo = total

[]
[./mat_gcu_A9plug]
	block = 'A9plug'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.42964  0.149931'
	ref_sigma_r = '0.0673868 0.019209 '
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 5.60704e-05; 0.0668318 0.       '
	sph_factors_uo = uo_gcu_A9plug
	normalization_factors_uo = total

[]
[./mat_gcu_A8graph]
	block = 'A8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.29264 0.33173'
	ref_sigma_r = '0.0223767  0.00762054'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 5.56899e-05; 0.0221511 0.       '
	sph_factors_uo = uo_gcu_A8graph
	normalization_factors_uo = total

[]
[./mat_gcu_A7rifl]
	block = 'A7rifl'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '2.26897  0.265841'
	ref_sigma_r = '0.0318287 0.0118442'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 8.39927e-05; 0.0315222 0.       '
	sph_factors_uo = uo_gcu_A7rifl
	normalization_factors_uo = total

[]
[./mat_gcu_MNR397]
	block = 'MNR397'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00336312 0.112662  '
	ref_diffusivity = '1.64848  0.246881'
	ref_sigma_r = '0.0302802 0.0726128'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00022016; 0.0264325 0.       '
	sph_factors_uo = uo_gcu_MNR397
	normalization_factors_uo = total

[]
[./mat_gcu_MNR376]
	block = 'MNR376'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00245323 0.0852881 '
	ref_diffusivity = '1.62463  0.246297'
	ref_sigma_r = '0.0310802 0.0609296'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.        0.0002088; 0.0273069 0.       '
	sph_factors_uo = uo_gcu_MNR376
	normalization_factors_uo = total

[]
[./mat_gcu_MNR366]
	block = 'MNR366'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00203145 0.0710548 '
	ref_diffusivity = '1.60962  0.244023'
	ref_sigma_r = '0.0320388 0.0546528'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00018983; 0.0282509 0.       '
	sph_factors_uo = uo_gcu_MNR366
	normalization_factors_uo = total

[]
[./mat_gcu_MNR362]
	block = 'MNR362'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00193906 0.0672882 '
	ref_diffusivity = '1.593    0.242346'
	ref_sigma_r = '0.0324648 0.05299  '
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00017644; 0.0286608 0.       '
	sph_factors_uo = uo_gcu_MNR362
	normalization_factors_uo = total

[]
[./mat_gcu_010500]
	block = 'u10500'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '0.898769 0.30466 '
	ref_sigma_r = '0.0176054  0.00585456'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00012528; 0.0164623 0.       '
	sph_factors_uo = uo_gcu_010500
	normalization_factors_uo = total

[]
[./mat_gcu_MNR369]
	block = 'MNR369'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00224926 0.0780871 '
	ref_diffusivity = '1.61752  0.240143'
	ref_sigma_r = '0.0315897 0.0576235'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00015961; 0.027835 0.      '
	sph_factors_uo = uo_gcu_MNR369
	normalization_factors_uo = total

[]
[]


[UserObjects]
[./uo_gcu_F9plug]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = ' 71.65983073 332.59574006'
	block  = F9plug 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_F8graph]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '327.56716282 774.31106734'
	block  = F8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_F7rifl]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = ' 784.9521045  1056.64618684'
	block  = F7rifl 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR396]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1687.93833721  793.18754504'
	block  = MNR396 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR375]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2181.72701617 1074.62079038'
	block  = MNR375 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR374]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2360.77239239 1245.26723891'
	block  = MNR374 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR372]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2567.96989631 1240.33926914'
	block  = MNR372 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR382]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2309.01343906 1078.79959376'
	block  = MNR382 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR389]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1583.87966536  765.84207372'
	block  = MNR389 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_E9rifl]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '136.38493186 524.97699656'
	block  = E9rifl 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_E8graph]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '567.71541172 964.79515428'
	block  = E8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR394]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1590.89703682  818.51188402'
	block  = MNR394 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC77]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2179.78672913 1196.71874201'
	block  = MNRC77 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR377]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3265.0898776  1353.65921848'
	block  = MNR377 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC76]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3226.40989616 1753.76796469'
	block  = MNRC76 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR395]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3982.11576667 1473.77376557'
	block  = MNR395 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC80]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3047.20282935 1772.89596109'
	block  = MNRC80 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR387]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2248.1279504   968.10801474'
	block  = MNR387 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_D9graph]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '174.82848572 633.19111648'
	block  = D9graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_D8graph]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = ' 660.56712935 1224.9085975 '
	block  = D8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_D7rifl]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1539.05364507 1645.1639908 '
	block  = D7rifl 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR392]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2993.66527957 1256.25680911'
	block  = MNR392 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR381]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3811.24474788 1769.49327252'
	block  = MNR381 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR391]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '4453.35399849 1754.62133168'
	block  = MNR391 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR388]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '4501.1964465  1725.02297152'
	block  = MNR388 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR378]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3536.19109446 1530.33852245'
	block  = MNR378 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR390]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2378.95360058 1035.16469413'
	block  = MNR390 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_C9rifl]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '168.22180836 615.59918066'
	block  = C9rifl 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_C8graph]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = ' 719.10990107 1123.49446502'
	block  = C8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR379]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1984.24891308 1004.97885817'
	block  = MNR379 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR393]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2936.76815871 1272.16716283'
	block  = MNR393 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_010400]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2628.28048511 3454.66310757'
	block  = u10400 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR384]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '4073.39908561 1768.23208595'
	block  = MNR384 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR383]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '4003.87213337 1658.48729514'
	block  = MNR383 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC74]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2665.82863244 1566.0667524 '
	block  = MNRC74 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR361]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1936.42443069 1043.23125784'
	block  = MNR361 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_B9plug]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '116.28517504 485.76882587'
	block  = B9plug 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_B8graph]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '618.18443348 959.55817584'
	block  = B8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR398]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1705.04520127  751.72289239'
	block  = MNR398 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC79]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2163.09666747 1100.93323851'
	block  = MNRC79 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR385]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2880.55373144 1311.81189811'
	block  = MNR385 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC78]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2717.33606708 1530.73556267'
	block  = MNRC78 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR358]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2993.10834533 1424.03774114'
	block  = MNR358 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR373]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2435.94054954 1208.8976363 '
	block  = MNR373 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR365]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1559.53804583  833.24908271'
	block  = MNR365 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_A9plug]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = ' 71.9512331 326.4550909'
	block  = A9plug 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_A8graph]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '347.64913368 819.52873816'
	block  = A8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_A7rifl]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = ' 812.55448419 1094.42788724'
	block  = A7rifl 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR397]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1654.72888728  774.26615328'
	block  = MNR397 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR376]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1992.38733927  984.39744306'
	block  = MNR376 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR366]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1937.61016165 1116.61542884'
	block  = MNR366 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR362]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1848.26712975 1148.43613629'
	block  = MNR362 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_010500]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1292.14852621 1397.63546491'
	block  = u10500 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR369]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '972.37484967 643.33809907'
	block  = MNR369 
	execute_on = 'LINEAR' 
[]
[./total]
	type = NormalizationFactorsUserObject
	SPH_user_objects = 'uo_gcu_F9plug uo_gcu_F8graph uo_gcu_F7rifl uo_gcu_MNR396 uo_gcu_MNR375 uo_gcu_MNR374 uo_gcu_MNR372 uo_gcu_MNR382 uo_gcu_MNR389 uo_gcu_E9rifl uo_gcu_E8graph uo_gcu_MNR394 uo_gcu_MNRC77 uo_gcu_MNR377 uo_gcu_MNRC76 uo_gcu_MNR395 uo_gcu_MNRC80 uo_gcu_MNR387 uo_gcu_D9graph uo_gcu_D8graph uo_gcu_D7rifl uo_gcu_MNR392 uo_gcu_MNR381 uo_gcu_MNR391 uo_gcu_MNR388 uo_gcu_MNR378 uo_gcu_MNR390 uo_gcu_C9rifl uo_gcu_C8graph uo_gcu_MNR379 uo_gcu_MNR393 uo_gcu_010400 uo_gcu_MNR384 uo_gcu_MNR383 uo_gcu_MNRC74 uo_gcu_MNR361 uo_gcu_B9plug uo_gcu_B8graph uo_gcu_MNR398 uo_gcu_MNRC79 uo_gcu_MNR385 uo_gcu_MNRC78 uo_gcu_MNR358 uo_gcu_MNR373 uo_gcu_MNR365 uo_gcu_A9plug uo_gcu_A8graph uo_gcu_A7rifl uo_gcu_MNR397 uo_gcu_MNR376 uo_gcu_MNR366 uo_gcu_MNR362 uo_gcu_010500 uo_gcu_MNR369 '
	ref_integrals = '107403.17821155  63181.71417369'
	execute_on = 'LINEAR' 
[]
[./output]
	type = OutputUserObject
	SPH_uo_names = 'uo_gcu_A9plug uo_gcu_B9plug uo_gcu_C9rifl uo_gcu_D9graph uo_gcu_E9rifl uo_gcu_F9plug uo_gcu_A8graph uo_gcu_B8graph uo_gcu_C8graph uo_gcu_D8graph uo_gcu_E8graph uo_gcu_F8graph uo_gcu_A7rifl uo_gcu_MNR398 uo_gcu_MNR379 uo_gcu_D7rifl uo_gcu_MNR394 uo_gcu_F7rifl uo_gcu_MNR397 uo_gcu_MNRC79 uo_gcu_MNR393 uo_gcu_MNR392 uo_gcu_MNRC77 uo_gcu_MNR396 uo_gcu_MNR376 uo_gcu_MNR385 uo_gcu_010400 uo_gcu_MNR381 uo_gcu_MNR377 uo_gcu_MNR375 uo_gcu_MNR366 uo_gcu_MNRC78 uo_gcu_MNR384 uo_gcu_MNR391 uo_gcu_MNRC76 uo_gcu_MNR374 uo_gcu_MNR362 uo_gcu_MNR358 uo_gcu_MNR383 uo_gcu_MNR388 uo_gcu_MNR395 uo_gcu_MNR372 uo_gcu_010500 uo_gcu_MNR373 uo_gcu_MNRC74 uo_gcu_MNR378 uo_gcu_MNRC80 uo_gcu_MNR382 uo_gcu_MNR369 uo_gcu_MNR365 uo_gcu_MNR361 uo_gcu_MNR390 uo_gcu_MNR387 uo_gcu_MNR389 '
	execute_on = 'TIMESTEP_END'
	normalization_uo_name = total
	surface_integrators = 'alb_0 alb_1'
    ref_surface_integrals  = '856.91699146 -19.52557558'
[]
[]


[ICs]
[./IC_gcu_F9plug]
	type = ArrayConstantIC
	variable = flux 
	value = '0.01592017 0.07389052'
	block  = F9plug 
[]
[./IC_gcu_F8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.07277335 0.17202339'
	block  = F8graph 
[]
[./IC_gcu_F7rifl]
	type = ArrayConstantIC
	variable = flux 
	value = '0.17438744 0.23474785'
	block  = F7rifl 
[]
[./IC_gcu_MNR396]
	type = ArrayConstantIC
	variable = flux 
	value = '0.37499771 0.17621705'
	block  = MNR396 
[]
[./IC_gcu_MNR375]
	type = ArrayConstantIC
	variable = flux 
	value = '0.48469936 0.23874114'
	block  = MNR375 
[]
[./IC_gcu_MNR374]
	type = ArrayConstantIC
	variable = flux 
	value = '0.52447664 0.2766525 '
	block  = MNR374 
[]
[./IC_gcu_MNR372]
	type = ArrayConstantIC
	variable = flux 
	value = '0.57050829 0.27555768'
	block  = MNR372 
[]
[./IC_gcu_MNR382]
	type = ArrayConstantIC
	variable = flux 
	value = '0.51297771 0.23966952'
	block  = MNR382 
[]
[./IC_gcu_MNR389]
	type = ArrayConstantIC
	variable = flux 
	value = '0.3518797  0.17014189'
	block  = MNR389 
[]
[./IC_gcu_E9rifl]
	type = ArrayConstantIC
	variable = flux 
	value = '0.03029971 0.11663055'
	block  = E9rifl 
[]
[./IC_gcu_E8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.12612545 0.21434193'
	block  = E8graph 
[]
[./IC_gcu_MNR394]
	type = ArrayConstantIC
	variable = flux 
	value = '0.3534387  0.18184318'
	block  = MNR394 
[]
[./IC_gcu_MNRC77]
	type = ArrayConstantIC
	variable = flux 
	value = '0.4842683  0.26586681'
	block  = MNRC77 
[]
[./IC_gcu_MNR377]
	type = ArrayConstantIC
	variable = flux 
	value = '0.72538267 0.3007332 '
	block  = MNR377 
[]
[./IC_gcu_MNRC76]
	type = ArrayConstantIC
	variable = flux 
	value = '0.7167894  0.38962262'
	block  = MNRC76 
[]
[./IC_gcu_MNR395]
	type = ArrayConstantIC
	variable = flux 
	value = '0.8846794  0.32741823'
	block  = MNR395 
[]
[./IC_gcu_MNRC80]
	type = ArrayConstantIC
	variable = flux 
	value = '0.67697619 0.39387216'
	block  = MNRC80 
[]
[./IC_gcu_MNR387]
	type = ArrayConstantIC
	variable = flux 
	value = '0.4994512  0.21507793'
	block  = MNR387 
[]
[./IC_gcu_D9graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.03884045 0.14067174'
	block  = D9graph 
[]
[./IC_gcu_D8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.14675368 0.27212956'
	block  = D8graph 
[]
[./IC_gcu_D7rifl]
	type = ArrayConstantIC
	variable = flux 
	value = '0.34192101 0.36549482'
	block  = D7rifl 
[]
[./IC_gcu_MNR392]
	type = ArrayConstantIC
	variable = flux 
	value = '0.66508212 0.27909398'
	block  = MNR392 
[]
[./IC_gcu_MNR381]
	type = ArrayConstantIC
	variable = flux 
	value = '0.84671815 0.39311621'
	block  = MNR381 
[]
[./IC_gcu_MNR391]
	type = ArrayConstantIC
	variable = flux 
	value = '0.98937117 0.38981221'
	block  = MNR391 
[]
[./IC_gcu_MNR388]
	type = ArrayConstantIC
	variable = flux 
	value = '1.         0.38323654'
	block  = MNR388 
[]
[./IC_gcu_MNR378]
	type = ArrayConstantIC
	variable = flux 
	value = '0.78561137 0.33998483'
	block  = MNR378 
[]
[./IC_gcu_MNR390]
	type = ArrayConstantIC
	variable = flux 
	value = '0.52851584 0.22997545'
	block  = MNR390 
[]
[./IC_gcu_C9rifl]
	type = ArrayConstantIC
	variable = flux 
	value = '0.03737269 0.13676346'
	block  = C9rifl 
[]
[./IC_gcu_C8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.15975972 0.24959907'
	block  = C8graph 
[]
[./IC_gcu_MNR379]
	type = ArrayConstantIC
	variable = flux 
	value = '0.440827   0.22326927'
	block  = MNR379 
[]
[./IC_gcu_MNR393]
	type = ArrayConstantIC
	variable = flux 
	value = '0.65244168 0.28262867'
	block  = MNR393 
[]
[./IC_gcu_010400]
	type = ArrayConstantIC
	variable = flux 
	value = '0.58390708 0.76749885'
	block  = u10400 
[]
[./IC_gcu_MNR384]
	type = ArrayConstantIC
	variable = flux 
	value = '0.90495919 0.39283602'
	block  = MNR384 
[]
[./IC_gcu_MNR383]
	type = ArrayConstantIC
	variable = flux 
	value = '0.88951286 0.36845477'
	block  = MNR383 
[]
[./IC_gcu_MNRC74]
	type = ArrayConstantIC
	variable = flux 
	value = '0.5922489  0.34792233'
	block  = MNRC74 
[]
[./IC_gcu_MNR361]
	type = ArrayConstantIC
	variable = flux 
	value = '0.43020216 0.23176755'
	block  = MNR361 
[]
[./IC_gcu_B9plug]
	type = ArrayConstantIC
	variable = flux 
	value = '0.02583428 0.10791993'
	block  = B9plug 
[]
[./IC_gcu_B8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.1373378  0.21317847'
	block  = B8graph 
[]
[./IC_gcu_MNR398]
	type = ArrayConstantIC
	variable = flux 
	value = '0.37879822 0.16700513'
	block  = MNR398 
[]
[./IC_gcu_MNRC79]
	type = ArrayConstantIC
	variable = flux 
	value = '0.48056038 0.2445868 '
	block  = MNRC79 
[]
[./IC_gcu_MNR385]
	type = ArrayConstantIC
	variable = flux 
	value = '0.6399529  0.29143627'
	block  = MNR385 
[]
[./IC_gcu_MNRC78]
	type = ArrayConstantIC
	variable = flux 
	value = '0.60369195 0.34007304'
	block  = MNRC78 
[]
[./IC_gcu_MNR358]
	type = ArrayConstantIC
	variable = flux 
	value = '0.66495839 0.31636872'
	block  = MNR358 
[]
[./IC_gcu_MNR373]
	type = ArrayConstantIC
	variable = flux 
	value = '0.54117624 0.26857251'
	block  = MNR373 
[]
[./IC_gcu_MNR365]
	type = ArrayConstantIC
	variable = flux 
	value = '0.34647189 0.18511724'
	block  = MNR365 
[]
[./IC_gcu_A9plug]
	type = ArrayConstantIC
	variable = flux 
	value = '0.01598491 0.07252629'
	block  = A9plug 
[]
[./IC_gcu_A8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.07723483 0.18206909'
	block  = A8graph 
[]
[./IC_gcu_A7rifl]
	type = ArrayConstantIC
	variable = flux 
	value = '0.18051967 0.24314155'
	block  = A7rifl 
[]
[./IC_gcu_MNR397]
	type = ArrayConstantIC
	variable = flux 
	value = '0.36761979 0.17201341'
	block  = MNR397 
[]
[./IC_gcu_MNR376]
	type = ArrayConstantIC
	variable = flux 
	value = '0.44263506 0.21869684'
	block  = MNR376 
[]
[./IC_gcu_MNR366]
	type = ArrayConstantIC
	variable = flux 
	value = '0.43046559 0.24807081'
	block  = MNR366 
[]
[./IC_gcu_MNR362]
	type = ArrayConstantIC
	variable = flux 
	value = '0.41061686 0.25514019'
	block  = MNR362 
[]
[./IC_gcu_010500]
	type = ArrayConstantIC
	variable = flux 
	value = '0.28706779 0.3105031 '
	block  = u10500 
[]
[./IC_gcu_MNR369]
	type = ArrayConstantIC
	variable = flux 
	value = '0.21602586 0.14292602'
	block  = MNR369 
[]
[]


