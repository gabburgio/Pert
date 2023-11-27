[Mesh]
file = mnr_active.msh
[]


[Outputs]
exodus = true
[]


[Executioner]
type = Eigenvalue
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
	type = L2ArrayAlbedoBC
    gamma_factors = '1 1'
	boundary = 'north south west east bottom top'
	albedo_matrix = '3.21335E-01  7.95606E-06; 2.05120E-01 7.76475E-01'
[]
[]



[Materials]
[./gcu_A9plug]
	block = 'A9plug'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.42686  0.149983'
	sigma_r = '0.067407  0.0191726'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 5.31449e-05; 0.0668303 0.       '
[]
[./gcu_B9plug]
	block = 'B9plug'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.37202 0.15045'
	sigma_r = '0.0697863 0.0191368'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 5.63355e-05; 0.0692024 0.       '
[]
[./gcu_C9rifl]
	block = 'C9rifl'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '2.26134  0.265591'
	sigma_r = '0.0389067 0.011662 '
	chi = '0. 0.'
	sigma_s = '0.00000e+00 3.83858e-05; 0.0385657 0.       '
[]
[./gcu_D9graph]
	block = 'D9graph'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.29207  0.329429'
	sigma_r = '0.0245758  0.00771401'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 4.08744e-05; 0.0243296 0.       '
[]
[./gcu_E9rifl]
	block = 'E9rifl'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '2.273    0.266104'
	sigma_r = '0.0387904 0.0116588'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 3.57544e-05; 0.0384448 0.       '
[]
[./gcu_F9plug]
	block = 'F9plug'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.41773  0.149909'
	sigma_r = '0.0682728 0.0191691'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 5.38422e-05; 0.0676944 0.       '
[]
[./gcu_A8graph]
	block = 'A8graph'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.2903   0.331313'
	sigma_r = '0.022376   0.00764855'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 5.54935e-05; 0.0221412 0.       '
[]
[./gcu_B8graph]
	block = 'B8graph'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.30027  0.334449'
	sigma_r = '0.0204643  0.00763731'
	chi = '0. 0.'
	sigma_s = '0.0000e+00 7.4667e-05; 0.0202496 0.       '
[]
[./gcu_C8graph]
	block = 'C8graph'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.29445  0.334451'
	sigma_r = '0.0207814 0.0076296'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 7.53292e-05; 0.0205649 0.       '
[]
[./gcu_D8graph]
	block = 'D8graph'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.27828  0.332318'
	sigma_r = '0.0221893  0.00766862'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 7.11234e-05; 0.0219627 0.       '
[]
[./gcu_E8graph]
	block = 'E8graph'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.30521  0.334296'
	sigma_r = '0.0205937  0.00763869'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 6.97319e-05; 0.0203792 0.       '
[]
[./gcu_F8graph]
	block = 'F8graph'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.30007  0.331165'
	sigma_r = '0.0221445 0.0076661'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 5.54128e-05; 0.021913 0.      '
[]
[./gcu_A7rifl]
	block = 'A7rifl'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '2.35996  0.276159'
	sigma_r = '0.0307239 0.0114272'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 8.22102e-05; 0.0304321 0.       '
[]
[./gcu_MNR398]
	block = 'MNR398'
	type = NuclearMaterial
	nu_sigma_f = '0.00336538 0.113321  '
	diffusivity = '1.63822  0.247173'
	sigma_r = '0.0304851 0.0728505'
	chi = '1. 0.'
	sigma_s = '0.         0.00022492; 0.0266231 0.       '
[]
[./gcu_MNR379]
	block = 'MNR379'
	type = NuclearMaterial
	nu_sigma_f = '0.00253018 0.0877909 '
	diffusivity = '1.61455  0.244901'
	sigma_r = '0.0315401 0.0621308'
	chi = '1. 0.'
	sigma_s = '0.        0.0002077; 0.0277299 0.       '
[]
[./gcu_D7rifl]
	block = 'D7rifl'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '2.35117 0.27885'
	sigma_r = '0.030082  0.0113963'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 9.91257e-05; 0.0297969 0.       '
[]
[./gcu_MNR394]
	block = 'MNR394'
	type = NuclearMaterial
	nu_sigma_f = '0.00330408 0.111506  '
	diffusivity = '1.65201  0.245947'
	sigma_r = '0.0305472 0.0724467'
	chi = '1. 0.'
	sigma_s = '0.         0.00019421; 0.0267206 0.       '
[]
[./gcu_F7rifl]
	block = 'F7rifl'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '2.37438 0.27598'
	sigma_r = '0.0304537 0.0114428'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 8.05433e-05; 0.0301618 0.       '
[]
[./gcu_MNR397]
	block = 'MNR397'
	type = NuclearMaterial
	nu_sigma_f = '0.00337058 0.113736  '
	diffusivity = '1.64898  0.246878'
	sigma_r = '0.0304994 0.0731982'
	chi = '1. 0.'
	sigma_s = '0.         0.00020974; 0.0266375 0.       '
[]
[./gcu_MNRC79]
	block = 'MNRC79'
	type = NuclearMaterial
	nu_sigma_f = '0.00154305 0.0494753 '
	diffusivity = '1.58795  0.232132'
	sigma_r = '0.0332714 0.0440771'
	chi = '1. 0.'
	sigma_s = '0.         0.00018944; 0.0305181 0.       '
[]
[./gcu_MNR393]
	block = 'MNR393'
	type = NuclearMaterial
	nu_sigma_f = '0.00329229 0.111041  '
	diffusivity = '1.63872 0.24486'
	sigma_r = '0.0306049 0.0725409'
	chi = '1. 0.'
	sigma_s = '0.        0.0002256; 0.026742 0.      '
[]
[./gcu_MNR392]
	block = 'MNR392'
	type = NuclearMaterial
	nu_sigma_f = '0.00322191 0.108515  '
	diffusivity = '1.632    0.247271'
	sigma_r = '0.0308107 0.0714053'
	chi = '1. 0.'
	sigma_s = '0.        0.0002366; 0.0269412 0.       '
[]
[./gcu_MNRC77]
	block = 'MNRC77'
	type = NuclearMaterial
	nu_sigma_f = '0.0011599 0.0377577'
	diffusivity = '1.57151 0.23106'
	sigma_r = '0.0341264 0.0387782'
	chi = '1. 0.'
	sigma_s = '0.         0.00018078; 0.0313675 0.       '
[]
[./gcu_MNR396]
	block = 'MNR396'
	type = NuclearMaterial
	nu_sigma_f = '0.00336157 0.113412  '
	diffusivity = '1.651    0.246882'
	sigma_r = '0.0304768 0.0730465'
	chi = '1. 0.'
	sigma_s = '0.         0.00020535; 0.0266288 0.       '
[]
[./gcu_MNR376]
	block = 'MNR376'
	type = NuclearMaterial
	nu_sigma_f = '0.00247102 0.0856923 '
	diffusivity = '1.62066  0.245887'
	sigma_r = '0.0313028 0.0611264'
	chi = '1. 0.'
	sigma_s = '0.         0.00020938; 0.0275006 0.       '
[]
[./gcu_MNR385]
	block = 'MNR385'
	type = NuclearMaterial
	nu_sigma_f = '0.00301085 0.103576  '
	diffusivity = '1.63828  0.248098'
	sigma_r = '0.030659  0.0692846'
	chi = '1. 0.'
	sigma_s = '0.         0.00021796; 0.0268531 0.       '
[]
[./gcu_010400]
	block = 'u10400'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.42772  0.171624'
	sigma_r = '0.0514227 0.0181205'
	chi = '0. 0.'
	sigma_s = '0.         0.00013613; 0.0509457 0.       '
[]
[./gcu_MNR381]
	block = 'MNR381'
	type = NuclearMaterial
	nu_sigma_f = '0.00271062 0.0935486 '
	diffusivity = '1.62129  0.247503'
	sigma_r = '0.0313168 0.0649376'
	chi = '1. 0.'
	sigma_s = '0.         0.00022116; 0.0274873 0.       '
[]
[./gcu_MNR377]
	block = 'MNR377'
	type = NuclearMaterial
	nu_sigma_f = '0.00269541 0.0933103 '
	diffusivity = '1.61438  0.247302'
	sigma_r = '0.0312573 0.0646224'
	chi = '1. 0.'
	sigma_s = '0.         0.00024494; 0.0274398 0.       '
[]
[./gcu_MNR375]
	block = 'MNR375'
	type = NuclearMaterial
	nu_sigma_f = '0.00247222 0.0855822 '
	diffusivity = '1.62171  0.245891'
	sigma_r = '0.0313726 0.0610853'
	chi = '1. 0.'
	sigma_s = '0.         0.00020988; 0.0275748 0.       '
[]
[./gcu_MNR366]
	block = 'MNR366'
	type = NuclearMaterial
	nu_sigma_f = '0.00206144 0.0722383 '
	diffusivity = '1.61209  0.243964'
	sigma_r = '0.0322035 0.0552659'
	chi = '1. 0.'
	sigma_s = '0.         0.00018227; 0.0284021 0.       '
[]
[./gcu_MNRC78]
	block = 'MNRC78'
	type = NuclearMaterial
	nu_sigma_f = '0.00122341 0.0396345 '
	diffusivity = '1.57365  0.231331'
	sigma_r = '0.0342341 0.0397269'
	chi = '1. 0.'
	sigma_s = '0.         0.00017544; 0.0314522 0.       '
[]
[./gcu_MNR384]
	block = 'MNR384'
	type = NuclearMaterial
	nu_sigma_f = '0.00302522 0.103704  '
	diffusivity = '1.62674  0.245762'
	sigma_r = '0.0310524 0.0695697'
	chi = '1. 0.'
	sigma_s = '0.         0.00022928; 0.0272053 0.       '
[]
[./gcu_MNR391]
	block = 'MNR391'
	type = NuclearMaterial
	nu_sigma_f = '0.00309498 0.104929  '
	diffusivity = '1.61912  0.249064'
	sigma_r = '0.0310961 0.0699391'
	chi = '1. 0.'
	sigma_s = '0.         0.00025095; 0.0272199 0.       '
[]
[./gcu_MNRC76]
	block = 'MNRC76'
	type = NuclearMaterial
	nu_sigma_f = '0.00111614 0.0357977 '
	diffusivity = '1.56232  0.231167'
	sigma_r = '0.0345557 0.0379377'
	chi = '1. 0.'
	sigma_s = '0.         0.00018096; 0.0317634 0.       '
[]
[./gcu_MNR374]
	block = 'MNR374'
	type = NuclearMaterial
	nu_sigma_f = '0.00228299 0.0799115 '
	diffusivity = '1.61678  0.245367'
	sigma_r = '0.0319109 0.0587623'
	chi = '1. 0.'
	sigma_s = '0.         0.00019522; 0.0280934 0.       '
[]
[./gcu_MNR362]
	block = 'MNR362'
	type = NuclearMaterial
	nu_sigma_f = '0.00195939 0.0677102 '
	diffusivity = '1.58887  0.242032'
	sigma_r = '0.0327108 0.0532383'
	chi = '1. 0.'
	sigma_s = '0.         0.00017621; 0.0288819 0.       '
[]
[./gcu_MNR358]
	block = 'MNR358'
	type = NuclearMaterial
	nu_sigma_f = '0.00216804 0.0756598 '
	diffusivity = '1.59667 0.24532'
	sigma_r = '0.0320637 0.0567168'
	chi = '1. 0.'
	sigma_s = '0.         0.00022376; 0.0282611 0.       '
[]
[./gcu_MNR383]
	block = 'MNR383'
	type = NuclearMaterial
	nu_sigma_f = '0.00270698 0.0929828 '
	diffusivity = '1.6098   0.247355'
	sigma_r = '0.0314499 0.0645551'
	chi = '1. 0.'
	sigma_s = '0.         0.00024907; 0.0275986 0.       '
[]
[./gcu_MNR388]
	block = 'MNR388'
	type = NuclearMaterial
	nu_sigma_f = '0.00304787 0.102563  '
	diffusivity = '1.61296  0.249011'
	sigma_r = '0.0312119 0.0687417'
	chi = '1. 0.'
	sigma_s = '0.         0.00026503; 0.0273341 0.       '
[]
[./gcu_MNR395]
	block = 'MNR395'
	type = NuclearMaterial
	nu_sigma_f = '0.00338385 0.112554  '
	diffusivity = '1.62331  0.249812'
	sigma_r = '0.0308017 0.0728426'
	chi = '1. 0.'
	sigma_s = '0.         0.00026913; 0.0268962 0.       '
[]
[./gcu_MNR372]
	block = 'MNR372'
	type = NuclearMaterial
	nu_sigma_f = '0.00245772 0.0848827 '
	diffusivity = '1.61841  0.245767'
	sigma_r = '0.0314826 0.060762 '
	chi = '1. 0.'
	sigma_s = '0.         0.00021376; 0.0276805 0.       '
[]
[./gcu_010500]
	block = 'u10500'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '0.896274 0.30348 '
	sigma_r = '0.0177369  0.00601289'
	chi = '0. 0.'
	sigma_s = '0.         0.00012524; 0.0165992 0.       '
[]
[./gcu_MNR373]
	block = 'MNR373'
	type = NuclearMaterial
	nu_sigma_f = '0.0024074 0.0836988'
	diffusivity = '1.59097  0.246023'
	sigma_r = '0.0322274 0.0604261'
	chi = '1. 0.'
	sigma_s = '0.         0.00020821; 0.028356 0.      '
[]
[./gcu_MNRC74]
	block = 'MNRC74'
	type = NuclearMaterial
	nu_sigma_f = '0.00094131 0.0302906 '
	diffusivity = '1.55497  0.230474'
	sigma_r = '0.0351161 0.0354281'
	chi = '1. 0.'
	sigma_s = '0.         0.00016917; 0.0323096 0.       '
[]
[./gcu_MNR378]
	block = 'MNR378'
	type = NuclearMaterial
	nu_sigma_f = '0.00268982 0.0930782 '
	diffusivity = '1.60953  0.247997'
	sigma_r = '0.0316692 0.0646157'
	chi = '1. 0.'
	sigma_s = '0.         0.00023353; 0.0278138 0.       '
[]
[./gcu_MNRC80]
	block = 'MNRC80'
	type = NuclearMaterial
	nu_sigma_f = '0.00155854 0.0483204 '
	diffusivity = '1.55288  0.236648'
	sigma_r = '0.0326894 0.0452126'
	chi = '1. 0.'
	sigma_s = '0.         0.00020871; 0.0302201 0.       '
[]
[./gcu_MNR382]
	block = 'MNR382'
	type = NuclearMaterial
	nu_sigma_f = '0.00292869 0.0993252 '
	diffusivity = '1.62789  0.247389'
	sigma_r = '0.0312122 0.0671297'
	chi = '1. 0.'
	sigma_s = '0.        0.0002219; 0.0273647 0.       '
[]
[./gcu_MNR369]
	block = 'MNR369'
	type = NuclearMaterial
	nu_sigma_f = '0.00228078 0.0784626 '
	diffusivity = '1.61311  0.239744'
	sigma_r = '0.0318812 0.0578378'
	chi = '1. 0.'
	sigma_s = '0.         0.00016326; 0.0280896 0.       '
[]
[./gcu_MNR365]
	block = 'MNR365'
	type = NuclearMaterial
	nu_sigma_f = '0.00227277 0.0785367 '
	diffusivity = '1.61218  0.242604'
	sigma_r = '0.0317843 0.0577917'
	chi = '1. 0.'
	sigma_s = '0.         0.00019576; 0.0279855 0.       '
[]
[./gcu_MNR361]
	block = 'MNR361'
	type = NuclearMaterial
	nu_sigma_f = '0.00204601 0.0715026 '
	diffusivity = '1.61165  0.242032'
	sigma_r = '0.031886  0.0547899'
	chi = '1. 0.'
	sigma_s = '0.         0.00019465; 0.02812 0.     '
[]
[./gcu_MNR390]
	block = 'MNR390'
	type = NuclearMaterial
	nu_sigma_f = '0.0031143 0.103927 '
	diffusivity = '1.63149  0.245739'
	sigma_r = '0.0308555 0.0690847'
	chi = '1. 0.'
	sigma_s = '0.         0.00023068; 0.0270073 0.       '
[]
[./gcu_MNR387]
	block = 'MNR387'
	type = NuclearMaterial
	nu_sigma_f = '0.00299397 0.100637  '
	diffusivity = '1.62924  0.245757'
	sigma_r = '0.0308203 0.0675531'
	chi = '1. 0.'
	sigma_s = '0.         0.00023843; 0.0269946 0.       '
[]
[./gcu_MNR389]
	block = 'MNR389'
	type = NuclearMaterial
	nu_sigma_f = '0.00302801 0.101654  '
	diffusivity = '1.64398  0.245082'
	sigma_r = '0.0306198 0.0679045'
	chi = '1. 0.'
	sigma_s = '0.         0.00020543; 0.0268029 0.       '
[]
[]
