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
	albedo_matrix = '3.21422E-01  7.48311E-06; 2.05244E-01 7.76478E-01'
    execute_on = 'LINEAR'
    boundary = 'north south west east bottom top'
[]
[./alb_1]
    type = AlbedoCorrectedArraySideIntegralPostprocessor
    variable = flux
	albedo_matrix = '3.21422E-01  7.48311E-06; 2.05244E-01 7.76478E-01'
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
	albedo_matrix = '3.21422E-01  7.48311E-06; 2.05244E-01 7.76478E-01'
	ref_current_integral = '847.42951599 -20.42052615 '
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
	ref_diffusivity = '1.42101  0.149832'
	ref_sigma_r = '0.068183 0.019279'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 5.20157e-05; 0.0676363 0.       '
	sph_factors_uo = uo_gcu_F9plug
	normalization_factors_uo = total

[]
[./mat_gcu_F8graph]
	block = 'F8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.30211  0.331191'
	ref_sigma_r = '0.0223201 0.0076491'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 5.25043e-05; 0.022087 0.      '
	sph_factors_uo = uo_gcu_F8graph
	normalization_factors_uo = total

[]
[./mat_gcu_F7rifl]
	block = 'F7rifl'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '2.37578  0.276728'
	ref_sigma_r = '0.0304196 0.0113667'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 7.77146e-05; 0.0301199 0.       '
	sph_factors_uo = uo_gcu_F7rifl
	normalization_factors_uo = total

[]
[./mat_gcu_MNR396]
	block = 'MNR396'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00336719 0.113107  '
	ref_diffusivity = '1.65196  0.246692'
	ref_sigma_r = '0.0304251 0.0729201'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.        0.0002011; 0.0265777 0.       '
	sph_factors_uo = uo_gcu_MNR396
	normalization_factors_uo = total

[]
[./mat_gcu_MNR375]
	block = 'MNR375'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.0024714 0.0854761'
	ref_diffusivity = '1.62203 0.24533'
	ref_sigma_r = '0.0313998 0.0611207'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00020937; 0.0276124 0.       '
	sph_factors_uo = uo_gcu_MNR375
	normalization_factors_uo = total

[]
[./mat_gcu_MNR374]
	block = 'MNR374'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00228731 0.0796733 '
	ref_diffusivity = '1.6174   0.244951'
	ref_sigma_r = '0.0318706 0.058638 '
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00019404; 0.0280582 0.       '
	sph_factors_uo = uo_gcu_MNR374
	normalization_factors_uo = total

[]
[./mat_gcu_MNR372]
	block = 'MNR372'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00244956 0.0845605 '
	ref_diffusivity = '1.61764  0.245781'
	ref_sigma_r = '0.0314984 0.0605989'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00021697; 0.0277063 0.       '
	sph_factors_uo = uo_gcu_MNR372
	normalization_factors_uo = total

[]
[./mat_gcu_MNR382]
	block = 'MNR382'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00292475 0.099333  '
	ref_diffusivity = '1.62851  0.247396'
	ref_sigma_r = '0.0312335 0.0671872'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00022055; 0.0273906 0.       '
	sph_factors_uo = uo_gcu_MNR382
	normalization_factors_uo = total

[]
[./mat_gcu_MNR389]
	block = 'MNR389'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.0030303 0.101614 '
	ref_diffusivity = '1.64416  0.245096'
	ref_sigma_r = '0.0306583 0.0678994'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00020699; 0.0268282 0.       '
	sph_factors_uo = uo_gcu_MNR389
	normalization_factors_uo = total

[]
[./mat_gcu_E9rifl]
	block = 'E9rifl'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '2.3089   0.267006'
	ref_sigma_r = '0.0383544 0.0116998'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 3.95892e-05; 0.0380189 0.       '
	sph_factors_uo = uo_gcu_E9rifl
	normalization_factors_uo = total

[]
[./mat_gcu_E8graph]
	block = 'E8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.30435  0.334381'
	ref_sigma_r = '0.0206208  0.00760398'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 6.74487e-05; 0.0203914 0.       '
	sph_factors_uo = uo_gcu_E8graph
	normalization_factors_uo = total

[]
[./mat_gcu_MNR394]
	block = 'MNR394'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00330266 0.111101  '
	ref_diffusivity = '1.65059 0.24578'
	ref_sigma_r = '0.0306051 0.0722681'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00019576; 0.0267654 0.       '
	sph_factors_uo = uo_gcu_MNR394
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC77]
	block = 'MNRC77'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00116515 0.0376314 '
	ref_diffusivity = '1.57108  0.230837'
	ref_sigma_r = '0.0340966 0.0380215'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00017541; 0.0315435 0.       '
	sph_factors_uo = uo_gcu_MNRC77
	normalization_factors_uo = total

[]
[./mat_gcu_MNR377]
	block = 'MNR377'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00269816 0.0929525 '
	ref_diffusivity = '1.61449 0.24701'
	ref_sigma_r = '0.0312589 0.0643993'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00024741; 0.0274414 0.       '
	sph_factors_uo = uo_gcu_MNR377
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC76]
	block = 'MNRC76'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00111306 0.0356889 '
	ref_diffusivity = '1.56384  0.231014'
	ref_sigma_r = '0.0344828 0.0371577'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00017887; 0.0319158 0.       '
	sph_factors_uo = uo_gcu_MNRC76
	normalization_factors_uo = total

[]
[./mat_gcu_MNR395]
	block = 'MNR395'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00338356 0.111992  '
	ref_diffusivity = '1.62263 0.24946'
	ref_sigma_r = '0.030827  0.0725428'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00026933; 0.0269218 0.       '
	sph_factors_uo = uo_gcu_MNR395
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC80]
	block = 'MNRC80'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00155153 0.0484131 '
	ref_diffusivity = '1.55271  0.237015'
	ref_sigma_r = '0.0326628 0.0452943'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00021109; 0.0302013 0.       '
	sph_factors_uo = uo_gcu_MNRC80
	normalization_factors_uo = total

[]
[./mat_gcu_MNR387]
	block = 'MNR387'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00298868 0.100539  '
	ref_diffusivity = '1.63112  0.245488'
	ref_sigma_r = '0.0308043 0.0675153'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.        0.0002312; 0.0269889 0.       '
	sph_factors_uo = uo_gcu_MNR387
	normalization_factors_uo = total

[]
[./mat_gcu_D9graph]
	block = 'D9graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.2915   0.329373'
	ref_sigma_r = '0.0245945  0.00771813'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 3.85337e-05; 0.0243364 0.       '
	sph_factors_uo = uo_gcu_D9graph
	normalization_factors_uo = total

[]
[./mat_gcu_D8graph]
	block = 'D8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.27628  0.332336'
	ref_sigma_r = '0.0220961  0.00763871'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 7.05386e-05; 0.0218618 0.       '
	sph_factors_uo = uo_gcu_D8graph
	normalization_factors_uo = total

[]
[./mat_gcu_D7rifl]
	block = 'D7rifl'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '2.35512 0.27998'
	ref_sigma_r = '0.0300548 0.0113811'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00010185; 0.0297716 0.       '
	sph_factors_uo = uo_gcu_D7rifl
	normalization_factors_uo = total

[]
[./mat_gcu_MNR392]
	block = 'MNR392'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00321481 0.108499  '
	ref_diffusivity = '1.63184  0.246941'
	ref_sigma_r = '0.0308217 0.0713401'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00023614; 0.0269648 0.       '
	sph_factors_uo = uo_gcu_MNR392
	normalization_factors_uo = total

[]
[./mat_gcu_MNR381]
	block = 'MNR381'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.0027074 0.0932788'
	ref_diffusivity = '1.61994  0.247213'
	ref_sigma_r = '0.031331  0.0647948'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00022215; 0.0275154 0.       '
	sph_factors_uo = uo_gcu_MNR381
	normalization_factors_uo = total

[]
[./mat_gcu_MNR391]
	block = 'MNR391'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00309557 0.104595  '
	ref_diffusivity = '1.6189   0.249017'
	ref_sigma_r = '0.031115  0.0697663'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00024659; 0.0272356 0.       '
	sph_factors_uo = uo_gcu_MNR391
	normalization_factors_uo = total

[]
[./mat_gcu_MNR388]
	block = 'MNR388'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.0030487 0.102334 '
	ref_diffusivity = '1.61348  0.248849'
	ref_sigma_r = '0.0312072 0.0685713'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00026877; 0.0273265 0.       '
	sph_factors_uo = uo_gcu_MNR388
	normalization_factors_uo = total

[]
[./mat_gcu_MNR378]
	block = 'MNR378'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00268864 0.0929381 '
	ref_diffusivity = '1.61016 0.24797'
	ref_sigma_r = '0.0317086 0.0645231'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00023557; 0.0278489 0.       '
	sph_factors_uo = uo_gcu_MNR378
	normalization_factors_uo = total

[]
[./mat_gcu_MNR390]
	block = 'MNR390'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00311596 0.103667  '
	ref_diffusivity = '1.63078  0.245602'
	ref_sigma_r = '0.0309007 0.0690042'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00022943; 0.0270535 0.       '
	sph_factors_uo = uo_gcu_MNR390
	normalization_factors_uo = total

[]
[./mat_gcu_C9rifl]
	block = 'C9rifl'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '2.26404 0.26634'
	ref_sigma_r = '0.0389308 0.0116117'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 3.78101e-05; 0.0385748 0.       '
	sph_factors_uo = uo_gcu_C9rifl
	normalization_factors_uo = total

[]
[./mat_gcu_C8graph]
	block = 'C8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.29464  0.334567'
	ref_sigma_r = '0.0207637  0.00766838'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 7.61467e-05; 0.0205537 0.       '
	sph_factors_uo = uo_gcu_C8graph
	normalization_factors_uo = total

[]
[./mat_gcu_MNR379]
	block = 'MNR379'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00253105 0.0875542 '
	ref_diffusivity = '1.6147   0.244743'
	ref_sigma_r = '0.0316024 0.0619064'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00020338; 0.02779 0.     '
	sph_factors_uo = uo_gcu_MNR379
	normalization_factors_uo = total

[]
[./mat_gcu_MNR393]
	block = 'MNR393'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.0032834 0.110581 '
	ref_diffusivity = '1.6387   0.244626'
	ref_sigma_r = '0.0306282 0.0723102'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00022307; 0.0267643 0.       '
	sph_factors_uo = uo_gcu_MNR393
	normalization_factors_uo = total

[]
[./mat_gcu_010400]
	block = 'u10400'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.42796  0.171647'
	ref_sigma_r = '0.0513542 0.0181334'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00013833; 0.0508785 0.       '
	sph_factors_uo = uo_gcu_010400
	normalization_factors_uo = total

[]
[./mat_gcu_MNR384]
	block = 'MNR384'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00302131 0.103349  '
	ref_diffusivity = '1.62709  0.245535'
	ref_sigma_r = '0.0310771 0.0693787'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00023227; 0.027227 0.      '
	sph_factors_uo = uo_gcu_MNR384
	normalization_factors_uo = total

[]
[./mat_gcu_MNR383]
	block = 'MNR383'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00270963 0.0927885 '
	ref_diffusivity = '1.60881  0.247293'
	ref_sigma_r = '0.0314388 0.0644742'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00024577; 0.0275924 0.       '
	sph_factors_uo = uo_gcu_MNR383
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC74]
	block = 'MNRC74'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00094104 0.0302541 '
	ref_diffusivity = '1.55586  0.230317'
	ref_sigma_r = '0.0350574 0.0346883'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00016757; 0.0324859 0.       '
	sph_factors_uo = uo_gcu_MNRC74
	normalization_factors_uo = total

[]
[./mat_gcu_MNR361]
	block = 'MNR361'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00204243 0.0713738 '
	ref_diffusivity = '1.6127 0.2418'
	ref_sigma_r = '0.0319698 0.0547596'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00018796; 0.0282109 0.       '
	sph_factors_uo = uo_gcu_MNR361
	normalization_factors_uo = total

[]
[./mat_gcu_B9plug]
	block = 'B9plug'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.37473  0.150505'
	ref_sigma_r = '0.070093 0.019108'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 5.68614e-05; 0.0694926 0.       '
	sph_factors_uo = uo_gcu_B9plug
	normalization_factors_uo = total

[]
[./mat_gcu_B8graph]
	block = 'B8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.30245  0.334515'
	ref_sigma_r = '0.0204504  0.00765425'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 7.53379e-05; 0.0202329 0.       '
	sph_factors_uo = uo_gcu_B8graph
	normalization_factors_uo = total

[]
[./mat_gcu_MNR398]
	block = 'MNR398'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00336055 0.112904  '
	ref_diffusivity = '1.63871  0.246703'
	ref_sigma_r = '0.0305151 0.0726654'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00022424; 0.0266748 0.       '
	sph_factors_uo = uo_gcu_MNR398
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC79]
	block = 'MNRC79'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00153785 0.049045  '
	ref_diffusivity = '1.58839  0.232243'
	ref_sigma_r = '0.0331764 0.0431941'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00018782; 0.0306275 0.       '
	sph_factors_uo = uo_gcu_MNRC79
	normalization_factors_uo = total

[]
[./mat_gcu_MNR385]
	block = 'MNR385'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00301194 0.103103  '
	ref_diffusivity = '1.63809 0.24791'
	ref_sigma_r = '0.0306751 0.0690572'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00021972; 0.0268706 0.       '
	sph_factors_uo = uo_gcu_MNR385
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC78]
	block = 'MNRC78'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00122337 0.0394726 '
	ref_diffusivity = '1.57486  0.231046'
	ref_sigma_r = '0.0340823 0.0389604'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00017552; 0.0315276 0.       '
	sph_factors_uo = uo_gcu_MNRC78
	normalization_factors_uo = total

[]
[./mat_gcu_MNR358]
	block = 'MNR358'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00216338 0.0754879 '
	ref_diffusivity = '1.59718  0.245002'
	ref_sigma_r = '0.0320721 0.0566621'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00022261; 0.0282727 0.       '
	sph_factors_uo = uo_gcu_MNR358
	normalization_factors_uo = total

[]
[./mat_gcu_MNR373]
	block = 'MNR373'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00240555 0.0835572 '
	ref_diffusivity = '1.58964  0.245473'
	ref_sigma_r = '0.0322694 0.0603816'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00021151; 0.0284124 0.       '
	sph_factors_uo = uo_gcu_MNR373
	normalization_factors_uo = total

[]
[./mat_gcu_MNR365]
	block = 'MNR365'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00228565 0.0783482 '
	ref_diffusivity = '1.61108  0.242635'
	ref_sigma_r = '0.0318024 0.0576946'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00019486; 0.0279818 0.       '
	sph_factors_uo = uo_gcu_MNR365
	normalization_factors_uo = total

[]
[./mat_gcu_A9plug]
	block = 'A9plug'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.42506  0.149964'
	ref_sigma_r = '0.0673783 0.0191785'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 5.41903e-05; 0.0667774 0.       '
	sph_factors_uo = uo_gcu_A9plug
	normalization_factors_uo = total

[]
[./mat_gcu_A8graph]
	block = 'A8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.29062  0.331189'
	ref_sigma_r = '0.0224174  0.00768254'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 5.81729e-05; 0.0221914 0.       '
	sph_factors_uo = uo_gcu_A8graph
	normalization_factors_uo = total

[]
[./mat_gcu_A7rifl]
	block = 'A7rifl'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '2.37326  0.276792'
	ref_sigma_r = '0.0306457 0.0114329'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 8.00789e-05; 0.0303542 0.       '
	sph_factors_uo = uo_gcu_A7rifl
	normalization_factors_uo = total

[]
[./mat_gcu_MNR397]
	block = 'MNR397'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00337326 0.113344  '
	ref_diffusivity = '1.64821  0.246697'
	ref_sigma_r = '0.0304791 0.0730066'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00020809; 0.0266282 0.       '
	sph_factors_uo = uo_gcu_MNR397
	normalization_factors_uo = total

[]
[./mat_gcu_MNR376]
	block = 'MNR376'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00246235 0.0855529 '
	ref_diffusivity = '1.6239   0.245615'
	ref_sigma_r = '0.0313297 0.0609746'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.        0.0002044; 0.0275199 0.       '
	sph_factors_uo = uo_gcu_MNR376
	normalization_factors_uo = total

[]
[./mat_gcu_MNR366]
	block = 'MNR366'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00205463 0.0722142 '
	ref_diffusivity = '1.61164  0.244008'
	ref_sigma_r = '0.0322671 0.0552458'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.        0.0001775; 0.0284613 0.       '
	sph_factors_uo = uo_gcu_MNR366
	normalization_factors_uo = total

[]
[./mat_gcu_MNR362]
	block = 'MNR362'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00196417 0.0676182 '
	ref_diffusivity = '1.59093 0.24176'
	ref_sigma_r = '0.0327339 0.0531544'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00017665; 0.0289023 0.       '
	sph_factors_uo = uo_gcu_MNR362
	normalization_factors_uo = total

[]
[./mat_gcu_010500]
	block = 'u10500'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '0.89715  0.303386'
	ref_sigma_r = '0.0177257  0.00604182'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.        0.0001271; 0.0165887 0.       '
	sph_factors_uo = uo_gcu_010500
	normalization_factors_uo = total

[]
[./mat_gcu_MNR369]
	block = 'MNR369'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00227029 0.0783991 '
	ref_diffusivity = '1.61429 0.23938'
	ref_sigma_r = '0.0318658 0.0577255'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00016372; 0.0280884 0.       '
	sph_factors_uo = uo_gcu_MNR369
	normalization_factors_uo = total

[]
[]



[UserObjects]
[./uo_gcu_F9plug]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = ' 75.67533003 353.95388704'
	block  = F9plug 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_F8graph]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '350.53289568 831.77767325'
	block  = F8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_F7rifl]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = ' 843.18794259 1132.28735549'
	block  = F7rifl 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR396]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1795.61397068  881.87686651'
	block  = MNR396 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR375]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2267.86463715 1137.05698864'
	block  = MNR375 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR374]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2417.9627699  1339.08162929'
	block  = MNR374 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR372]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2444.82163597 1207.21675365'
	block  = MNR372 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR382]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2089.80593096  990.5280079 '
	block  = MNR382 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR389]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1394.48421393  685.10433085'
	block  = MNR389 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_E9rifl]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '144.49576078 555.34979469'
	block  = E9rifl 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_E8graph]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = ' 594.88969258 1021.40050792'
	block  = E8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR394]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1682.53130633  890.60884722'
	block  = MNR394 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC77]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2371.42513066 1593.57413406'
	block  = MNRC77 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR377]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3413.88724445 1467.88071923'
	block  = MNR377 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC76]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3375.8023601  2273.29719422'
	block  = MNRC76 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR395]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3849.49854264 1468.80197454'
	block  = MNR395 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC80]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2830.72313747 1636.83894259'
	block  = MNRC80 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR387]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2028.22428753  888.57068857'
	block  = MNR387 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_D9graph]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '183.85881564 667.60997749'
	block  = D9graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_D8graph]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = ' 696.52599717 1294.65812853'
	block  = D8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_D7rifl]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1614.74591067 1719.48029239'
	block  = D7rifl 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR392]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3115.91338867 1360.90303335'
	block  = MNR392 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR381]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3891.64834731 1846.40268079'
	block  = MNR381 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR391]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '4501.1964465  1856.74353418'
	block  = MNR391 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR388]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '4412.94588655 1732.8375446 '
	block  = MNR388 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR378]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3428.83627387 1550.7025211 '
	block  = MNR378 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR390]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2244.15893358  999.86022919'
	block  = MNR390 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_C9rifl]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '177.12852326 648.05467154'
	block  = C9rifl 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_C8graph]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = ' 751.34733618 1180.88024883'
	block  = C8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR379]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2061.35148868 1065.33773784'
	block  = MNR379 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR393]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3076.7457919  1386.40945864'
	block  = MNR393 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_010400]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2727.5235481  3624.76923252'
	block  = u10400 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR384]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '4174.10332503 1889.80425299'
	block  = MNR384 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR383]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '4048.39471423 1729.21140773'
	block  = MNR383 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC74]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2762.98712869 2020.18942166'
	block  = MNRC74 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR361]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1914.36852853 1060.75045626'
	block  = MNR361 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_B9plug]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '121.81122597 514.10984834'
	block  = B9plug 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_B8graph]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = ' 648.6568116  1018.87227944'
	block  = B8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR398]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1816.4875265   825.96521708'
	block  = MNR398 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC79]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2396.5364609  1486.02659954'
	block  = MNRC79 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR385]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3082.21633888 1447.29398723'
	block  = MNR385 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC78]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2952.11989353 2037.55081033'
	block  = MNRC78 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR358]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3097.14637334 1512.35740587'
	block  = MNR358 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR373]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2504.00991509 1302.58282366'
	block  = MNR373 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR365]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1550.53346601  844.79871476'
	block  = MNR365 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_A9plug]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = ' 76.50237036 348.16232532'
	block  = A9plug 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_A8graph]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '374.57291046 882.39922776'
	block  = A8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_A7rifl]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = ' 883.94921607 1186.1057609 '
	block  = A7rifl 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR397]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1796.76696443  875.89915423'
	block  = MNR397 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR376]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2127.6438809  1074.25966811'
	block  = MNR376 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR366]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2076.43348279 1249.66098013'
	block  = MNR366 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR362]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1910.64551739 1205.24697684'
	block  = MNR362 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_010500]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1305.56503157 1423.18369112'
	block  = u10500 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR369]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '950.64430133 639.48034894'
	block  = MNR369 
	execute_on = 'LINEAR' 
[]
[./total]
	type = NormalizationFactorsUserObject
	SPH_user_objects = 'uo_gcu_F9plug uo_gcu_F8graph uo_gcu_F7rifl uo_gcu_MNR396 uo_gcu_MNR375 uo_gcu_MNR374 uo_gcu_MNR372 uo_gcu_MNR382 uo_gcu_MNR389 uo_gcu_E9rifl uo_gcu_E8graph uo_gcu_MNR394 uo_gcu_MNRC77 uo_gcu_MNR377 uo_gcu_MNRC76 uo_gcu_MNR395 uo_gcu_MNRC80 uo_gcu_MNR387 uo_gcu_D9graph uo_gcu_D8graph uo_gcu_D7rifl uo_gcu_MNR392 uo_gcu_MNR381 uo_gcu_MNR391 uo_gcu_MNR388 uo_gcu_MNR378 uo_gcu_MNR390 uo_gcu_C9rifl uo_gcu_C8graph uo_gcu_MNR379 uo_gcu_MNR393 uo_gcu_010400 uo_gcu_MNR384 uo_gcu_MNR383 uo_gcu_MNRC74 uo_gcu_MNR361 uo_gcu_B9plug uo_gcu_B8graph uo_gcu_MNR398 uo_gcu_MNRC79 uo_gcu_MNR385 uo_gcu_MNRC78 uo_gcu_MNR358 uo_gcu_MNR373 uo_gcu_MNR365 uo_gcu_A9plug uo_gcu_A8graph uo_gcu_A7rifl uo_gcu_MNR397 uo_gcu_MNR376 uo_gcu_MNR366 uo_gcu_MNR362 uo_gcu_010500 uo_gcu_MNR369 '
	ref_integrals = '109427.44886111  67863.7669449 '
	execute_on = 'LINEAR' 
[]
[./output]
	type = OutputUserObject
	SPH_uo_names = 'uo_gcu_A9plug uo_gcu_B9plug uo_gcu_C9rifl uo_gcu_D9graph uo_gcu_E9rifl uo_gcu_F9plug uo_gcu_A8graph uo_gcu_B8graph uo_gcu_C8graph uo_gcu_D8graph uo_gcu_E8graph uo_gcu_F8graph uo_gcu_A7rifl uo_gcu_MNR398 uo_gcu_MNR379 uo_gcu_D7rifl uo_gcu_MNR394 uo_gcu_F7rifl uo_gcu_MNR397 uo_gcu_MNRC79 uo_gcu_MNR393 uo_gcu_MNR392 uo_gcu_MNRC77 uo_gcu_MNR396 uo_gcu_MNR376 uo_gcu_MNR385 uo_gcu_010400 uo_gcu_MNR381 uo_gcu_MNR377 uo_gcu_MNR375 uo_gcu_MNR366 uo_gcu_MNRC78 uo_gcu_MNR384 uo_gcu_MNR391 uo_gcu_MNRC76 uo_gcu_MNR374 uo_gcu_MNR362 uo_gcu_MNR358 uo_gcu_MNR383 uo_gcu_MNR388 uo_gcu_MNR395 uo_gcu_MNR372 uo_gcu_010500 uo_gcu_MNR373 uo_gcu_MNRC74 uo_gcu_MNR378 uo_gcu_MNRC80 uo_gcu_MNR382 uo_gcu_MNR369 uo_gcu_MNR365 uo_gcu_MNR361 uo_gcu_MNR390 uo_gcu_MNR387 uo_gcu_MNR389 '
	execute_on = 'TIMESTEP_END'
	normalization_uo_name = total
	surface_integrators = 'alb_0 alb_1'
	ref_surface_integrals = '847.42951599 -20.42052615 '
[]
[]

[ICs]
[./IC_gcu_F9plug]
	type = ArrayConstantIC
	variable = flux 
	value = '0.01681227 0.07863551'
	block  = F9plug 
[]
[./IC_gcu_F8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.07787549 0.18479035'
	block  = F8graph 
[]
[./IC_gcu_F7rifl]
	type = ArrayConstantIC
	variable = flux 
	value = '0.18732529 0.25155253'
	block  = F7rifl 
[]
[./IC_gcu_MNR396]
	type = ArrayConstantIC
	variable = flux 
	value = '0.39891926 0.19592055'
	block  = MNR396 
[]
[./IC_gcu_MNR375]
	type = ArrayConstantIC
	variable = flux 
	value = '0.50383596 0.25261217'
	block  = MNR375 
[]
[./IC_gcu_MNR374]
	type = ArrayConstantIC
	variable = flux 
	value = '0.53718224 0.2974946 '
	block  = MNR374 
[]
[./IC_gcu_MNR372]
	type = ArrayConstantIC
	variable = flux 
	value = '0.54314929 0.26819908'
	block  = MNR372 
[]
[./IC_gcu_MNR382]
	type = ArrayConstantIC
	variable = flux 
	value = '0.46427788 0.22005883'
	block  = MNR382 
[]
[./IC_gcu_MNR389]
	type = ArrayConstantIC
	variable = flux 
	value = '0.30980301 0.15220494'
	block  = MNR389 
[]
[./IC_gcu_E9rifl]
	type = ArrayConstantIC
	variable = flux 
	value = '0.03210163 0.12337826'
	block  = E9rifl 
[]
[./IC_gcu_E8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.13216257 0.22691756'
	block  = E8graph 
[]
[./IC_gcu_MNR394]
	type = ArrayConstantIC
	variable = flux 
	value = '0.37379646 0.19786047'
	block  = MNR394 
[]
[./IC_gcu_MNRC77]
	type = ArrayConstantIC
	variable = flux 
	value = '0.52684329 0.35403346'
	block  = MNRC77 
[]
[./IC_gcu_MNR377]
	type = ArrayConstantIC
	variable = flux 
	value = '0.75843996 0.32610901'
	block  = MNR377 
[]
[./IC_gcu_MNRC76]
	type = ArrayConstantIC
	variable = flux 
	value = '0.7499789  0.50504287'
	block  = MNRC76 
[]
[./IC_gcu_MNR395]
	type = ArrayConstantIC
	variable = flux 
	value = '0.85521674 0.32631368'
	block  = MNR395 
[]
[./IC_gcu_MNRC80]
	type = ArrayConstantIC
	variable = flux 
	value = '0.62888238 0.3636453 '
	block  = MNRC80 
[]
[./IC_gcu_MNR387]
	type = ArrayConstantIC
	variable = flux 
	value = '0.45059671 0.19740767'
	block  = MNR387 
[]
[./IC_gcu_D9graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.04084665 0.14831834'
	block  = D9graph 
[]
[./IC_gcu_D8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.15474241 0.28762533'
	block  = D8graph 
[]
[./IC_gcu_D7rifl]
	type = ArrayConstantIC
	variable = flux 
	value = '0.35873704 0.38200517'
	block  = D7rifl 
[]
[./IC_gcu_MNR392]
	type = ArrayConstantIC
	variable = flux 
	value = '0.69224115 0.30234251'
	block  = MNR392 
[]
[./IC_gcu_MNR381]
	type = ArrayConstantIC
	variable = flux 
	value = '0.86458087 0.41020264'
	block  = MNR381 
[]
[./IC_gcu_MNR391]
	type = ArrayConstantIC
	variable = flux 
	value = '1.     0.4125'
	block  = MNR391 
[]
[./IC_gcu_MNR388]
	type = ArrayConstantIC
	variable = flux 
	value = '0.98039398 0.38497265'
	block  = MNR388 
[]
[./IC_gcu_MNR378]
	type = ArrayConstantIC
	variable = flux 
	value = '0.76176108 0.34450896'
	block  = MNR378 
[]
[./IC_gcu_MNR390]
	type = ArrayConstantIC
	variable = flux 
	value = '0.49856943 0.2221321 '
	block  = MNR390 
[]
[./IC_gcu_C9rifl]
	type = ArrayConstantIC
	variable = flux 
	value = '0.03935143 0.14397387'
	block  = C9rifl 
[]
[./IC_gcu_C8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.16692169 0.26234808'
	block  = C8graph 
[]
[./IC_gcu_MNR379]
	type = ArrayConstantIC
	variable = flux 
	value = '0.45795635 0.23667879'
	block  = MNR379 
[]
[./IC_gcu_MNR393]
	type = ArrayConstantIC
	variable = flux 
	value = '0.68353955 0.3080091 '
	block  = MNR393 
[]
[./IC_gcu_010400]
	type = ArrayConstantIC
	variable = flux 
	value = '0.60595523 0.80529017'
	block  = u10400 
[]
[./IC_gcu_MNR384]
	type = ArrayConstantIC
	variable = flux 
	value = '0.92733196 0.41984487'
	block  = MNR384 
[]
[./IC_gcu_MNR383]
	type = ArrayConstantIC
	variable = flux 
	value = '0.89940414 0.38416706'
	block  = MNR383 
[]
[./IC_gcu_MNRC74]
	type = ArrayConstantIC
	variable = flux 
	value = '0.61383394 0.44881165'
	block  = MNRC74 
[]
[./IC_gcu_MNR361]
	type = ArrayConstantIC
	variable = flux 
	value = '0.42530215 0.23565967'
	block  = MNR361 
[]
[./IC_gcu_B9plug]
	type = ArrayConstantIC
	variable = flux 
	value = '0.02706197 0.11421627'
	block  = B9plug 
[]
[./IC_gcu_B8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.14410764 0.22635588'
	block  = B8graph 
[]
[./IC_gcu_MNR398]
	type = ArrayConstantIC
	variable = flux 
	value = '0.4035566  0.18349904'
	block  = MNR398 
[]
[./IC_gcu_MNRC79]
	type = ArrayConstantIC
	variable = flux 
	value = '0.5324221  0.33014036'
	block  = MNRC79 
[]
[./IC_gcu_MNR385]
	type = ArrayConstantIC
	variable = flux 
	value = '0.6847549 0.3215354'
	block  = MNR385 
[]
[./IC_gcu_MNRC78]
	type = ArrayConstantIC
	variable = flux 
	value = '0.65585227 0.45266871'
	block  = MNRC78 
[]
[./IC_gcu_MNR358]
	type = ArrayConstantIC
	variable = flux 
	value = '0.68807181 0.33599009'
	block  = MNR358 
[]
[./IC_gcu_MNR373]
	type = ArrayConstantIC
	variable = flux 
	value = '0.55629874 0.28938591'
	block  = MNR373 
[]
[./IC_gcu_MNR365]
	type = ArrayConstantIC
	variable = flux 
	value = '0.34447141 0.18768315'
	block  = MNR365 
[]
[./IC_gcu_A9plug]
	type = ArrayConstantIC
	variable = flux 
	value = '0.01699601 0.07734884'
	block  = A9plug 
[]
[./IC_gcu_A8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.0832163 0.1960366'
	block  = A8graph 
[]
[./IC_gcu_A7rifl]
	type = ArrayConstantIC
	variable = flux 
	value = '0.19638095 0.263509  '
	block  = A7rifl 
[]
[./IC_gcu_MNR397]
	type = ArrayConstantIC
	variable = flux 
	value = '0.39917542 0.19459252'
	block  = MNR397 
[]
[./IC_gcu_MNR376]
	type = ArrayConstantIC
	variable = flux 
	value = '0.47268408 0.23866092'
	block  = MNR376 
[]
[./IC_gcu_MNR366]
	type = ArrayConstantIC
	variable = flux 
	value = '0.46130701 0.27762862'
	block  = MNR366 
[]
[./IC_gcu_MNR362]
	type = ArrayConstantIC
	variable = flux 
	value = '0.42447503 0.26776147'
	block  = MNR362 
[]
[./IC_gcu_010500]
	type = ArrayConstantIC
	variable = flux 
	value = '0.29004845 0.31617898'
	block  = u10500 
[]
[./IC_gcu_MNR369]
	type = ArrayConstantIC
	variable = flux 
	value = '0.21119814 0.14206897'
	block  = MNR369 
[]
[]


