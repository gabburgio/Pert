[Mesh]
file = mnr_active.msh
[]


[Outputs]
exodus = true
[]


[Executioner]
type = Eigenvalue   
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
	type = L2ArrayAlbedoBC
    gamma_factors = '1 1'
	boundary = 'north south west east bottom top'
	albedo_matrix = '3.21422E-01  7.48311E-06; 2.05244E-01 7.76478E-01'
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
    extra_matrix_tags = 'eigen'
[]
[]

[Materials]
[./mat_gcu_F9plug]
	block = 'F9plug'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.42101  0.149832'
	sigma_r = '0.068183 0.019279'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 5.20157e-05; 0.0676363 0.       
[]
[./mat_gcu_F8graph]
	block = 'F8graph'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.30211  0.331191'
	sigma_r = '0.0223201 0.0076491'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 5.25043e-05; 0.022087 0.      
[]
[./mat_gcu_F7rifl]
	block = 'F7rifl'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '2.37578  0.276728'
	sigma_r = '0.0304196 0.0113667'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 7.77146e-05; 0.0301199 0.       
[]
[./mat_gcu_MNR396]
	block = 'MNR396'
	type = NuclearMaterial
	nu_sigma_f = '0.00336719 0.113107  '
	diffusivity = '1.65196  0.246692'
	sigma_r = '0.0304251 0.0729201'
	chi = '1. 0.'
	sigma_s = '0.        0.0002011; 0.0265777 0.       
[]
[./mat_gcu_MNR375]
	block = 'MNR375'
	type = NuclearMaterial
	nu_sigma_f = '0.0024714 0.0854761'
	diffusivity = '1.62203 0.24533'
	sigma_r = '0.0313998 0.0611207'
	chi = '1. 0.'
	sigma_s = '0.         0.00020937; 0.0276124 0.       
[]
[./mat_gcu_MNR374]
	block = 'MNR374'
	type = NuclearMaterial
	nu_sigma_f = '0.00228731 0.0796733 '
	diffusivity = '1.6174   0.244951'
	sigma_r = '0.0318706 0.058638 '
	chi = '1. 0.'
	sigma_s = '0.         0.00019404; 0.0280582 0.       
[]
[./mat_gcu_MNR372]
	block = 'MNR372'
	type = NuclearMaterial
	nu_sigma_f = '0.00244956 0.0845605 '
	diffusivity = '1.61764  0.245781'
	sigma_r = '0.0314984 0.0605989'
	chi = '1. 0.'
	sigma_s = '0.         0.00021697; 0.0277063 0.       
[]
[./mat_gcu_MNR382]
	block = 'MNR382'
	type = NuclearMaterial
	nu_sigma_f = '0.00292475 0.099333  '
	diffusivity = '1.62851  0.247396'
	sigma_r = '0.0312335 0.0671872'
	chi = '1. 0.'
	sigma_s = '0.         0.00022055; 0.0273906 0.       
[]
[./mat_gcu_MNR389]
	block = 'MNR389'
	type = NuclearMaterial
	nu_sigma_f = '0.0030303 0.101614 '
	diffusivity = '1.64416  0.245096'
	sigma_r = '0.0306583 0.0678994'
	chi = '1. 0.'
	sigma_s = '0.         0.00020699; 0.0268282 0.       
[]
[./mat_gcu_E9rifl]
	block = 'E9rifl'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '2.3089   0.267006'
	sigma_r = '0.0383544 0.0116998'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 3.95892e-05; 0.0380189 0.       
[]
[./mat_gcu_E8graph]
	block = 'E8graph'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.30435  0.334381'
	sigma_r = '0.0206208  0.00760398'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 6.74487e-05; 0.0203914 0.       
[]
[./mat_gcu_MNR394]
	block = 'MNR394'
	type = NuclearMaterial
	nu_sigma_f = '0.00330266 0.111101  '
	diffusivity = '1.65059 0.24578'
	sigma_r = '0.0306051 0.0722681'
	chi = '1. 0.'
	sigma_s = '0.         0.00019576; 0.0267654 0.       
[]
[./mat_gcu_MNRC77]
	block = 'MNRC77'
	type = NuclearMaterial
	nu_sigma_f = '0.00116515 0.0376314 '
	diffusivity = '1.57108  0.230837'
	sigma_r = '0.0340966 0.0380215'
	chi = '1. 0.'
	sigma_s = '0.         0.00017541; 0.0315435 0.       
[]
[./mat_gcu_MNR377]
	block = 'MNR377'
	type = NuclearMaterial
	nu_sigma_f = '0.00269816 0.0929525 '
	diffusivity = '1.61449 0.24701'
	sigma_r = '0.0312589 0.0643993'
	chi = '1. 0.'
	sigma_s = '0.         0.00024741; 0.0274414 0.       
[]
[./mat_gcu_MNRC76]
	block = 'MNRC76'
	type = NuclearMaterial
	nu_sigma_f = '0.00111306 0.0356889 '
	diffusivity = '1.56384  0.231014'
	sigma_r = '0.0344828 0.0371577'
	chi = '1. 0.'
	sigma_s = '0.         0.00017887; 0.0319158 0.       
[]
[./mat_gcu_MNR395]
	block = 'MNR395'
	type = NuclearMaterial
	nu_sigma_f = '0.00338356 0.111992  '
	diffusivity = '1.62263 0.24946'
	sigma_r = '0.030827  0.0725428'
	chi = '1. 0.'
	sigma_s = '0.         0.00026933; 0.0269218 0.       
[]
[./mat_gcu_MNRC80]
	block = 'MNRC80'
	type = NuclearMaterial
	nu_sigma_f = '0.00155153 0.0484131 '
	diffusivity = '1.55271  0.237015'
	sigma_r = '0.0326628 0.0452943'
	chi = '1. 0.'
	sigma_s = '0.         0.00021109; 0.0302013 0.       
[]
[./mat_gcu_MNR387]
	block = 'MNR387'
	type = NuclearMaterial
	nu_sigma_f = '0.00298868 0.100539  '
	diffusivity = '1.63112  0.245488'
	sigma_r = '0.0308043 0.0675153'
	chi = '1. 0.'
	sigma_s = '0.        0.0002312; 0.0269889 0.       
[]
[./mat_gcu_D9graph]
	block = 'D9graph'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.2915   0.329373'
	sigma_r = '0.0245945  0.00771813'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 3.85337e-05; 0.0243364 0.       
[]
[./mat_gcu_D8graph]
	block = 'D8graph'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.27628  0.332336'
	sigma_r = '0.0220961  0.00763871'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 7.05386e-05; 0.0218618 0.       
[]
[./mat_gcu_D7rifl]
	block = 'D7rifl'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '2.35512 0.27998'
	sigma_r = '0.0300548 0.0113811'
	chi = '0. 0.'
	sigma_s = '0.         0.00010185; 0.0297716 0.       
[]
[./mat_gcu_MNR392]
	block = 'MNR392'
	type = NuclearMaterial
	nu_sigma_f = '0.00321481 0.108499  '
	diffusivity = '1.63184  0.246941'
	sigma_r = '0.0308217 0.0713401'
	chi = '1. 0.'
	sigma_s = '0.         0.00023614; 0.0269648 0.       
[]
[./mat_gcu_MNR381]
	block = 'MNR381'
	type = NuclearMaterial
	nu_sigma_f = '0.0027074 0.0932788'
	diffusivity = '1.61994  0.247213'
	sigma_r = '0.031331  0.0647948'
	chi = '1. 0.'
	sigma_s = '0.         0.00022215; 0.0275154 0.       
[]
[./mat_gcu_MNR391]
	block = 'MNR391'
	type = NuclearMaterial
	nu_sigma_f = '0.00309557 0.104595  '
	diffusivity = '1.6189   0.249017'
	sigma_r = '0.031115  0.0697663'
	chi = '1. 0.'
	sigma_s = '0.         0.00024659; 0.0272356 0.       
[]
[./mat_gcu_MNR388]
	block = 'MNR388'
	type = NuclearMaterial
	nu_sigma_f = '0.0030487 0.102334 '
	diffusivity = '1.61348  0.248849'
	sigma_r = '0.0312072 0.0685713'
	chi = '1. 0.'
	sigma_s = '0.         0.00026877; 0.0273265 0.       
[]
[./mat_gcu_MNR378]
	block = 'MNR378'
	type = NuclearMaterial
	nu_sigma_f = '0.00268864 0.0929381 '
	diffusivity = '1.61016 0.24797'
	sigma_r = '0.0317086 0.0645231'
	chi = '1. 0.'
	sigma_s = '0.         0.00023557; 0.0278489 0.       
[]
[./mat_gcu_MNR390]
	block = 'MNR390'
	type = NuclearMaterial
	nu_sigma_f = '0.00311596 0.103667  '
	diffusivity = '1.63078  0.245602'
	sigma_r = '0.0309007 0.0690042'
	chi = '1. 0.'
	sigma_s = '0.         0.00022943; 0.0270535 0.       
[]
[./mat_gcu_C9rifl]
	block = 'C9rifl'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '2.26404 0.26634'
	sigma_r = '0.0389308 0.0116117'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 3.78101e-05; 0.0385748 0.       
[]
[./mat_gcu_C8graph]
	block = 'C8graph'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.29464  0.334567'
	sigma_r = '0.0207637  0.00766838'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 7.61467e-05; 0.0205537 0.       
[]
[./mat_gcu_MNR379]
	block = 'MNR379'
	type = NuclearMaterial
	nu_sigma_f = '0.00253105 0.0875542 '
	diffusivity = '1.6147   0.244743'
	sigma_r = '0.0316024 0.0619064'
	chi = '1. 0.'
	sigma_s = '0.         0.00020338; 0.02779 0.     
[]
[./mat_gcu_MNR393]
	block = 'MNR393'
	type = NuclearMaterial
	nu_sigma_f = '0.0032834 0.110581 '
	diffusivity = '1.6387   0.244626'
	sigma_r = '0.0306282 0.0723102'
	chi = '1. 0.'
	sigma_s = '0.         0.00022307; 0.0267643 0.       
[]
[./mat_gcu_010400]
	block = '010400'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.42796  0.171647'
	sigma_r = '0.0513542 0.0181334'
	chi = '0. 0.'
	sigma_s = '0.         0.00013833; 0.0508785 0.       
[]
[./mat_gcu_MNR384]
	block = 'MNR384'
	type = NuclearMaterial
	nu_sigma_f = '0.00302131 0.103349  '
	diffusivity = '1.62709  0.245535'
	sigma_r = '0.0310771 0.0693787'
	chi = '1. 0.'
	sigma_s = '0.         0.00023227; 0.027227 0.      
[]
[./mat_gcu_MNR383]
	block = 'MNR383'
	type = NuclearMaterial
	nu_sigma_f = '0.00270963 0.0927885 '
	diffusivity = '1.60881  0.247293'
	sigma_r = '0.0314388 0.0644742'
	chi = '1. 0.'
	sigma_s = '0.         0.00024577; 0.0275924 0.       
[]
[./mat_gcu_MNRC74]
	block = 'MNRC74'
	type = NuclearMaterial
	nu_sigma_f = '0.00094104 0.0302541 '
	diffusivity = '1.55586  0.230317'
	sigma_r = '0.0350574 0.0346883'
	chi = '1. 0.'
	sigma_s = '0.         0.00016757; 0.0324859 0.       
[]
[./mat_gcu_MNR361]
	block = 'MNR361'
	type = NuclearMaterial
	nu_sigma_f = '0.00204243 0.0713738 '
	diffusivity = '1.6127 0.2418'
	sigma_r = '0.0319698 0.0547596'
	chi = '1. 0.'
	sigma_s = '0.         0.00018796; 0.0282109 0.       
[]
[./mat_gcu_B9plug]
	block = 'B9plug'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.37473  0.150505'
	sigma_r = '0.070093 0.019108'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 5.68614e-05; 0.0694926 0.       
[]
[./mat_gcu_B8graph]
	block = 'B8graph'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.30245  0.334515'
	sigma_r = '0.0204504  0.00765425'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 7.53379e-05; 0.0202329 0.       
[]
[./mat_gcu_MNR398]
	block = 'MNR398'
	type = NuclearMaterial
	nu_sigma_f = '0.00336055 0.112904  '
	diffusivity = '1.63871  0.246703'
	sigma_r = '0.0305151 0.0726654'
	chi = '1. 0.'
	sigma_s = '0.         0.00022424; 0.0266748 0.       
[]
[./mat_gcu_MNRC79]
	block = 'MNRC79'
	type = NuclearMaterial
	nu_sigma_f = '0.00153785 0.049045  '
	diffusivity = '1.58839  0.232243'
	sigma_r = '0.0331764 0.0431941'
	chi = '1. 0.'
	sigma_s = '0.         0.00018782; 0.0306275 0.       
[]
[./mat_gcu_MNR385]
	block = 'MNR385'
	type = NuclearMaterial
	nu_sigma_f = '0.00301194 0.103103  '
	diffusivity = '1.63809 0.24791'
	sigma_r = '0.0306751 0.0690572'
	chi = '1. 0.'
	sigma_s = '0.         0.00021972; 0.0268706 0.       
[]
[./mat_gcu_MNRC78]
	block = 'MNRC78'
	type = NuclearMaterial
	nu_sigma_f = '0.00122337 0.0394726 '
	diffusivity = '1.57486  0.231046'
	sigma_r = '0.0340823 0.0389604'
	chi = '1. 0.'
	sigma_s = '0.         0.00017552; 0.0315276 0.       
[]
[./mat_gcu_MNR358]
	block = 'MNR358'
	type = NuclearMaterial
	nu_sigma_f = '0.00216338 0.0754879 '
	diffusivity = '1.59718  0.245002'
	sigma_r = '0.0320721 0.0566621'
	chi = '1. 0.'
	sigma_s = '0.         0.00022261; 0.0282727 0.       
[]
[./mat_gcu_MNR373]
	block = 'MNR373'
	type = NuclearMaterial
	nu_sigma_f = '0.00240555 0.0835572 '
	diffusivity = '1.58964  0.245473'
	sigma_r = '0.0322694 0.0603816'
	chi = '1. 0.'
	sigma_s = '0.         0.00021151; 0.0284124 0.       
[]
[./mat_gcu_MNR365]
	block = 'MNR365'
	type = NuclearMaterial
	nu_sigma_f = '0.00228565 0.0783482 '
	diffusivity = '1.61108  0.242635'
	sigma_r = '0.0318024 0.0576946'
	chi = '1. 0.'
	sigma_s = '0.         0.00019486; 0.0279818 0.       
[]
[./mat_gcu_A9plug]
	block = 'A9plug'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.42506  0.149964'
	sigma_r = '0.0673783 0.0191785'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 5.41903e-05; 0.0667774 0.       
[]
[./mat_gcu_A8graph]
	block = 'A8graph'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.29062  0.331189'
	sigma_r = '0.0224174  0.00768254'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 5.81729e-05; 0.0221914 0.       
[]
[./mat_gcu_A7rifl]
	block = 'A7rifl'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '2.37326  0.276792'
	sigma_r = '0.0306457 0.0114329'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 8.00789e-05; 0.0303542 0.       
[]
[./mat_gcu_MNR397]
	block = 'MNR397'
	type = NuclearMaterial
	nu_sigma_f = '0.00337326 0.113344  '
	diffusivity = '1.64821  0.246697'
	sigma_r = '0.0304791 0.0730066'
	chi = '1. 0.'
	sigma_s = '0.         0.00020809; 0.0266282 0.       
[]
[./mat_gcu_MNR376]
	block = 'MNR376'
	type = NuclearMaterial
	nu_sigma_f = '0.00246235 0.0855529 '
	diffusivity = '1.6239   0.245615'
	sigma_r = '0.0313297 0.0609746'
	chi = '1. 0.'
	sigma_s = '0.        0.0002044; 0.0275199 0.       
[]
[./mat_gcu_MNR366]
	block = 'MNR366'
	type = NuclearMaterial
	nu_sigma_f = '0.00205463 0.0722142 '
	diffusivity = '1.61164  0.244008'
	sigma_r = '0.0322671 0.0552458'
	chi = '1. 0.'
	sigma_s = '0.        0.0001775; 0.0284613 0.       
[]
[./mat_gcu_MNR362]
	block = 'MNR362'
	type = NuclearMaterial
	nu_sigma_f = '0.00196417 0.0676182 '
	diffusivity = '1.59093 0.24176'
	sigma_r = '0.0327339 0.0531544'
	chi = '1. 0.'
	sigma_s = '0.         0.00017665; 0.0289023 0.       
[]
[./mat_gcu_010500]
	block = '010500'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '0.89715  0.303386'
	sigma_r = '0.0177257  0.00604182'
	chi = '0. 0.'
	sigma_s = '0.        0.0001271; 0.0165887 0.       
[]
[./mat_gcu_MNR369]
	block = 'MNR369'
	type = NuclearMaterial
	nu_sigma_f = '0.00227029 0.0783991 '
	diffusivity = '1.61429 0.23938'
	sigma_r = '0.0318658 0.0577255'
	chi = '1. 0.'
	sigma_s = '0.         0.00016372; 0.0280884 0.       
[]
[]
