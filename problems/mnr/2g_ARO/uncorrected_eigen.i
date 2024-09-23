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
	albedo_matrix = '3.21304E-01 8.26961E-06; 2.05099E-01  7.76636E-01'
    execute_on = 'LINEAR'
    boundary = 'north south west east bottom top'
[]
[./alb_1]
    type = AlbedoCorrectedArraySideIntegralPostprocessor
    variable = flux
	albedo_matrix = '3.21304E-01 8.26961E-06; 2.05099E-01  7.76636E-01'
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
	albedo_matrix = '3.21304E-01 8.26961E-06; 2.05099E-01  7.76636E-01'
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
	diffusivity = '1.41847  0.149897'
	sigma_r = '0.0684618 0.0191758'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 4.99734e-05; 0.0678735 0.       '
[]
[./mat_gcu_F8graph]
	block = 'F8graph'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.29911  0.331059'
	sigma_r = '0.0222211  0.00762999'
	chi = '0. 0.'
	sigma_s = '0.0000e+00 5.4255e-05; 0.0219892 0.       '
[]
[./mat_gcu_F7rifl]
	block = 'F7rifl'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '2.381    0.276844'
	sigma_r = '0.0303853 0.0113987'
	chi = '0. 0.'
	sigma_s = '0.000e+00 8.074e-05; 0.0300923 0.       '
[]
[./mat_gcu_MNR396]
	block = 'MNR396'
	type = NuclearMaterial
	nu_sigma_f = '0.00335562 0.112849  '
	diffusivity = '1.6505   0.246732'
	sigma_r = '0.0304986 0.0728244'
	chi = '1. 0.'
	sigma_s = '6.00000e-06 2.05287e-04; 0.0266551 0.       '
[]
[./mat_gcu_MNR375]
	block = 'MNR375'
	type = NuclearMaterial
	nu_sigma_f = '0.00246856 0.0854071 '
	diffusivity = '1.62013  0.245513'
	sigma_r = '0.0314077 0.0609198'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.12683e-04; 0.0276139 0.       '
[]
[./mat_gcu_MNR374]
	block = 'MNR374'
	type = NuclearMaterial
	nu_sigma_f = '0.00228175 0.079734  '
	diffusivity = '1.61842  0.245194'
	sigma_r = '0.0318995 0.0586521'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 1.97684e-04; 0.0281022 0.       '
[]
[./mat_gcu_MNR372]
	block = 'MNR372'
	type = NuclearMaterial
	nu_sigma_f = '0.00246052 0.0845809 '
	diffusivity = '1.61887  0.245688'
	sigma_r = '0.0314993 0.0606159'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.12133e-04; 0.0276889 0.       '
[]
[./mat_gcu_MNR382]
	block = 'MNR382'
	type = NuclearMaterial
	nu_sigma_f = '0.00293543 0.099272  '
	diffusivity = '1.62782  0.247267'
	sigma_r = '0.0312331 0.0670489'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.17983e-04; 0.0273797 0.       '
[]
[./mat_gcu_MNR389]
	block = 'MNR389'
	type = NuclearMaterial
	nu_sigma_f = '0.00302616 0.101676  '
	diffusivity = '1.64597  0.245158'
	sigma_r = '0.0306159 0.067912 '
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.04505e-04; 0.0267831 0.       '
[]
[./mat_gcu_E9rifl]
	block = 'E9rifl'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '2.28712  0.266612'
	sigma_r = '0.0386348 0.0116441'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 3.58626e-05; 0.0382637 0.       '
[]
[./mat_gcu_E8graph]
	block = 'E8graph'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.30509  0.334031'
	sigma_r = '0.0206553  0.00764484'
	chi = '0. 0.'
	sigma_s = '0.0000e+00 7.1107e-05; 0.0204382 0.       '
[]
[./mat_gcu_MNR394]
	block = 'MNR394'
	type = NuclearMaterial
	nu_sigma_f = '0.00330707 0.111233  '
	diffusivity = '1.65061  0.245598'
	sigma_r = '0.0305351 0.0723319'
	chi = '1. 0.'
	sigma_s = '6.00000e-06 1.95863e-04; 0.0267095 0.       '
[]
[./mat_gcu_MNRC77]
	block = 'MNRC77'
	type = NuclearMaterial
	nu_sigma_f = '0.0011663 0.0375178'
	diffusivity = '1.57396  0.230952'
	sigma_r = '0.0340712 0.037989 '
	chi = '1. 0.'
	sigma_s = '3.00000e-06 1.74674e-04; 0.0315233 0.       '
[]
[./mat_gcu_MNR377]
	block = 'MNR377'
	type = NuclearMaterial
	nu_sigma_f = '0.0026922 0.0928696'
	diffusivity = '1.6147   0.246852'
	sigma_r = '0.0312533 0.0643722'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.41359e-04; 0.0274344 0.       '
[]
[./mat_gcu_MNRC76]
	block = 'MNRC76'
	type = NuclearMaterial
	nu_sigma_f = '0.00111294 0.0356478 '
	diffusivity = '1.5639   0.230995'
	sigma_r = '0.0344786 0.0371985'
	chi = '1. 0.'
	sigma_s = '3.00000e-06 1.79102e-04; 0.0319104 0.       '
[]
[./mat_gcu_MNR395]
	block = 'MNR395'
	type = NuclearMaterial
	nu_sigma_f = '0.00339096 0.112261  '
	diffusivity = '1.62353  0.249414'
	sigma_r = '0.0308162 0.0726927'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.65676e-04; 0.0269016 0.       '
[]
[./mat_gcu_MNRC80]
	block = 'MNRC80'
	type = NuclearMaterial
	nu_sigma_f = '0.00155556 0.0482805 '
	diffusivity = '1.55278  0.236862'
	sigma_r = '0.0326854 0.0452342'
	chi = '1. 0.'
	sigma_s = '3.00000e-06 2.07032e-04; 0.0302193 0.       '
[]
[./mat_gcu_MNR387]
	block = 'MNR387'
	type = NuclearMaterial
	nu_sigma_f = '0.00298374 0.100374  '
	diffusivity = '1.62943 0.24579'
	sigma_r = '0.0308353 0.0673807'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.30987e-04; 0.0270229 0.       '
[]
[./mat_gcu_D9graph]
	block = 'D9graph'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.29444  0.329314'
	sigma_r = '0.0246544  0.00772014'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 4.47413e-05; 0.0243974 0.       '
[]
[./mat_gcu_D8graph]
	block = 'D8graph'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.27596  0.332337'
	sigma_r = '0.0221609  0.00767917'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 7.01469e-05; 0.0219392 0.       '
[]
[./mat_gcu_D7rifl]
	block = 'D7rifl'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '2.35472  0.279043'
	sigma_r = '0.0300827 0.0113706'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 9.97697e-05; 0.0297978 0.       '
[]
[./mat_gcu_MNR392]
	block = 'MNR392'
	type = NuclearMaterial
	nu_sigma_f = '0.00321682 0.108312  '
	diffusivity = '1.63237  0.247129'
	sigma_r = '0.0308073 0.0713162'
	chi = '1. 0.'
	sigma_s = '5.0000e-06 2.3385e-04; 0.0269507 0.       '
[]
[./mat_gcu_MNR381]
	block = 'MNR381'
	type = NuclearMaterial
	nu_sigma_f = '0.00270573 0.093304  '
	diffusivity = '1.62055  0.247254'
	sigma_r = '0.0313505 0.064793 '
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.20022e-04; 0.0275301 0.       '
[]
[./mat_gcu_MNR391]
	block = 'MNR391'
	type = NuclearMaterial
	nu_sigma_f = '0.00309751 0.10457   '
	diffusivity = '1.6195   0.248869'
	sigma_r = '0.0311022 0.0697608'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.49323e-04; 0.0272249 0.       '
[]
[./mat_gcu_MNR388]
	block = 'MNR388'
	type = NuclearMaterial
	nu_sigma_f = '0.00304615 0.102219  '
	diffusivity = '1.61239  0.248882'
	sigma_r = '0.0312272 0.068598 '
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.63042e-04; 0.0273529 0.       '
[]
[./mat_gcu_MNR378]
	block = 'MNR378'
	type = NuclearMaterial
	nu_sigma_f = '0.00268827 0.0928323 '
	diffusivity = '1.60931  0.247773'
	sigma_r = '0.0317021 0.0644599'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.33154e-04; 0.0278522 0.       '
[]
[./mat_gcu_MNR390]
	block = 'MNR390'
	type = NuclearMaterial
	nu_sigma_f = '0.00311625 0.103584  '
	diffusivity = '1.63086  0.245454'
	sigma_r = '0.030873  0.0689413'
	chi = '1. 0.'
	sigma_s = '6.00000e-06 2.32125e-04; 0.0270081 0.       '
[]
[./mat_gcu_C9rifl]
	block = 'C9rifl'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '2.26733  0.266534'
	sigma_r = '0.0389683 0.0116049'
	chi = '0. 0.'
	sigma_s = '0.0000e+00 3.9465e-05; 0.0386192 0.       '
[]
[./mat_gcu_C8graph]
	block = 'C8graph'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.29425  0.334354'
	sigma_r = '0.0207655  0.00766838'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 7.48694e-05; 0.0205543 0.       '
[]
[./mat_gcu_MNR379]
	block = 'MNR379'
	type = NuclearMaterial
	nu_sigma_f = '0.00252786 0.0875971 '
	diffusivity = '1.61373  0.244739'
	sigma_r = '0.0315937 0.0619798'
	chi = '1. 0.'
	sigma_s = '4.00000e-06 2.07412e-04; 0.0277745 0.       '
[]
[./mat_gcu_MNR393]
	block = 'MNR393'
	type = NuclearMaterial
	nu_sigma_f = '0.00328772 0.110578  '
	diffusivity = '1.63852  0.244862'
	sigma_r = '0.0306012 0.0723551'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.29014e-04; 0.0267471 0.       '
[]
[./mat_gcu_010400]
	block = 'u10400'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.42721  0.171565'
	sigma_r = '0.0514276 0.0181526'
	chi = '0. 0.'
	sigma_s = '0.         0.00013649; 0.0509456 0.       '
[]
[./mat_gcu_MNR384]
	block = 'MNR384'
	type = NuclearMaterial
	nu_sigma_f = '0.00302161 0.103229  '
	diffusivity = '1.62749  0.245494'
	sigma_r = '0.031063  0.0692785'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.26208e-04; 0.0272209 0.       '
[]
[./mat_gcu_MNR383]
	block = 'MNR383'
	type = NuclearMaterial
	nu_sigma_f = '0.00270592 0.0926291 '
	diffusivity = '1.61004  0.247104'
	sigma_r = '0.0314878 0.0643669'
	chi = '1. 0.'
	sigma_s = '6.00000e-06 2.46028e-04; 0.0276378 0.       '
[]
[./mat_gcu_MNRC74]
	block = 'MNRC74'
	type = NuclearMaterial
	nu_sigma_f = '0.00094515 0.0302704 '
	diffusivity = '1.55556  0.230217'
	sigma_r = '0.0350212 0.0347041'
	chi = '1. 0.'
	sigma_s = '2.00000e-06 1.66949e-04; 0.0324566 0.       '
[]
[./mat_gcu_MNR361]
	block = 'MNR361'
	type = NuclearMaterial
	nu_sigma_f = '0.00204763 0.0713211 '
	diffusivity = '1.61123  0.241825'
	sigma_r = '0.0318929 0.0546565'
	chi = '1. 0.'
	sigma_s = '4.00000e-06 1.92781e-04; 0.0281254 0.       '
[]
[./mat_gcu_B9plug]
	block = 'B9plug'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.37705  0.150535'
	sigma_r = '0.0696799 0.0192229'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 5.83704e-05; 0.0691137 0.       '
[]
[./mat_gcu_B8graph]
	block = 'B8graph'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.30108  0.334486'
	sigma_r = '0.0204733  0.00762536'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 7.68854e-05; 0.0202607 0.       '
[]
[./mat_gcu_MNR398]
	block = 'MNR398'
	type = NuclearMaterial
	nu_sigma_f = '0.00337631 0.112793  '
	diffusivity = '1.63835 0.24696'
	sigma_r = '0.0305043 0.072582 '
	chi = '1. 0.'
	sigma_s = '6.00000e-06 2.23589e-04; 0.0266355 0.       '
[]
[./mat_gcu_MNRC79]
	block = 'MNRC79'
	type = NuclearMaterial
	nu_sigma_f = '0.00154043 0.0490619 '
	diffusivity = '1.58926  0.231966'
	sigma_r = '0.0332367 0.0431974'
	chi = '1. 0.'
	sigma_s = '2.00000e-06 1.85176e-04; 0.0306647 0.       '
[]
[./mat_gcu_MNR385]
	block = 'MNR385'
	type = NuclearMaterial
	nu_sigma_f = '0.00301307 0.10302   '
	diffusivity = '1.63685  0.247778'
	sigma_r = '0.0306862 0.0690356'
	chi = '1. 0.'
	sigma_s = '6.00000e-06 2.18563e-04; 0.0268707 0.       '
[]
[./mat_gcu_MNRC78]
	block = 'MNRC78'
	type = NuclearMaterial
	nu_sigma_f = '0.00122297 0.0394724 '
	diffusivity = '1.57438 0.2312 '
	sigma_r = '0.0341576 0.0389722'
	chi = '1. 0.'
	sigma_s = '2.00000e-06 1.71735e-04; 0.0315866 0.       '
[]
[./mat_gcu_MNR358]
	block = 'MNR358'
	type = NuclearMaterial
	nu_sigma_f = '0.00216394 0.0754683 '
	diffusivity = '1.5968   0.244971'
	sigma_r = '0.0320567 0.0566451'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.17347e-04; 0.0282653 0.       '
[]
[./mat_gcu_MNR373]
	block = 'MNR373'
	type = NuclearMaterial
	nu_sigma_f = '0.00240385 0.0834491 '
	diffusivity = '1.59153  0.245945'
	sigma_r = '0.0322258 0.0603167'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.08449e-04; 0.0283551 0.       '
[]
[./mat_gcu_MNR365]
	block = 'MNR365'
	type = NuclearMaterial
	nu_sigma_f = '0.00227494 0.0784127 '
	diffusivity = '1.61328  0.242449'
	sigma_r = '0.0317879 0.0577726'
	chi = '1. 0.'
	sigma_s = '5.0000e-06 1.9642e-04; 0.0279938 0.       '
[]
[./mat_gcu_A9plug]
	block = 'A9plug'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.42147  0.150016'
	sigma_r = '0.0675813 0.019221 '
	chi = '0. 0.'
	sigma_s = '0.00000e+00 5.34305e-05; 0.0669912 0.       '
[]
[./mat_gcu_A8graph]
	block = 'A8graph'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.29146  0.331261'
	sigma_r = '0.0224683 0.0076905'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 5.86624e-05; 0.0222336 0.       '
[]
[./mat_gcu_A7rifl]
	block = 'A7rifl'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '2.36213  0.276641'
	sigma_r = '0.0306424 0.0114113'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 8.26377e-05; 0.0303574 0.       '
[]
[./mat_gcu_MNR397]
	block = 'MNR397'
	type = NuclearMaterial
	nu_sigma_f = '0.0033745 0.113008 '
	diffusivity = '1.64843  0.246723'
	sigma_r = '0.0305037 0.0728589'
	chi = '1. 0.'
	sigma_s = '6.00000e-06 2.07316e-04; 0.026631 0.      '
[]
[./mat_gcu_MNR376]
	block = 'MNR376'
	type = NuclearMaterial
	nu_sigma_f = '0.00247773 0.0854133 '
	diffusivity = '1.62206 0.24556'
	sigma_r = '0.0313296 0.0609526'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.06342e-04; 0.0275184 0.       '
[]
[./mat_gcu_MNR366]
	block = 'MNR366'
	type = NuclearMaterial
	nu_sigma_f = '0.00206514 0.0720942 '
	diffusivity = '1.61194  0.243895'
	sigma_r = '0.0322072 0.0551955'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 1.80699e-04; 0.0284103 0.       '
[]
[./mat_gcu_MNR362]
	block = 'MNR362'
	type = NuclearMaterial
	nu_sigma_f = '0.00195753 0.0676694 '
	diffusivity = '1.58972  0.241739'
	sigma_r = '0.0327187 0.0531347'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 1.77732e-04; 0.0288892 0.       '
[]
[./mat_gcu_010500]
	block = 'u10500'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '0.896988 0.30337 '
	sigma_r = '0.0177604 0.0060334'
	chi = '0. 0.'
	sigma_s = '0.002864   0.00012716; 0.0166129 0.       '
[]
[./mat_gcu_MNR369]
	block = 'MNR369'
	type = NuclearMaterial
	nu_sigma_f = '0.00228311 0.078585  '
	diffusivity = '1.61418  0.239556'
	sigma_r = '0.0318714 0.0579014'
	chi = '1. 0.'
	sigma_s = '6.00000e-06 1.60082e-04; 0.0280657 0.       '
[]
[]
