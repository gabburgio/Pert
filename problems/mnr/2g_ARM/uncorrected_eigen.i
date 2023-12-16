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
	type = L2ArrayAlbedoBC
    gamma_factors = '1 1'
	boundary = 'north south west east bottom top'
	albedo_matrix = '3.22201E-01 8.67124E-06; 2.03017E-01 7.72685E-01'
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
	diffusivity = '1.4222   0.149933'
	sigma_r = '0.0682088 0.0192188'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 4.73019e-05; 0.0676358 0.       '
[]
[./mat_gcu_F8graph]
	block = 'F8graph'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.29986  0.331376'
	sigma_r = '0.0221386  0.00764132'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 5.51137e-05; 0.021906 0.      '
[]
[./mat_gcu_F7rifl]
	block = 'F7rifl'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '2.28812  0.266106'
	sigma_r = '0.0315503 0.011811 '
	chi = '0. 0.'
	sigma_s = '0.00000e+00 7.91071e-05; 0.031249 0.      '
[]
[./mat_gcu_MNR396]
	block = 'MNR396'
	type = NuclearMaterial
	nu_sigma_f = '0.00335329 0.112358  '
	diffusivity = '1.65173  0.246761'
	sigma_r = '0.0302408 0.0725353'
	chi = '1. 0.'
	sigma_s = '0.        0.0002134; 0.0264007 0.       '
[]
[./mat_gcu_MNR375]
	block = 'MNR375'
	type = NuclearMaterial
	nu_sigma_f = '0.00244972 0.0850705 '
	diffusivity = '1.62506  0.246397'
	sigma_r = '0.0311873 0.0608388'
	chi = '1. 0.'
	sigma_s = '0.         0.00021061; 0.0274053 0.       '
[]
[./mat_gcu_MNR374]
	block = 'MNR374'
	type = NuclearMaterial
	nu_sigma_f = '0.00226137 0.0787432 '
	diffusivity = '1.61647  0.245161'
	sigma_r = '0.0317485 0.0581329'
	chi = '1. 0.'
	sigma_s = '0.         0.00020639; 0.0279379 0.       '
[]
[./mat_gcu_MNR372]
	block = 'MNR372'
	type = NuclearMaterial
	nu_sigma_f = '0.00243157 0.0846448 '
	diffusivity = '1.62057 0.24621'
	sigma_r = '0.0311857 0.060627 '
	chi = '1. 0.'
	sigma_s = '0.        0.0002175; 0.0274028 0.       '
[]
[./mat_gcu_MNR382]
	block = 'MNR382'
	type = NuclearMaterial
	nu_sigma_f = '0.00291995 0.0994481 '
	diffusivity = '1.63176  0.248009'
	sigma_r = '0.0309053 0.0672019'
	chi = '1. 0.'
	sigma_s = '0.         0.00022376; 0.0270788 0.       '
[]
[./mat_gcu_MNR389]
	block = 'MNR389'
	type = NuclearMaterial
	nu_sigma_f = '0.00301658 0.101766  '
	diffusivity = '1.64662 0.24567'
	sigma_r = '0.0302828 0.0680114'
	chi = '1. 0.'
	sigma_s = '0.         0.00020944; 0.0264796 0.       '
[]
[./mat_gcu_E9rifl]
	block = 'E9rifl'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '2.23703  0.260562'
	sigma_r = '0.0394705 0.011922 '
	chi = '0. 0.'
	sigma_s = '0.00000e+00 3.77371e-05; 0.0391172 0.       '
[]
[./mat_gcu_E8graph]
	block = 'E8graph'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.30734  0.334793'
	sigma_r = '0.0204347  0.00760198'
	chi = '0. 0.'
	sigma_s = '0.0000e+00 7.0198e-05; 0.020222 0.      '
[]
[./mat_gcu_MNR394]
	block = 'MNR394'
	type = NuclearMaterial
	nu_sigma_f = '0.00328531 0.111325  '
	diffusivity = '1.65141  0.247048'
	sigma_r = '0.0303268 0.0722926'
	chi = '1. 0.'
	sigma_s = '0.         0.00019803; 0.026531 0.      '
[]
[./mat_gcu_MNRC77]
	block = 'MNRC77'
	type = NuclearMaterial
	nu_sigma_f = '0.00113833 0.0387775 '
	diffusivity = '1.5538   0.230778'
	sigma_r = '0.0354015 0.0503698'
	chi = '1. 0.'
	sigma_s = '0.         0.00020162; 0.0291267 0.       '
[]
[./mat_gcu_MNR377]
	block = 'MNR377'
	type = NuclearMaterial
	nu_sigma_f = '0.00268942 0.0927015 '
	diffusivity = '1.61369  0.248695'
	sigma_r = '0.0311803 0.0642824'
	chi = '1. 0.'
	sigma_s = '0.         0.00024793; 0.0273691 0.       '
[]
[./mat_gcu_MNRC76]
	block = 'MNRC76'
	type = NuclearMaterial
	nu_sigma_f = '0.00109811 0.0368386 '
	diffusivity = '1.54509  0.230946'
	sigma_r = '0.0357852 0.0499701'
	chi = '1. 0.'
	sigma_s = '0.         0.00020128; 0.0293529 0.       '
[]
[./mat_gcu_MNR395]
	block = 'MNR395'
	type = NuclearMaterial
	nu_sigma_f = '0.00337353 0.112506  '
	diffusivity = '1.62561  0.250515'
	sigma_r = '0.0305749 0.0728119'
	chi = '1. 0.'
	sigma_s = '0.        0.0002744; 0.0266791 0.       '
[]
[./mat_gcu_MNRC80]
	block = 'MNRC80'
	type = NuclearMaterial
	nu_sigma_f = '0.00154457 0.0479719 '
	diffusivity = '1.55699  0.233999'
	sigma_r = '0.0328214 0.0445155'
	chi = '1. 0.'
	sigma_s = '0.         0.00020954; 0.0303771 0.       '
[]
[./mat_gcu_MNR387]
	block = 'MNR387'
	type = NuclearMaterial
	nu_sigma_f = '0.00298021 0.10083   '
	diffusivity = '1.63375  0.246274'
	sigma_r = '0.0304677 0.0676133'
	chi = '1. 0.'
	sigma_s = '0.         0.00023471; 0.0266739 0.       '
[]
[./mat_gcu_D9graph]
	block = 'D9graph'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.29476 0.32963'
	sigma_r = '0.024521  0.0076921'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 3.90048e-05; 0.0242716 0.       '
[]
[./mat_gcu_D8graph]
	block = 'D8graph'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.27851  0.332824'
	sigma_r = '0.0221427  0.00764972'
	chi = '0. 0.'
	sigma_s = '0.0000e+00 6.9389e-05; 0.021912 0.      '
[]
[./mat_gcu_D7rifl]
	block = 'D7rifl'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '2.27459  0.268766'
	sigma_r = '0.0310472 0.0118151'
	chi = '0. 0.'
	sigma_s = '0.         0.00010062; 0.0307469 0.       '
[]
[./mat_gcu_MNR392]
	block = 'MNR392'
	type = NuclearMaterial
	nu_sigma_f = '0.00319747 0.10799   '
	diffusivity = '1.63193 0.24743'
	sigma_r = '0.030594  0.0710613'
	chi = '1. 0.'
	sigma_s = '0.        0.0002414; 0.0267463 0.       '
[]
[./mat_gcu_MNR381]
	block = 'MNR381'
	type = NuclearMaterial
	nu_sigma_f = '0.00268802 0.0933567 '
	diffusivity = '1.62315  0.248066'
	sigma_r = '0.0311113 0.0648568'
	chi = '1. 0.'
	sigma_s = '0.         0.00022322; 0.0273081 0.       '
[]
[./mat_gcu_MNR391]
	block = 'MNR391'
	type = NuclearMaterial
	nu_sigma_f = '0.00307618 0.104335  '
	diffusivity = '1.61863 0.24937'
	sigma_r = '0.0308898 0.0695991'
	chi = '1. 0.'
	sigma_s = '0.         0.00025843; 0.0270273 0.       '
[]
[./mat_gcu_MNR388]
	block = 'MNR388'
	type = NuclearMaterial
	nu_sigma_f = '0.00303217 0.102526  '
	diffusivity = '1.61536  0.249722'
	sigma_r = '0.0309775 0.0687057'
	chi = '1. 0.'
	sigma_s = '0.         0.00026917; 0.0271114 0.       '
[]
[./mat_gcu_MNR378]
	block = 'MNR378'
	type = NuclearMaterial
	nu_sigma_f = '0.00266777 0.0925235 '
	diffusivity = '1.60883  0.248294'
	sigma_r = '0.031461 0.064336'
	chi = '1. 0.'
	sigma_s = '0.         0.00024285; 0.0276228 0.       '
[]
[./mat_gcu_MNR390]
	block = 'MNR390'
	type = NuclearMaterial
	nu_sigma_f = '0.00309292 0.103829  '
	diffusivity = '1.63359  0.246406'
	sigma_r = '0.0305916 0.0690108'
	chi = '1. 0.'
	sigma_s = '0.        0.0002355; 0.0267611 0.       '
[]
[./mat_gcu_C9rifl]
	block = 'C9rifl'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '2.18939  0.259615'
	sigma_r = '0.0401205 0.0119411'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 3.76681e-05; 0.0397655 0.       '
[]
[./mat_gcu_C8graph]
	block = 'C8graph'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.29602  0.334746'
	sigma_r = '0.0206284  0.00759846'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 7.71426e-05; 0.0204172 0.       '
[]
[./mat_gcu_MNR379]
	block = 'MNR379'
	type = NuclearMaterial
	nu_sigma_f = '0.00251166 0.0876459 '
	diffusivity = '1.61786  0.245478'
	sigma_r = '0.0312808 0.0620286'
	chi = '1. 0.'
	sigma_s = '0.         0.00021182; 0.0274893 0.       '
[]
[./mat_gcu_MNR393]
	block = 'MNR393'
	type = NuclearMaterial
	nu_sigma_f = '0.00327048 0.110441  '
	diffusivity = '1.63878 0.24499'
	sigma_r = '0.0303747 0.072246 '
	chi = '1. 0.'
	sigma_s = '0.         0.00023036; 0.0265274 0.       '
[]
[./mat_gcu_010400]
	block = 'u10400'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.42725  0.171634'
	sigma_r = '0.0513076 0.0181416'
	chi = '0. 0.'
	sigma_s = '0.         0.00013755; 0.0508311 0.       '
[]
[./mat_gcu_MNR384]
	block = 'MNR384'
	type = NuclearMaterial
	nu_sigma_f = '0.00300923 0.103104  '
	diffusivity = '1.62721  0.246053'
	sigma_r = '0.0308562 0.0692342'
	chi = '1. 0.'
	sigma_s = '0.         0.00023651; 0.0270222 0.       '
[]
[./mat_gcu_MNR383]
	block = 'MNR383'
	type = NuclearMaterial
	nu_sigma_f = '0.00268626 0.0926519 '
	diffusivity = '1.61073  0.248355'
	sigma_r = '0.0312872 0.0644124'
	chi = '1. 0.'
	sigma_s = '0.         0.00025162; 0.0274447 0.       '
[]
[./mat_gcu_MNRC74]
	block = 'MNRC74'
	type = NuclearMaterial
	nu_sigma_f = '0.00091548 0.0307491 '
	diffusivity = '1.53805  0.230349'
	sigma_r = '0.0363812 0.0474219'
	chi = '1. 0.'
	sigma_s = '0.         0.00018862; 0.0297486 0.       '
[]
[./mat_gcu_MNR361]
	block = 'MNR361'
	type = NuclearMaterial
	nu_sigma_f = '0.00203312 0.0709554 '
	diffusivity = '1.61109  0.242917'
	sigma_r = '0.0317859 0.0544347'
	chi = '1. 0.'
	sigma_s = '0.        0.0001992; 0.0280173 0.       '
[]
[./mat_gcu_B9plug]
	block = 'B9plug'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.37187  0.150461'
	sigma_r = '0.0695575 0.0191825'
	chi = '0. 0.'
	sigma_s = '0.0000e+00 5.8419e-05; 0.0689793 0.       '
[]
[./mat_gcu_B8graph]
	block = 'B8graph'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.30289 0.33505'
	sigma_r = '0.020352   0.00759393'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 7.70885e-05; 0.0201382 0.       '
[]
[./mat_gcu_MNR398]
	block = 'MNR398'
	type = NuclearMaterial
	nu_sigma_f = '0.00335675 0.11301   '
	diffusivity = '1.63748  0.247921'
	sigma_r = '0.0303012 0.0727374'
	chi = '1. 0.'
	sigma_s = '0.         0.00022759; 0.0264609 0.       '
[]
[./mat_gcu_MNRC79]
	block = 'MNRC79'
	type = NuclearMaterial
	nu_sigma_f = '0.0015275 0.0514373'
	diffusivity = '1.56965  0.231958'
	sigma_r = '0.034474  0.0562382'
	chi = '1. 0.'
	sigma_s = '0.         0.00021191; 0.0283331 0.       '
[]
[./mat_gcu_MNR385]
	block = 'MNR385'
	type = NuclearMaterial
	nu_sigma_f = '0.00299639 0.102967  '
	diffusivity = '1.63749  0.249141'
	sigma_r = '0.0305458 0.0689651'
	chi = '1. 0.'
	sigma_s = '0.         0.00022504; 0.0267511 0.       '
[]
[./mat_gcu_MNRC78]
	block = 'MNRC78'
	type = NuclearMaterial
	nu_sigma_f = '0.00119753 0.0407284 '
	diffusivity = '1.55614  0.230926'
	sigma_r = '0.0355011 0.0516546'
	chi = '1. 0.'
	sigma_s = '0.         0.00019229; 0.0291317 0.       '
[]
[./mat_gcu_MNR358]
	block = 'MNR358'
	type = NuclearMaterial
	nu_sigma_f = '0.00214806 0.0751653 '
	diffusivity = '1.59778  0.245956'
	sigma_r = '0.0319393 0.0564421'
	chi = '1. 0.'
	sigma_s = '0.         0.00022382; 0.0281361 0.       '
[]
[./mat_gcu_MNR373]
	block = 'MNR373'
	type = NuclearMaterial
	nu_sigma_f = '0.00238575 0.082812  '
	diffusivity = '1.58998  0.246131'
	sigma_r = '0.0320853 0.0599448'
	chi = '1. 0.'
	sigma_s = '0.         0.00021687; 0.0282065 0.       '
[]
[./mat_gcu_MNR365]
	block = 'MNR365'
	type = NuclearMaterial
	nu_sigma_f = '0.00226415 0.0782591 '
	diffusivity = '1.61461  0.243344'
	sigma_r = '0.0315399 0.0576899'
	chi = '1. 0.'
	sigma_s = '0.         0.00020027; 0.0277563 0.       '
[]
[./mat_gcu_A9plug]
	block = 'A9plug'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.42964  0.149931'
	sigma_r = '0.0673868 0.019209 '
	chi = '0. 0.'
	sigma_s = '0.00000e+00 5.60704e-05; 0.0668318 0.       '
[]
[./mat_gcu_A8graph]
	block = 'A8graph'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.29264 0.33173'
	sigma_r = '0.0223767  0.00762054'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 5.56899e-05; 0.0221511 0.       '
[]
[./mat_gcu_A7rifl]
	block = 'A7rifl'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '2.26897  0.265841'
	sigma_r = '0.0318287 0.0118442'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 8.39927e-05; 0.0315222 0.       '
[]
[./mat_gcu_MNR397]
	block = 'MNR397'
	type = NuclearMaterial
	nu_sigma_f = '0.00336312 0.112662  '
	diffusivity = '1.64848  0.246881'
	sigma_r = '0.0302802 0.0726128'
	chi = '1. 0.'
	sigma_s = '0.         0.00022016; 0.0264325 0.       '
[]
[./mat_gcu_MNR376]
	block = 'MNR376'
	type = NuclearMaterial
	nu_sigma_f = '0.00245323 0.0852881 '
	diffusivity = '1.62463  0.246297'
	sigma_r = '0.0310802 0.0609296'
	chi = '1. 0.'
	sigma_s = '0.        0.0002088; 0.0273069 0.       '
[]
[./mat_gcu_MNR366]
	block = 'MNR366'
	type = NuclearMaterial
	nu_sigma_f = '0.00203145 0.0710548 '
	diffusivity = '1.60962  0.244023'
	sigma_r = '0.0320388 0.0546528'
	chi = '1. 0.'
	sigma_s = '0.         0.00018983; 0.0282509 0.       '
[]
[./mat_gcu_MNR362]
	block = 'MNR362'
	type = NuclearMaterial
	nu_sigma_f = '0.00193906 0.0672882 '
	diffusivity = '1.593    0.242346'
	sigma_r = '0.0324648 0.05299  '
	chi = '1. 0.'
	sigma_s = '0.         0.00017644; 0.0286608 0.       '
[]
[./mat_gcu_010500]
	block = 'u10500'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '0.898769 0.30466 '
	sigma_r = '0.0176054  0.00585456'
	chi = '0. 0.'
	sigma_s = '0.         0.00012528; 0.0164623 0.       '
[]
[./mat_gcu_MNR369]
	block = 'MNR369'
	type = NuclearMaterial
	nu_sigma_f = '0.00224926 0.0780871 '
	diffusivity = '1.61752  0.240143'
	sigma_r = '0.0315897 0.0576235'
	chi = '1. 0.'
	sigma_s = '0.         0.00015961; 0.027835 0.      '
[]
[]
