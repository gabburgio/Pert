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
	albedo_matrix = '3.22300E-01 8.23935E-06; 2.03030E-01  7.72700E-01'
    execute_on = 'LINEAR'
    boundary = 'north south west east bottom top'
[]
[./alb_1]
    type = AlbedoCorrectedArraySideIntegralPostprocessor
    variable = flux
	albedo_matrix = '3.22300E-01 8.23935E-06; 2.03030E-01  7.72700E-01'
    component = 1
    execute_on = 'LINEAR'
    boundary = 'north south west east bottom top' 
[]
[]



[BCs]
[./albedo]
	variable = flux
	type = L2ArrayAlbedoBC
    gamma_factors = ' 0.705356 0.0956741'
	boundary = 'north south west east bottom top'
	albedo_matrix = '3.22300E-01 8.23935E-06; 2.03030E-01  7.72700E-01'
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
[./gcu_F9plug]
	block = 'F9plug'
	type = CorrectedNuclearMaterial
	sph_factors = '0.779297 0.494318'
 	nu_sigma_f = '0. 0.'
	diffusivity = '1.42344  0.149939'
	sigma_r = '0.06816   0.0191539'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 5.21682e-05; 0.0675826 0.       '
[]
[./gcu_F8graph]
	block = 'F8graph'
	type = CorrectedNuclearMaterial
	sph_factors = '0.819561 0.621177'
 	nu_sigma_f = '0. 0.'
	diffusivity = '1.29977  0.331518'
	sigma_r = '0.0221062  0.00764318'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 5.36105e-05; 0.0218714 0.       '
[]
[./gcu_F7rifl]
	block = 'F7rifl'
	type = CorrectedNuclearMaterial
	sph_factors = '0.785029 0.848481'
 	nu_sigma_f = '0. 0.'
	diffusivity = '2.29105  0.265707'
	sigma_r = '0.0315613 0.0119023'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 8.48641e-05; 0.0312581 0.       '
[]
[./gcu_MNR396]
	block = 'MNR396'
	type = CorrectedNuclearMaterial
	sph_factors = '1.01034  0.929419'
 	nu_sigma_f = '0.00335425 0.112308  '
	diffusivity = '1.65016  0.246586'
	sigma_r = '0.0303022 0.0725117'
	chi = '1. 0.'
	sigma_s = '6.00000e-06 2.11843e-04; 0.0264506 0.       '
[]
[./gcu_MNR375]
	block = 'MNR375'
	type = CorrectedNuclearMaterial
	sph_factors = '1.02596 1.29277'
 	nu_sigma_f = '0.002453  0.0850453'
	diffusivity = '1.62344  0.246465'
	sigma_r = '0.0311932 0.0608175'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.14709e-04; 0.0274189 0.       '
[]
[./gcu_MNR374]
	block = 'MNR374'
	type = CorrectedNuclearMaterial
	sph_factors = '1.00274 1.52443'
 	nu_sigma_f = '0.0022538 0.0787876'
	diffusivity = '1.61614  0.245348'
	sigma_r = '0.0317285 0.0581535'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.02626e-04; 0.0279275 0.       '
[]
[./gcu_MNR372]
	block = 'MNR372'
	type = CorrectedNuclearMaterial
	sph_factors = '1.01537 1.77044'
 	nu_sigma_f = '0.00244701 0.0847402 '
	diffusivity = '1.62134  0.246221'
	sigma_r = '0.0312202 0.0607111'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.18902e-04; 0.0274365 0.       '
[]
[./gcu_MNR382]
	block = 'MNR382'
	type = CorrectedNuclearMaterial
	sph_factors = '0.99716 2.16673'
 	nu_sigma_f = '0.00291478 0.0993726 '
	diffusivity = '1.63294  0.248092'
	sigma_r = '0.0308507 0.0671501'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.21231e-04; 0.0270331 0.       '
[]
[./gcu_MNR389]
	block = 'MNR389'
	type = CorrectedNuclearMaterial
	sph_factors = '0.941556 2.64564 '
 	nu_sigma_f = '0.00300897 0.101809  '
	diffusivity = '1.6485   0.245631'
	sigma_r = '0.0302687 0.0680053'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.06736e-04; 0.0264871 0.       '
[]
[./gcu_E9rifl]
	block = 'E9rifl'
	type = CorrectedNuclearMaterial
	sph_factors = '0.79871  0.496229'
 	nu_sigma_f = '0. 0.'
	diffusivity = '2.23309  0.260262'
	sigma_r = '0.0396426 0.0118958'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 3.60081e-05; 0.039291 0.      '
[]
[./gcu_E8graph]
	block = 'E8graph'
	type = CorrectedNuclearMaterial
	sph_factors = '0.856493 0.613369'
 	nu_sigma_f = '0. 0.'
	diffusivity = '1.30605  0.334557'
	sigma_r = '0.0205279  0.00760694'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 6.82442e-05; 0.020306 0.      '
[]
[./gcu_MNR394]
	block = 'MNR394'
	type = CorrectedNuclearMaterial
	sph_factors = '1.06467 0.53546'
 	nu_sigma_f = '0.00328621 0.111229  '
	diffusivity = '1.65085  0.246951'
	sigma_r = '0.0303395 0.072251 '
	chi = '1. 0.'
	sigma_s = '6.00000e-06 1.97146e-04; 0.0265234 0.       '
[]
[./gcu_MNRC77]
	block = 'MNRC77'
	type = CorrectedNuclearMaterial
	sph_factors = '0.958414 0.939329'
 	nu_sigma_f = '0.00114081 0.038632  '
	diffusivity = '1.55421  0.230773'
	sigma_r = '0.0353697 0.050227 '
	chi = '1. 0.'
	sigma_s = '4.00000e-06 1.97686e-04; 0.0291023 0.       '
[]
[./gcu_MNR377]
	block = 'MNR377'
	type = CorrectedNuclearMaterial
	sph_factors = '1.11915 1.05754'
 	nu_sigma_f = '0.00268787 0.0926462 '
	diffusivity = '1.61473  0.248529'
	sigma_r = '0.0311742 0.064266 '
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.51964e-04; 0.0273621 0.       '
[]
[./gcu_MNRC76]
	block = 'MNRC76'
	type = CorrectedNuclearMaterial
	sph_factors = '0.997745 1.42155 '
 	nu_sigma_f = '0.00109516 0.0368633 '
	diffusivity = '1.54517  0.230974'
	sigma_r = '0.0357903 0.049983 '
	chi = '1. 0.'
	sigma_s = '3.00000e-06 2.03932e-04; 0.0293568 0.       '
[]
[./gcu_MNR395]
	block = 'MNR395'
	type = CorrectedNuclearMaterial
	sph_factors = '1.15828 1.40299'
 	nu_sigma_f = '0.00336978 0.112372  '
	diffusivity = '1.62543  0.250596'
	sigma_r = '0.0306063 0.0726948'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.73327e-04; 0.0267087 0.       '
[]
[./gcu_MNRC80]
	block = 'MNRC80'
	type = CorrectedNuclearMaterial
	sph_factors = '1.00032 2.25119'
 	nu_sigma_f = '0.00154986 0.0479387 '
	diffusivity = '1.55621  0.234008'
	sigma_r = '0.0328485 0.0444722'
	chi = '1. 0.'
	sigma_s = '3.00000e-06 2.06138e-04; 0.0304052 0.       '
[]
[./gcu_MNR387]
	block = 'MNR387'
	type = CorrectedNuclearMaterial
	sph_factors = '1.0008  2.11651'
 	nu_sigma_f = '0.00296751 0.100606  '
	diffusivity = '1.63382  0.246163'
	sigma_r = '0.0304826 0.0675291'
	chi = '1. 0.'
	sigma_s = '6.00000e-06 2.33454e-04; 0.026685 0.      '
[]
[./gcu_D9graph]
	block = 'D9graph'
	type = CorrectedNuclearMaterial
	sph_factors = '0.805456 0.492178'
 	nu_sigma_f = '0. 0.'
	diffusivity = '1.2898  0.32954'
	sigma_r = '0.0245384 0.0077067'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 4.25551e-05; 0.0242899 0.       '
[]
[./gcu_D8graph]
	block = 'D8graph'
	type = CorrectedNuclearMaterial
	sph_factors = '0.840037 0.635953'
 	nu_sigma_f = '0. 0.'
	diffusivity = '1.27773  0.332679'
	sigma_r = '0.022096   0.00764108'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 6.96526e-05; 0.0218691 0.       '
[]
[./gcu_D7rifl]
	block = 'D7rifl'
	type = CorrectedNuclearMaterial
	sph_factors = '0.881274 0.812458'
 	nu_sigma_f = '0. 0.'
	diffusivity = '2.27784  0.268769'
	sigma_r = '0.031094  0.0118013'
	chi = '0. 0.'
	sigma_s = '1.00000e-06 1.02542e-04; 0.0308037 0.       '
[]
[./gcu_MNR392]
	block = 'MNR392'
	type = CorrectedNuclearMaterial
	sph_factors = '1.13621  0.735057'
 	nu_sigma_f = '0.00319732 0.107897  '
	diffusivity = '1.63146  0.247267'
	sigma_r = '0.0306003 0.0710662'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.40948e-04; 0.0267482 0.       '
[]
[./gcu_MNR381]
	block = 'MNR381'
	type = CorrectedNuclearMaterial
	sph_factors = '1.1815   0.922122'
 	nu_sigma_f = '0.00268793 0.0933079 '
	diffusivity = '1.62327  0.247951'
	sigma_r = '0.0311035 0.0648058'
	chi = '1. 0.'
	sigma_s = '5.0000e-06 2.2247e-04; 0.0272995 0.       '
[]
[./gcu_MNR391]
	block = 'MNR391'
	type = CorrectedNuclearMaterial
	sph_factors = '1.20384 1.07301'
 	nu_sigma_f = '0.00308317 0.104319  '
	diffusivity = '1.61896  0.249266'
	sigma_r = '0.0308909 0.0696268'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.58427e-04; 0.0270312 0.       '
[]
[./gcu_MNR388]
	block = 'MNR388'
	type = CorrectedNuclearMaterial
	sph_factors = '1.19179 1.30748'
 	nu_sigma_f = '0.00302789 0.102552  '
	diffusivity = '1.61594  0.249628'
	sigma_r = '0.0309532 0.0687069'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.67344e-04; 0.027097 0.      '
[]
[./gcu_MNR378]
	block = 'MNR378'
	type = CorrectedNuclearMaterial
	sph_factors = '1.10522 1.62074'
 	nu_sigma_f = '0.00267084 0.092361  '
	diffusivity = '1.60878  0.248213'
	sigma_r = '0.0314667 0.0642416'
	chi = '1. 0.'
	sigma_s = '6.00000e-06 2.45269e-04; 0.0276244 0.       '
[]
[./gcu_MNR390]
	block = 'MNR390'
	type = CorrectedNuclearMaterial
	sph_factors = '1.02348 1.83949'
 	nu_sigma_f = '0.00309421 0.103811  '
	diffusivity = '1.63444  0.246354'
	sigma_r = '0.0305855 0.0690484'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.36653e-04; 0.0267558 0.       '
[]
[./gcu_C9rifl]
	block = 'C9rifl'
	type = CorrectedNuclearMaterial
	sph_factors = '0.765964 0.505073'
 	nu_sigma_f = '0. 0.'
	diffusivity = '2.20306  0.259468'
	sigma_r = '0.0398963 0.0119547'
	chi = '0. 0.'
	sigma_s = '1.0000e-06 3.9308e-05; 0.0395307 0.       '
[]
[./gcu_C8graph]
	block = 'C8graph'
	type = CorrectedNuclearMaterial
	sph_factors = '0.857178 0.632162'
 	nu_sigma_f = '0. 0.'
	diffusivity = '1.29477  0.334738'
	sigma_r = '0.0206582  0.00761413'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 7.72297e-05; 0.0204431 0.       '
[]
[./gcu_MNR379]
	block = 'MNR379'
	type = CorrectedNuclearMaterial
	sph_factors = '1.07661  0.587425'
 	nu_sigma_f = '0.00250878 0.0875441 '
	diffusivity = '1.6176   0.245293'
	sigma_r = '0.0312987 0.061997 '
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.05218e-04; 0.0275103 0.       '
[]
[./gcu_MNR393]
	block = 'MNR393'
	type = CorrectedNuclearMaterial
	sph_factors = '1.15501  0.736309'
 	nu_sigma_f = '0.00327418 0.110414  '
	diffusivity = '1.63985  0.245035'
	sigma_r = '0.0303616 0.0721898'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.31133e-04; 0.0265064 0.       '
[]
[./gcu_010400]
	block = 'u10400'
	type = CorrectedNuclearMaterial
	sph_factors = '0.904243 1.53454 '
 	nu_sigma_f = '0. 0.'
	diffusivity = '1.42833  0.171605'
	sigma_r = '0.051285  0.0181568'
	chi = '0. 0.'
	sigma_s = '0.         0.00013582; 0.0508085 0.       '
[]
[./gcu_MNR384]
	block = 'MNR384'
	type = CorrectedNuclearMaterial
	sph_factors = '1.18941 1.06225'
 	nu_sigma_f = '0.00301355 0.103053  '
	diffusivity = '1.62635  0.245872'
	sigma_r = '0.0308667 0.0692068'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.33567e-04; 0.0270323 0.       '
[]
[./gcu_MNR383]
	block = 'MNR383'
	type = CorrectedNuclearMaterial
	sph_factors = '1.16723 1.2863 '
 	nu_sigma_f = '0.00269274 0.0926467 '
	diffusivity = '1.61041  0.248408'
	sigma_r = '0.0312922 0.0643935'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.55882e-04; 0.0274545 0.       '
[]
[./gcu_MNRC74]
	block = 'MNRC74'
	type = CorrectedNuclearMaterial
	sph_factors = '0.955994 1.71934 '
 	nu_sigma_f = '0.00091457 0.0308874 '
	diffusivity = '1.53657 0.23018'
	sigma_r = '0.0364011 0.0474196'
	chi = '1. 0.'
	sigma_s = '2.00000e-06 1.88891e-04; 0.0297718 0.       '
[]
[./gcu_MNR361]
	block = 'MNR361'
	type = CorrectedNuclearMaterial
	sph_factors = '0.967584 1.86733 '
 	nu_sigma_f = '0.0020306 0.0710231'
	diffusivity = '1.61186  0.242767'
	sigma_r = '0.0317709 0.0545386'
	chi = '1. 0.'
	sigma_s = '4.00000e-06 1.97742e-04; 0.0280088 0.       '
[]
[./gcu_B9plug]
	block = 'B9plug'
	type = CorrectedNuclearMaterial
	sph_factors = '0.7103   0.531154'
 	nu_sigma_f = '0. 0.'
	diffusivity = '1.36977  0.150502'
	sigma_r = '0.0698982 0.0191472'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 6.01893e-05; 0.06932 0.     '
[]
[./gcu_B8graph]
	block = 'B8graph'
	type = CorrectedNuclearMaterial
	sph_factors = '0.854117 0.667043'
 	nu_sigma_f = '0. 0.'
	diffusivity = '1.30009  0.335013'
	sigma_r = '0.0203607  0.00759739'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 7.75577e-05; 0.0201479 0.       '
[]
[./gcu_MNR398]
	block = 'MNR398'
	type = CorrectedNuclearMaterial
	sph_factors = '1.08227  0.584702'
 	nu_sigma_f = '0.00335859 0.112986  '
	diffusivity = '1.63962  0.248226'
	sigma_r = '0.0303081 0.0726652'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.29914e-04; 0.0264605 0.       '
[]
[./gcu_MNRC79]
	block = 'MNRC79'
	type = CorrectedNuclearMaterial
	sph_factors = '1.00583  0.915485'
 	nu_sigma_f = '0.00152823 0.0514587 '
	diffusivity = '1.57073  0.231904'
	sigma_r = '0.0344797 0.0562186'
	chi = '1. 0.'
	sigma_s = '3.0000e-06 2.0703e-04; 0.0283274 0.       '
[]
[./gcu_MNR385]
	block = 'MNR385'
	type = CorrectedNuclearMaterial
	sph_factors = '1.15994  0.927524'
 	nu_sigma_f = '0.0030093 0.102879 '
	diffusivity = '1.63794  0.249173'
	sigma_r = '0.0305694 0.0689174'
	chi = '1. 0.'
	sigma_s = '6.00000e-06 2.20468e-04; 0.0267595 0.       '
[]
[./gcu_MNRC78]
	block = 'MNRC78'
	type = CorrectedNuclearMaterial
	sph_factors = '1.00726 1.30474'
 	nu_sigma_f = '0.00119996 0.0407114 '
	diffusivity = '1.55463  0.230754'
	sigma_r = '0.0355045 0.0515873'
	chi = '1.0000e+00 3.1246e-07'
	sigma_s = '2.0000e-06 1.9483e-04; 0.0291557 0.       '
[]
[./gcu_MNR358]
	block = 'MNR358'
	type = CorrectedNuclearMaterial
	sph_factors = '1.10341 1.38686'
 	nu_sigma_f = '0.0021501 0.0752029'
	diffusivity = '1.59763  0.246127'
	sigma_r = '0.0319282 0.0565039'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.23768e-04; 0.0281281 0.       '
[]
[./gcu_MNR373]
	block = 'MNR373'
	type = CorrectedNuclearMaterial
	sph_factors = '1.07719 1.55381'
 	nu_sigma_f = '0.00238551 0.082834  '
	diffusivity = '1.58858 0.24609'
	sigma_r = '0.0320635 0.0599698'
	chi = '1. 0.'
	sigma_s = '4.00000e-06 2.14666e-04; 0.0282074 0.       '
[]
[./gcu_MNR365]
	block = 'MNR365'
	type = CorrectedNuclearMaterial
	sph_factors = '0.971615 1.81529 '
 	nu_sigma_f = '0.00225621 0.0782449 '
	diffusivity = '1.61547  0.243102'
	sigma_r = '0.0315348 0.0576525'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 1.97197e-04; 0.0277659 0.       '
[]
[./gcu_A9plug]
	block = 'A9plug'
	type = CorrectedNuclearMaterial
	sph_factors = '0.967211 0.540666'
 	nu_sigma_f = '0. 0.'
	diffusivity = '1.421    0.149952'
	sigma_r = '0.0675256 0.0192032'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 5.30296e-05; 0.0669533 0.       '
[]
[./gcu_A8graph]
	block = 'A8graph'
	type = CorrectedNuclearMaterial
	sph_factors = '0.847713 0.670169'
 	nu_sigma_f = '0. 0.'
	diffusivity = '1.29183  0.331869'
	sigma_r = '0.022291 0.007629'
	chi = '0. 0.'
	sigma_s = '0.0000e+00 5.5405e-05; 0.0220564 0.       '
[]
[./gcu_A7rifl]
	block = 'A7rifl'
	type = CorrectedNuclearMaterial
	sph_factors = '0.810184 0.896251'
 	nu_sigma_f = '0. 0.'
	diffusivity = '2.28094  0.266237'
	sigma_r = '0.0317614 0.0118489'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 8.27447e-05; 0.0314582 0.       '
[]
[./gcu_MNR397]
	block = 'MNR397'
	type = CorrectedNuclearMaterial
	sph_factors = '1.04371 1.0076 '
 	nu_sigma_f = '0.00335453 0.112665  '
	diffusivity = '1.64817  0.246715'
	sigma_r = '0.0302959 0.0726476'
	chi = '1. 0.'
	sigma_s = '6.00000e-06 2.15417e-04; 0.0264384 0.       '
[]
[./gcu_MNR376]
	block = 'MNR376'
	type = CorrectedNuclearMaterial
	sph_factors = '1.05988 1.40222'
 	nu_sigma_f = '0.00244656 0.0851968 '
	diffusivity = '1.62461  0.246474'
	sigma_r = '0.0311066 0.0609272'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.10077e-04; 0.0273299 0.       '
[]
[./gcu_MNR366]
	block = 'MNR366'
	type = CorrectedNuclearMaterial
	sph_factors = '1.01734 1.59666'
 	nu_sigma_f = '0.00203642 0.0711923 '
	diffusivity = '1.60992  0.244045'
	sigma_r = '0.0320318 0.0547215'
	chi = '1. 0.'
	sigma_s = '4.00000e-06 1.88973e-04; 0.0282599 0.       '
[]
[./gcu_MNR362]
	block = 'MNR362'
	type = CorrectedNuclearMaterial
	sph_factors = '1.02113 1.59671'
 	nu_sigma_f = '0.00194218 0.0673341 '
	diffusivity = '1.59204 0.24246'
	sigma_r = '0.0324494 0.053008 '
	chi = '1. 0.'
	sigma_s = '6.00000e-06 1.74247e-04; 0.0286404 0.       '
[]
[./gcu_010500]
	block = 'u10500'
	type = CorrectedNuclearMaterial
	sph_factors = '0.899684 2.06289 '
 	nu_sigma_f = '0. 0.'
	diffusivity = '0.897816 0.304697'
	sigma_r = '0.0176517  0.00587595'
	chi = '0. 0.'
	sigma_s = '0.002862   0.00012663; 0.0165137 0.       '
[]
[./gcu_MNR369]
	block = 'MNR369'
	type = CorrectedNuclearMaterial
	sph_factors = '0.92654 1.88207'
 	nu_sigma_f = '0.00225419 0.0778666 '
	diffusivity = '1.61843  0.240293'
	sigma_r = '0.0315633 0.05753  '
	chi = '1. 0.'
	sigma_s = '5.00000e-06 1.59174e-04; 0.0277957 0.       '
[]
[]
