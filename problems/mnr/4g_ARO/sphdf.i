[Mesh]
file = mnr_active.msh
[]


[Preconditioning]
  [./smp]
    type = SMP
    full = true
  []
[]

[Outputs]
exodus = true
[]


[Executioner]
type = Steady
solve_type = 'PJFNK'	


petsc_options = '-ksp_monitor_singular_value'
petsc_options_iname = '-ksp_type'
petsc_options_value = 'gmres'


[]


[Variables]
[./flux]
    type = ArrayMooseVariable
    components = 4
[../]
[]

[Postprocessors]
[./alb_0]
    type = AlbedoCorrectedArraySideIntegralPostprocessor
    variable = flux
    component = 0  
	albedo_matrix = '8.82315E-02 0.00000E+00 0.00000E+00 0.00000E+00; 1.37907E-01 1.70801E-01 0.00000E+00 0.00000E+00; 8.62056E-02 2.32797E-01 2.39385E-01 8.26961E-06; 1.02634E-01 1.71553E-01 3.84669E-01 7.76636E-01'
    execute_on = 'LINEAR'
    boundary = 'north south west east bottom top'
[]
[./alb_1]
    type = AlbedoCorrectedArraySideIntegralPostprocessor
    variable = flux
	albedo_matrix = '8.82315E-02 0.00000E+00 0.00000E+00 0.00000E+00; 1.37907E-01 1.70801E-01 0.00000E+00 0.00000E+00; 8.62056E-02 2.32797E-01 2.39385E-01 8.26961E-06; 1.02634E-01 1.71553E-01 3.84669E-01 7.76636E-01'
    component = 1
    execute_on = 'LINEAR'
    boundary = 'north south west east bottom top' 
[]
[./alb_2]
    type = AlbedoCorrectedArraySideIntegralPostprocessor
    variable = flux
	albedo_matrix = '8.82315E-02 0.00000E+00 0.00000E+00 0.00000E+00; 1.37907E-01 1.70801E-01 0.00000E+00 0.00000E+00; 8.62056E-02 2.32797E-01 2.39385E-01 8.26961E-06; 1.02634E-01 1.71553E-01 3.84669E-01 7.76636E-01'
    component = 2
    execute_on = 'LINEAR'
    boundary = 'north south west east bottom top' 
[]
[./alb_3]
    type = AlbedoCorrectedArraySideIntegralPostprocessor
    variable = flux
	albedo_matrix = '8.82315E-02 0.00000E+00 0.00000E+00 0.00000E+00; 1.37907E-01 1.70801E-01 0.00000E+00 0.00000E+00; 8.62056E-02 2.32797E-01 2.39385E-01 8.26961E-06; 1.02634E-01 1.71553E-01 3.84669E-01 7.76636E-01'
    component = 3
    execute_on = 'LINEAR'
    boundary = 'north south west east bottom top' 
[]
[]


[BCs]
[./albedo]
	variable = flux
	type = UoL2ArrayAlbedoBC
	surface_integrators = 'alb_0 alb_1 alb_2 alb_3'
	boundary = 'north south west east bottom top'
	normalization_factors_uo = total
	albedo_matrix = '8.82315E-02 0.00000E+00 0.00000E+00 0.00000E+00; 1.37907E-01 1.70801E-01 0.00000E+00 0.00000E+00; 8.62056E-02 2.32797E-01 2.39385E-01 8.26961E-06; 1.02634E-01 1.71553E-01 3.84669E-01 7.76636E-01'
	ref_current_integral = '552.54353262 334.27134661 165.05707018 -25.1318157' 
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
	ref_nu_sigma_f = '0. 0. 0. 0.'
	ref_diffusivity = '3.10795  0.993447 0.55377  0.149897'
	ref_sigma_r = '0.104667  0.166699  0.166309  0.0191758'
	chi = '0. 0. 0. 0.'
	ref_k = 1
	ref_sigma_s = '0. 0. 0. 0.; 0.10351 0.      0.      0.     ; 6.74248e-04 1.66671e-01 0.00000e+00 4.99734e-05; 0.00000e+00 1.73128e-05 1.65222e-01 0.00000e+00'
	sph_factors_uo = uo_gcu_F9plug
	normalization_factors_uo = total

[]
[./mat_gcu_F8graph]
	block = 'F8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0. 0. 0.'
	ref_diffusivity = '2.42253  1.02658  0.758941 0.331059'
	ref_sigma_r = '0.048131   0.0574559  0.0557432  0.00762999'
	chi = '0. 0. 0. 0.'
	ref_k = 1
	ref_sigma_s = '0. 0. 0. 0.; 0.0476966 0.        0.        0.       ; 2.10409e-04 5.74330e-02 0.00000e+00 5.42550e-05; 0.00000e+00 4.05636e-06 5.53284e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_F8graph
	normalization_factors_uo = total

[]
[./mat_gcu_F7rifl]
	block = 'F7rifl'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0. 0. 0.'
	ref_diffusivity = '4.87326  1.6867   0.983024 0.276844'
	ref_sigma_r = '0.0618265 0.0869585 0.0828776 0.0113987'
	chi = '0. 0. 0. 0.'
	ref_k = 1
	ref_sigma_s = '1.e-07 0.e+00 0.e+00 0.e+00; 0.0612255 0.        0.        0.       ; 3.79425e-04 8.69299e-02 0.00000e+00 8.07400e-05; 1.46136e-07 8.52274e-06 8.22754e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_F7rifl
	normalization_factors_uo = total

[]
[./mat_gcu_MNR396]
	block = 'MNR396'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00130586 0.00060837 0.00897822 0.112849  '
	ref_diffusivity = '2.90306  1.14268  0.7605   0.246732'
	ref_sigma_r = '0.079321  0.0916461 0.100451  0.0728244'
	chi = '7.61563e-01 2.38267e-01 1.70191e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0780316 0.        0.        0.       ; 0.00044542 0.0911234  0.         0.00020529; 5.61386e-08 8.91031e-06 8.91993e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR396
	normalization_factors_uo = total

[]
[./mat_gcu_MNR375]
	block = 'MNR375'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00111191 0.00041824 0.00626836 0.0854071 '
	ref_diffusivity = '2.89543  1.13884  0.75881  0.245513'
	ref_sigma_r = '0.0792405 0.093518  0.0999346 0.0609198'
	chi = '7.62123e-01 2.37698e-01 1.79306e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0780033 0.        0.        0.       ; 0.00044589 0.093083   0.         0.00021268; 4.67894e-08 1.04371e-05 8.90561e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR375
	normalization_factors_uo = total

[]
[./mat_gcu_MNR374]
	block = 'MNR374'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00108775 0.00037665 0.00569173 0.079734  '
	ref_diffusivity = '2.90094  1.13905  0.758608 0.245194'
	ref_sigma_r = '0.0794429 0.0936124 0.100599  0.0586521'
	chi = '7.62143e-01 2.37688e-01 1.69444e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '3.e-06 0.e+00 0.e+00 0.e+00; 0.0782093 0.        0.        0.       ; 0.00045733 0.0931933  0.         0.00019768; 0.00000e+00 1.03568e-05 8.97752e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR374
	normalization_factors_uo = total

[]
[./mat_gcu_MNR372]
	block = 'MNR372'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00110679 0.00041284 0.0062322  0.0845809 '
	ref_diffusivity = '2.90141  1.13901  0.759465 0.245688'
	ref_sigma_r = '0.079313  0.0934867 0.0998019 0.0606159'
	chi = '7.62104e-01 2.37722e-01 1.73535e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0780766 0.        0.        0.       ; 0.00045092 0.0930575  0.         0.00021213; 4.27434e-08 9.72637e-06 8.89049e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR372
	normalization_factors_uo = total

[]
[./mat_gcu_MNR382]
	block = 'MNR382'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00120117 0.00050915 0.0076322  0.099272  '
	ref_diffusivity = '2.89921  1.13951  0.759557 0.247267'
	ref_sigma_r = '0.0795811 0.0929726 0.100196  0.0670489'
	chi = '7.61891e-01 2.37936e-01 1.73360e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0783107 0.        0.        0.       ; 0.00045322 0.0924965  0.         0.00021798; 0.00000e+00 9.59553e-06 8.91099e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR382
	normalization_factors_uo = total

[]
[./mat_gcu_MNR389]
	block = 'MNR389'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00122911 0.00053748 0.00798176 0.101676  '
	ref_diffusivity = '2.9077   1.143    0.761197 0.245158'
	ref_sigma_r = '0.0789307 0.0919698 0.0999349 0.067912 '
	chi = '7.61982e-01 2.37847e-01 1.70853e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.077662 0.       0.       0.      ; 0.00044903 0.0914849  0.         0.00020451; 7.43137e-08 9.79785e-06 8.87454e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR389
	normalization_factors_uo = total

[]
[./mat_gcu_E9rifl]
	block = 'E9rifl'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0. 0. 0.'
	ref_diffusivity = '4.97631  1.66027  0.970643 0.266612'
	ref_sigma_r = '0.0606241 0.0928958 0.0930418 0.0116441'
	chi = '0. 0. 0. 0.'
	ref_k = 1
	ref_sigma_s = '9.e-07 0.e+00 0.e+00 0.e+00; 0.0599509 0.        0.        0.       ; 3.87296e-04 9.28848e-02 0.00000e+00 3.58626e-05; 0.00000e+00 5.66558e-06 9.23397e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_E9rifl
	normalization_factors_uo = total

[]
[./mat_gcu_E8graph]
	block = 'E8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0. 0. 0.'
	ref_diffusivity = '2.39808  1.02818  0.759529 0.334031'
	ref_sigma_r = '0.049531   0.0563737  0.0541535  0.00764484'
	chi = '0. 0. 0. 0.'
	ref_k = 1
	ref_sigma_s = '0. 0. 0. 0.; 0.0490859 0.        0.        0.       ; 2.41336e-04 5.63455e-02 0.00000e+00 7.11070e-05; 0.00000e+00 6.64218e-06 5.37503e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_E8graph
	normalization_factors_uo = total

[]
[./mat_gcu_MNR394]
	block = 'MNR394'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00130519 0.00060067 0.00884364 0.111233  '
	ref_diffusivity = '2.89928  1.14104  0.759586 0.245598'
	ref_sigma_r = '0.0797241 0.0916465 0.100821  0.0723319'
	chi = '7.61601e-01 2.38216e-01 1.82676e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '5.e-06 0.e+00 0.e+00 0.e+00; 0.0784236 0.        0.        0.       ; 0.0004502  0.0911237  0.         0.00019586; 0.00000e+00 1.12638e-05 8.96079e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR394
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC77]
	block = 'MNRC77'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00057097 0.00018517 0.00273996 0.0375178 '
	ref_diffusivity = '2.91613  1.13523  0.761685 0.230952'
	ref_sigma_r = '0.0792104 0.0979696 0.100524  0.037989 '
	chi = '7.62735e-01 2.37092e-01 1.73385e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '2.e-06 0.e+00 0.e+00 0.e+00; 0.0781915 0.        0.        0.       ; 0.00045047 0.097698   0.         0.00017467; 4.72516e-08 1.20733e-05 9.37553e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNRC77
	normalization_factors_uo = total

[]
[./mat_gcu_MNR377]
	block = 'MNR377'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00113322 0.00045895 0.00691985 0.0928696 '
	ref_diffusivity = '2.89492  1.13977  0.760385 0.246852'
	ref_sigma_r = '0.079381  0.0931448 0.0993015 0.0643722'
	chi = '7.61679e-01 2.38159e-01 1.61999e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '3.e-06 0.e+00 0.e+00 0.e+00; 0.0781523 0.        0.        0.       ; 0.00044706 0.0926869  0.         0.00024136; 0.00000e+00 9.41776e-06 8.83699e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR377
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC76]
	block = 'MNRC76'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00055972 0.00017488 0.00257753 0.0356478 '
	ref_diffusivity = '2.91153  1.13488  0.762557 0.230995'
	ref_sigma_r = '0.0793255 0.0984703 0.100511  0.0371985'
	chi = '7.62169e-01 2.37656e-01 1.75576e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '2.e-06 0.e+00 0.e+00 0.e+00; 0.0783097 0.        0.        0.       ; 0.00044948 0.0982024  0.         0.0001791 ; 0.00000e+00 1.06984e-05 9.37532e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNRC76
	normalization_factors_uo = total

[]
[./mat_gcu_MNR395]
	block = 'MNR395'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00125731 0.00059949 0.00898941 0.112261  '
	ref_diffusivity = '2.89382  1.14162  0.761367 0.249414'
	ref_sigma_r = '0.0795748 0.0927201 0.0991962 0.0726927'
	chi = '7.61856e-01 2.37959e-01 1.85024e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0782955 0.        0.        0.       ; 0.00044694 0.0922117  0.         0.00026568; 2.71440e-08 9.96468e-06 8.79175e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR395
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC80]
	block = 'MNRC80'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00063986 0.00025999 0.00377362 0.0482805 '
	ref_diffusivity = '2.86159  1.13287  0.751075 0.236862'
	ref_sigma_r = '0.077979  0.0944483 0.0968253 0.0452342'
	chi = '7.61700e-01 2.38132e-01 1.67788e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '3.e-06 0.e+00 0.e+00 0.e+00; 0.0769286 0.        0.        0.       ; 0.00043608 0.094154   0.         0.00020703; 0.00000e+00 9.91114e-06 9.03367e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNRC80
	normalization_factors_uo = total

[]
[./mat_gcu_MNR387]
	block = 'MNR387'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00120073 0.00052558 0.00781331 0.100374  '
	ref_diffusivity = '2.89684  1.14251  0.761396 0.24579 '
	ref_sigma_r = '0.0791719 0.0922958 0.099489  0.0673807'
	chi = '7.61645e-01 2.38179e-01 1.75632e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0779259 0.        0.        0.       ; 0.00044413 0.0918176  0.         0.00023099; 0.00000e+00 1.06290e-05 8.84591e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR387
	normalization_factors_uo = total

[]
[./mat_gcu_D9graph]
	block = 'D9graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0. 0. 0.'
	ref_diffusivity = '2.46887  1.02377  0.759361 0.329314'
	ref_sigma_r = '0.0474484  0.0592347  0.0585762  0.00772014'
	chi = '0. 0. 0. 0.'
	ref_k = 1
	ref_sigma_s = '0. 0. 0. 0.; 0.0469717 0.        0.        0.       ; 2.31086e-04 5.92017e-02 0.00000e+00 4.47413e-05; 0.00000e+00 1.30948e-05 5.81332e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_D9graph
	normalization_factors_uo = total

[]
[./mat_gcu_D8graph]
	block = 'D8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0. 0. 0.'
	ref_diffusivity = '2.39588  1.02542  0.758976 0.332337'
	ref_sigma_r = '0.0492339  0.0573134  0.0550843  0.00767917'
	chi = '0. 0. 0. 0.'
	ref_k = 1
	ref_sigma_s = '0. 0. 0. 0.; 0.0487967 0.        0.        0.       ; 2.30543e-04 5.72919e-02 0.00000e+00 7.01469e-05; 0.00000e+00 6.43205e-06 5.46787e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_D8graph
	normalization_factors_uo = total

[]
[./mat_gcu_D7rifl]
	block = 'D7rifl'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0. 0. 0.'
	ref_diffusivity = '4.83452  1.68523  0.981495 0.279043'
	ref_sigma_r = '0.0625159 0.0870217 0.082119  0.0113706'
	chi = '0. 0. 0. 0.'
	ref_k = 1
	ref_sigma_s = '4.e-07 0.e+00 0.e+00 0.e+00; 0.0619287 0.        0.        0.       ; 3.78423e-04 8.70016e-02 0.00000e+00 9.97697e-05; 0.00000e+00 8.35242e-06 8.15189e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_D7rifl
	normalization_factors_uo = total

[]
[./mat_gcu_MNR392]
	block = 'MNR392'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00125234 0.00057054 0.00849959 0.108312  '
	ref_diffusivity = '2.89763  1.14213  0.760891 0.247129'
	ref_sigma_r = '0.0793437 0.0923634 0.0997706 0.0713162'
	chi = '7.62109e-01 2.37715e-01 1.76207e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0780738 0.        0.        0.       ; 0.00043688 0.0918498  0.         0.00023385; 0.00000e+00 1.00902e-05 8.86268e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR392
	normalization_factors_uo = total

[]
[./mat_gcu_MNR381]
	block = 'MNR381'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00115616 0.00046341 0.0069484  0.093304  '
	ref_diffusivity = '2.89806  1.13812  0.759323 0.247254'
	ref_sigma_r = '0.0795642 0.0934315 0.0999309 0.064793 '
	chi = '7.61948e-01 2.37883e-01 1.68256e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0783185 0.        0.        0.       ; 0.00044976 0.0929768  0.         0.00022002; 2.71253e-08 1.05585e-05 8.89734e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR381
	normalization_factors_uo = total

[]
[./mat_gcu_MNR391]
	block = 'MNR391'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00121376 0.00054092 0.00810252 0.10457   '
	ref_diffusivity = '2.89424  1.14005  0.759599 0.248869'
	ref_sigma_r = '0.0796225 0.0931082 0.0995492 0.0697608'
	chi = '7.61566e-01 2.38272e-01 1.62357e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '5.e-06 0.e+00 0.e+00 0.e+00; 0.0783517 0.        0.        0.       ; 0.00045461 0.0926099  0.         0.00024932; 2.33840e-08 9.65291e-06 8.84272e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR391
	normalization_factors_uo = total

[]
[./mat_gcu_MNR388]
	block = 'MNR388'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00119142 0.00052819 0.00792211 0.102219  '
	ref_diffusivity = '2.89234  1.13942  0.760187 0.248882'
	ref_sigma_r = '0.0795959 0.0934271 0.0991947 0.068598 '
	chi = '7.61761e-01 2.38055e-01 1.84161e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.078347 0.       0.       0.      ; 0.00044542 0.0929433  0.         0.00026304; 7.30474e-08 9.87999e-06 8.81324e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR388
	normalization_factors_uo = total

[]
[./mat_gcu_MNR378]
	block = 'MNR378'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00114085 0.00045452 0.00685271 0.0928323 '
	ref_diffusivity = '2.89304  1.13848  0.759549 0.247773'
	ref_sigma_r = '0.079741  0.0937788 0.099895  0.0644599'
	chi = '7.62119e-01 2.37705e-01 1.76794e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0785016 0.        0.        0.       ; 0.0004491  0.0933299  0.         0.00023315; 3.09435e-08 9.63010e-06 8.89504e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR378
	normalization_factors_uo = total

[]
[./mat_gcu_MNR390]
	block = 'MNR390'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00122786 0.00054906 0.00820147 0.103584  '
	ref_diffusivity = '2.89651  1.14252  0.761158 0.245454'
	ref_sigma_r = '0.0791565 0.0923565 0.0997266 0.0689413'
	chi = '7.61949e-01 2.37880e-01 1.70972e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '5.e-06 0.e+00 0.e+00 0.e+00; 0.0778815 0.        0.        0.       ; 0.00044209 0.091854   0.         0.00023212; 4.64056e-08 1.07413e-05 8.85695e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR390
	normalization_factors_uo = total

[]
[./mat_gcu_C9rifl]
	block = 'C9rifl'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0. 0. 0.'
	ref_diffusivity = '4.96811  1.6475   0.970019 0.266534'
	ref_sigma_r = '0.0609944 0.0937559 0.0929394 0.0116049'
	chi = '0. 0. 0. 0.'
	ref_k = 1
	ref_sigma_s = '0. 0. 0. 0.; 0.0603698 0.        0.        0.       ; 3.67765e-04 9.37368e-02 0.00000e+00 3.94650e-05; 0.00000e+00 1.25287e-05 9.22779e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_C9rifl
	normalization_factors_uo = total

[]
[./mat_gcu_C8graph]
	block = 'C8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0. 0. 0.'
	ref_diffusivity = '2.39157  1.0284   0.759279 0.334354'
	ref_sigma_r = '0.0498287  0.056316   0.0539494  0.00766838'
	chi = '0. 0. 0. 0.'
	ref_k = 1
	ref_sigma_s = '0. 0. 0. 0.; 0.0493935 0.        0.        0.       ; 2.36457e-04 5.62965e-02 0.00000e+00 7.48694e-05; 0.00000e+00 4.44985e-06 5.35525e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_C8graph
	normalization_factors_uo = total

[]
[./mat_gcu_MNR379]
	block = 'MNR379'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00112712 0.00042865 0.00640922 0.0875971 '
	ref_diffusivity = '2.89192  1.13661  0.758967 0.244739'
	ref_sigma_r = '0.0797679 0.0936128 0.10009   0.0619798'
	chi = '7.62142e-01 2.37690e-01 1.68009e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0785291 0.        0.        0.       ; 0.00045316 0.0931764  0.         0.00020741; 0.00000e+00 9.11371e-06 8.91720e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR379
	normalization_factors_uo = total

[]
[./mat_gcu_MNR393]
	block = 'MNR393'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00126806 0.00058914 0.00874968 0.110578  '
	ref_diffusivity = '2.89793  1.14326  0.761503 0.244862'
	ref_sigma_r = '0.0792685 0.0918752 0.0998218 0.0723551'
	chi = '7.61438e-01 2.38390e-01 1.71427e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.077965 0.       0.       0.      ; 0.00045109 0.0913594  0.         0.00022901; 0.00000e+00 1.05559e-05 8.86301e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR393
	normalization_factors_uo = total

[]
[./mat_gcu_010400]
	block = 'u10400'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0. 0. 0.'
	ref_diffusivity = '2.96242  1.02943  0.604016 0.171565'
	ref_sigma_r = '0.102632  0.143858  0.136391  0.0181526'
	chi = '0. 0. 0. 0.'
	ref_k = 1
	ref_sigma_s = '0. 0. 0. 0.; 0.10165 0.      0.      0.     ; 6.23634e-04 1.43818e-01 0.00000e+00 1.36494e-04; 4.54637e-08 1.71575e-05 1.35406e-01 0.00000e+00'
	sph_factors_uo = uo_gcu_010400
	normalization_factors_uo = total

[]
[./mat_gcu_MNR384]
	block = 'MNR384'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00121416 0.0005285  0.0079023  0.103229  '
	ref_diffusivity = '2.89673  1.1416   0.760316 0.245494'
	ref_sigma_r = '0.0792792 0.0925064 0.0999614 0.0692785'
	chi = '7.61763e-01 2.38056e-01 1.81115e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0780018 0.        0.        0.       ; 0.00045087 0.092023   0.         0.00022621; 0.00000e+00 1.06370e-05 8.88933e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR384
	normalization_factors_uo = total

[]
[./mat_gcu_MNR383]
	block = 'MNR383'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00113615 0.00045943 0.00692322 0.0926291 '
	ref_diffusivity = '2.89455  1.13881  0.760276 0.247104'
	ref_sigma_r = '0.0794884 0.0935268 0.0994269 0.0643669'
	chi = '7.62221e-01 2.37616e-01 1.63505e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '5.e-06 0.e+00 0.e+00 0.e+00; 0.0782521 0.        0.        0.       ; 0.00044661 0.0930776  0.         0.00024603; 2.62816e-08 1.02234e-05 8.84580e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR383
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC74]
	block = 'MNRC74'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00052458 0.00014348 0.00212632 0.0302704 '
	ref_diffusivity = '2.9108   1.13465  0.763674 0.230217'
	ref_sigma_r = '0.0790937 0.0986385 0.10079   0.0347041'
	chi = '7.62415e-01 2.37421e-01 1.63295e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '2.e-06 0.e+00 0.e+00 0.e+00; 0.0780932 0.        0.        0.       ; 0.00045177 0.0983891  0.         0.00016695; 4.16257e-08 1.06417e-05 9.40903e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNRC74
	normalization_factors_uo = total

[]
[./mat_gcu_MNR361]
	block = 'MNR361'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00103454 0.00033151 0.00502639 0.0713211 '
	ref_diffusivity = '2.89696  1.13951  0.760782 0.241825'
	ref_sigma_r = '0.0789734 0.0933574 0.0999426 0.0546565'
	chi = '7.61976e-01 2.37865e-01 1.58809e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.077789 0.       0.       0.      ; 0.00044218 0.0929498  0.         0.00019278; 0.00000e+00 9.65133e-06 8.92309e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR361
	normalization_factors_uo = total

[]
[./mat_gcu_B9plug]
	block = 'B9plug'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0. 0. 0.'
	ref_diffusivity = '3.07528  0.988773 0.553637 0.150535'
	ref_sigma_r = '0.1074    0.167158  0.165894  0.0192229'
	chi = '0. 0. 0. 0.'
	ref_k = 1
	ref_sigma_s = '0. 0. 0. 0.; 0.106361 0.       0.       0.      ; 6.62533e-04 1.67123e-01 0.00000e+00 5.83704e-05; 0.00000e+00 1.91393e-05 1.64802e-01 0.00000e+00'
	sph_factors_uo = uo_gcu_B9plug
	normalization_factors_uo = total

[]
[./mat_gcu_B8graph]
	block = 'B8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0. 0. 0.'
	ref_diffusivity = '2.39301  1.02975  0.758885 0.334486'
	ref_sigma_r = '0.0498689  0.056446   0.0537585  0.00762536'
	chi = '0. 0. 0. 0.'
	ref_k = 1
	ref_sigma_s = '0. 0. 0. 0.; 0.0494431 0.        0.        0.       ; 2.26903e-04 5.64254e-02 0.00000e+00 7.68854e-05; 0.00000e+00 4.97658e-06 5.33568e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_B8graph
	normalization_factors_uo = total

[]
[./mat_gcu_MNR398]
	block = 'MNR398'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.0012878  0.00060864 0.00902802 0.112793  '
	ref_diffusivity = '2.89613  1.1403   0.760057 0.24696 '
	ref_sigma_r = '0.0796542 0.0922071 0.099869  0.072582 '
	chi = '7.61533e-01 2.38298e-01 1.68487e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '5.e-06 0.e+00 0.e+00 0.e+00; 0.0783473 0.        0.        0.       ; 0.00045104 0.0916871  0.         0.00022359; 1.14874e-07 9.12307e-06 8.85995e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR398
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC79]
	block = 'MNRC79'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00064926 0.00025882 0.0037757  0.0490619 '
	ref_diffusivity = '2.91363  1.1372   0.761806 0.231966'
	ref_sigma_r = '0.0793215 0.0971311 0.100255  0.0431974'
	chi = '7.62094e-01 2.37735e-01 1.70947e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '2.e-06 0.e+00 0.e+00 0.e+00; 0.0782555 0.        0.        0.       ; 0.00045036 0.0968263  0.         0.00018518; 0.00000e+00 9.47267e-06 9.33489e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNRC79
	normalization_factors_uo = total

[]
[./mat_gcu_MNR385]
	block = 'MNR385'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00121996 0.00053088 0.00794948 0.10302   '
	ref_diffusivity = '2.89838  1.14     0.759751 0.247778'
	ref_sigma_r = '0.0795749 0.0923283 0.0999736 0.0690356'
	chi = '7.61799e-01 2.38032e-01 1.68941e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0782887 0.        0.        0.       ; 0.00044918 0.0918366  0.         0.00021856; 0.00000e+00 9.88474e-06 8.88846e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR385
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC78]
	block = 'MNRC78'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00058358 0.00019636 0.00288284 0.0394724 '
	ref_diffusivity = '2.91406  1.13555  0.762787 0.2312  '
	ref_sigma_r = '0.0791731 0.0978555 0.100697  0.0389722'
	chi = '7.62387e-01 2.37443e-01 1.70314e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '3.e-06 0.e+00 0.e+00 0.e+00; 0.0781381 0.        0.        0.       ; 0.00045498 0.097578   0.         0.00017174; 3.86028e-08 1.06377e-05 9.38815e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNRC78
	normalization_factors_uo = total

[]
[./mat_gcu_MNR358]
	block = 'MNR358'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00104263 0.00035178 0.00532938 0.0754683 '
	ref_diffusivity = '2.89119  1.13714  0.759874 0.244971'
	ref_sigma_r = '0.079524  0.0941702 0.0995157 0.0566451'
	chi = '7.62251e-01 2.37578e-01 1.70196e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0783268 0.        0.        0.       ; 0.00044986 0.0937687  0.         0.00021735; 0.00000e+00 9.99234e-06 8.88197e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR358
	normalization_factors_uo = total

[]
[./mat_gcu_MNR373]
	block = 'MNR373'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.0011019  0.00039548 0.00597196 0.0834491 '
	ref_diffusivity = '2.88614  1.13482  0.760092 0.245945'
	ref_sigma_r = '0.0801178 0.0942646 0.0998874 0.0603167'
	chi = '7.62058e-01 2.37771e-01 1.70436e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0788795 0.        0.        0.       ; 0.00045439 0.0938331  0.         0.00020845; 4.33174e-08 1.06170e-05 8.90205e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR373
	normalization_factors_uo = total

[]
[./mat_gcu_MNR365]
	block = 'MNR365'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00108488 0.00037601 0.00566424 0.0784127 '
	ref_diffusivity = '2.8984   1.13838  0.760264 0.242449'
	ref_sigma_r = '0.079203  0.0935203 0.0999819 0.0577726'
	chi = '7.62184e-01 2.37636e-01 1.79876e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '5.e-06 0.e+00 0.e+00 0.e+00; 0.0779882 0.        0.        0.       ; 0.00045117 0.0931054  0.         0.00019642; 6.92357e-08 9.03746e-06 8.91760e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR365
	normalization_factors_uo = total

[]
[./mat_gcu_A9plug]
	block = 'A9plug'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0. 0. 0.'
	ref_diffusivity = '3.10473  0.995631 0.553459 0.150016'
	ref_sigma_r = '0.105319 0.165403 0.165711 0.019221'
	chi = '0. 0. 0. 0.'
	ref_k = 1
	ref_sigma_s = '0. 0. 0. 0.; 0.10417 0.      0.      0.     ; 6.60352e-04 1.65374e-01 0.00000e+00 5.34305e-05; 0.00000e+00 2.16861e-05 1.64612e-01 0.00000e+00'
	sph_factors_uo = uo_gcu_A9plug
	normalization_factors_uo = total

[]
[./mat_gcu_A8graph]
	block = 'A8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0. 0. 0.'
	ref_diffusivity = '2.41414  1.02786  0.758468 0.331261'
	ref_sigma_r = '0.048542  0.0572846 0.0560669 0.0076905'
	chi = '0. 0. 0. 0.'
	ref_k = 1
	ref_sigma_s = '0. 0. 0. 0.; 0.048082 0.       0.       0.      ; 2.31174e-04 5.72643e-02 0.00000e+00 5.86624e-05; 0.00000e+00 5.21599e-06 5.56454e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_A8graph
	normalization_factors_uo = total

[]
[./mat_gcu_A7rifl]
	block = 'A7rifl'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0. 0. 0.'
	ref_diffusivity = '4.84883  1.68852  0.985278 0.276641'
	ref_sigma_r = '0.0620863 0.0871318 0.0829255 0.0114113'
	chi = '0. 0. 0. 0.'
	ref_k = 1
	ref_sigma_s = '2.e-07 0.e+00 0.e+00 0.e+00; 0.0614975 0.        0.        0.       ; 3.72047e-04 8.71061e-02 0.00000e+00 8.26377e-05; 0.00000e+00 9.83240e-06 8.23406e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_A7rifl
	normalization_factors_uo = total

[]
[./mat_gcu_MNR397]
	block = 'MNR397'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00130812 0.00061165 0.00902804 0.113008  '
	ref_diffusivity = '2.89961  1.14354  0.761316 0.246723'
	ref_sigma_r = '0.0793863 0.0915803 0.100346  0.0728589'
	chi = '7.61435e-01 2.38389e-01 1.75944e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0780809 0.        0.        0.       ; 0.00044936 0.0910481  0.         0.00020732; 5.59039e-08 1.04604e-05 8.90286e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR397
	normalization_factors_uo = total

[]
[./mat_gcu_MNR376]
	block = 'MNR376'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00111366 0.00041717 0.00630431 0.0854133 '
	ref_diffusivity = '2.89937  1.13887  0.759552 0.24556 '
	ref_sigma_r = '0.0792846 0.0933528 0.0997968 0.0609526'
	chi = '7.62451e-01 2.37374e-01 1.74592e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0780475 0.        0.        0.       ; 0.00044668 0.0929091  0.         0.00020634; 1.00098e-07 8.80240e-06 8.88603e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR376
	normalization_factors_uo = total

[]
[./mat_gcu_MNR366]
	block = 'MNR366'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00104884 0.00033353 0.00504692 0.0720942 '
	ref_diffusivity = '2.89986  1.13739  0.759849 0.243895'
	ref_sigma_r = '0.0794449 0.0938775 0.100594  0.0551955'
	chi = '7.62239e-01 2.37570e-01 1.90666e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0782354 0.        0.        0.       ; 0.00045703 0.0934793  0.         0.0001807 ; 1.03051e-07 8.76829e-06 8.98281e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR366
	normalization_factors_uo = total

[]
[./mat_gcu_MNR362]
	block = 'MNR362'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.0010262  0.00031024 0.00469509 0.0676694 '
	ref_diffusivity = '2.88919  1.13265  0.759507 0.241739'
	ref_sigma_r = '0.0797871 0.0947999 0.100415  0.0531347'
	chi = '7.62652e-01 2.37177e-01 1.70533e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '5.e-06 0.e+00 0.e+00 0.e+00; 0.0785981 0.        0.        0.       ; 0.00044553 0.0944129  0.         0.00017773; 5.65626e-08 1.03401e-05 8.97024e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR362
	normalization_factors_uo = total

[]
[./mat_gcu_010500]
	block = 'u10500'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0. 0. 0.'
	ref_diffusivity = '1.78698  0.689533 0.495325 0.30337 '
	ref_sigma_r = '0.0668999 0.0465242 0.0450074 0.0060334'
	chi = '0. 0. 0. 0.'
	ref_k = 1
	ref_sigma_s = '0.004045 0.       0.       0.      ; 0.0698745 0.        0.        0.       ; 0.00015312 0.0465173  0.         0.00012716; 0.00000e+00 3.30553e-06 4.47139e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_010500
	normalization_factors_uo = total

[]
[./mat_gcu_MNR369]
	block = 'MNR369'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00111505 0.0003814  0.00566442 0.078585  '
	ref_diffusivity = '2.88973  1.13795  0.761538 0.239556'
	ref_sigma_r = '0.0795014 0.0931421 0.100508  0.0579014'
	chi = '7.61763e-01 2.38048e-01 1.89534e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0782487 0.        0.        0.       ; 0.00045428 0.0927103  0.         0.00016008; 0.00000e+00 9.26906e-06 8.96928e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR369
	normalization_factors_uo = total

[]
[]


[UserObjects]
[./uo_gcu_F9plug]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 26.92943732  28.48214301  38.62741404 440.16271609'
	block  = F9plug 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_F8graph]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 117.88800692  143.82811589  172.60184793 1031.04419523'
	block  = F8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_F7rifl]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 312.43870638  351.17738156  382.62750959 1404.0188586 '
	block  = F7rifl 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR396]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 788.1106961   775.93561656  666.44947528 1096.73540855'
	block  = MNR396 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR375]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 960.67624273  982.74224847  873.27260779 1416.12793577'
	block  = MNR375 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR374]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '1018.965762   1042.05951889  938.96146388 1662.95086012'
	block  = MNR374 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR372]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '1032.47267503 1062.64047136  947.48519818 1501.72829176'
	block  = MNR372 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR382]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 892.00313675  905.28611317  797.02808738 1230.47977705'
	block  = MNR382 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR389]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '605.25585185 601.18020567 521.39041524 848.8022301 '
	block  = MNR389 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_E9rifl]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 48.99355727  55.30644799  73.81374751 690.5096954 '
	block  = E9rifl 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_E8graph]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 204.81760343  253.97475229  281.4317371  1268.23077394'
	block  = E8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR394]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 742.39462781  727.77038899  624.17731623 1106.8644147 '
	block  = MNR394 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC77]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 933.4149078  1022.03015763  990.32073458 1977.62893253'
	block  = MNRC77 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR377]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '1431.97557562 1492.2098075  1316.3017124  1825.22710912'
	block  = MNR377 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC76]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '1311.75697797 1454.65917494 1427.1998329  2823.69913607'
	block  = MNRC76 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR395]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '1632.73356201 1686.27798251 1463.06504786 1821.09488948'
	block  = MNR395 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC80]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '1111.82402116 1224.03747455 1173.97703615 2032.75976708'
	block  = MNRC80 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR387]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 863.70462175  880.63187175  767.11251438 1104.04988518'
	block  = MNR387 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_D9graph]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 59.87923343  71.72618692  95.15844166 829.19009809'
	block  = D9graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_D8graph]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 224.97472642  291.52067039  346.071627   1606.43397586'
	block  = D8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_D7rifl]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 589.85608521  682.09203634  732.71113763 2134.88428717'
	block  = D7rifl 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR392]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '1334.85073485 1355.58254988 1175.426731   1687.8856116 '
	block  = MNR392 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR381]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '1645.17265103 1689.63231711 1493.89522509 2289.79420054'
	block  = MNR381 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR391]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '1901.58241922 1968.61725216 1721.28280948 2305.49569228'
	block  = MNR391 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR388]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '1845.84577723 1932.25701944 1699.96640205 2150.76257097'
	block  = MNR388 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR378]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '1430.64138491 1494.48217471 1333.21953349 1928.87204089'
	block  = MNR378 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR390]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 959.46698508  975.29340987  848.64429586 1239.08837153'
	block  = MNR390 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_C9rifl]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 59.6767476   67.95155868  91.87340955 804.56650062'
	block  = C9rifl 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_C8graph]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 251.75424407  321.15573333  356.83001287 1465.33270062'
	block  = C8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR379]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 866.42250495  894.37686474  796.40106489 1319.62776027'
	block  = MNR379 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR393]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '1326.02291822 1335.36932488 1150.07475026 1716.13698205'
	block  = MNR393 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_010400]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 975.94164741 1133.69437703 1272.28520507 4501.1964465 '
	block  = u10400 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR384]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '1778.48564691 1815.35504075 1585.93788357 2350.14157933'
	block  = MNR384 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR383]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '1686.18133619 1767.09316686 1568.92341616 2148.14604855'
	block  = MNR383 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC74]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '1062.12188133 1189.48052079 1185.50623539 2513.32300366'
	block  = MNRC74 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR361]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 801.97119324  831.03344992  751.51002619 1320.71679933'
	block  = MNR361 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_B9plug]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 41.44642229  46.53331903  63.53317163 633.81130463'
	block  = B9plug 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_B8graph]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 220.61880589  278.00197123  305.21144716 1260.67114565'
	block  = B8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR398]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 782.50520933  786.78357707  674.45226232 1019.92751078'
	block  = MNR398 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC79]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 960.68331442 1031.1879861   974.25858704 1838.67273424'
	block  = MNRC79 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR385]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '1332.78108919 1339.94941773 1157.88660188 1800.68365738'
	block  = MNR385 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC78]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '1162.91928239 1269.54610683 1233.16465906 2533.83088209'
	block  = MNRC78 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR358]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '1270.98637277 1351.04724435 1223.68153321 1878.24115346'
	block  = MNR358 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR373]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '1022.84104386 1096.45489848  990.37495081 1617.38565438'
	block  = MNR373 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR365]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 648.98242021  671.3195071   604.00887855 1046.64432619'
	block  = MNR365 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_A9plug]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 27.16940307  28.93425923  38.48880907 430.04549607'
	block  = A9plug 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_A8graph]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 124.13583815  154.21146689  185.20594287 1092.20481747'
	block  = A8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_A7rifl]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 322.92365388  367.82883594  403.33103789 1465.31384281'
	block  = A7rifl 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR397]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 785.14530403  775.53960235  665.97331535 1087.32299952'
	block  = MNR397 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR376]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 901.74320038  922.87102961  818.3963538  1334.42643392'
	block  = MNR376 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR366]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 869.60711917  894.84359577  816.06741313 1553.61322417'
	block  = MNR366 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR362]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 779.20509097  828.40749859  763.56960159 1494.28181038'
	block  = MNR362 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_010500]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 413.90084557  607.11570427  603.54450475 1768.46271599'
	block  = u10500 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR369]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '402.27735724 412.8966667  371.17845609 795.24602346'
	block  = MNR369 
	execute_on = 'LINEAR' 
[]
[./total]
	type = NormalizationFactorsUserObject
	SPH_user_objects = 'uo_gcu_F9plug uo_gcu_F8graph uo_gcu_F7rifl uo_gcu_MNR396 uo_gcu_MNR375 uo_gcu_MNR374 uo_gcu_MNR372 uo_gcu_MNR382 uo_gcu_MNR389 uo_gcu_E9rifl uo_gcu_E8graph uo_gcu_MNR394 uo_gcu_MNRC77 uo_gcu_MNR377 uo_gcu_MNRC76 uo_gcu_MNR395 uo_gcu_MNRC80 uo_gcu_MNR387 uo_gcu_D9graph uo_gcu_D8graph uo_gcu_D7rifl uo_gcu_MNR392 uo_gcu_MNR381 uo_gcu_MNR391 uo_gcu_MNR388 uo_gcu_MNR378 uo_gcu_MNR390 uo_gcu_C9rifl uo_gcu_C8graph uo_gcu_MNR379 uo_gcu_MNR393 uo_gcu_010400 uo_gcu_MNR384 uo_gcu_MNR383 uo_gcu_MNRC74 uo_gcu_MNR361 uo_gcu_B9plug uo_gcu_B8graph uo_gcu_MNR398 uo_gcu_MNRC79 uo_gcu_MNR385 uo_gcu_MNRC78 uo_gcu_MNR358 uo_gcu_MNR373 uo_gcu_MNR365 uo_gcu_A9plug uo_gcu_A8graph uo_gcu_A7rifl uo_gcu_MNR397 uo_gcu_MNR376 uo_gcu_MNR366 uo_gcu_MNR362 uo_gcu_010500 uo_gcu_MNR369 '
	ref_integrals = '44907.07586005 47370.41621383 43553.88943183 84244.49527923'
	execute_on = 'LINEAR' 
[]
[./output]
	type = OutputUserObject
	SPH_uo_names = 'uo_gcu_A9plug uo_gcu_B9plug uo_gcu_C9rifl uo_gcu_D9graph uo_gcu_E9rifl uo_gcu_F9plug uo_gcu_A8graph uo_gcu_B8graph uo_gcu_C8graph uo_gcu_D8graph uo_gcu_E8graph uo_gcu_F8graph uo_gcu_A7rifl uo_gcu_MNR398 uo_gcu_MNR379 uo_gcu_D7rifl uo_gcu_MNR394 uo_gcu_F7rifl uo_gcu_MNR397 uo_gcu_MNRC79 uo_gcu_MNR393 uo_gcu_MNR392 uo_gcu_MNRC77 uo_gcu_MNR396 uo_gcu_MNR376 uo_gcu_MNR385 uo_gcu_010400 uo_gcu_MNR381 uo_gcu_MNR377 uo_gcu_MNR375 uo_gcu_MNR366 uo_gcu_MNRC78 uo_gcu_MNR384 uo_gcu_MNR391 uo_gcu_MNRC76 uo_gcu_MNR374 uo_gcu_MNR362 uo_gcu_MNR358 uo_gcu_MNR383 uo_gcu_MNR388 uo_gcu_MNR395 uo_gcu_MNR372 uo_gcu_010500 uo_gcu_MNR373 uo_gcu_MNRC74 uo_gcu_MNR378 uo_gcu_MNRC80 uo_gcu_MNR382 uo_gcu_MNR369 uo_gcu_MNR365 uo_gcu_MNR361 uo_gcu_MNR390 uo_gcu_MNR387 uo_gcu_MNR389 '
	execute_on = 'TIMESTEP_END'
	normalization_uo_name = total
	surface_integrators = 'alb_0 alb_1 alb_2 alb_3'
	ref_surface_integrals =  '552.54353262 334.27134661 165.05707018 -25.1318157' 
[]
[]


[ICs]
[./IC_gcu_F9plug]
	type = ArrayConstantIC
	variable = flux 
	value = '0.00598273 0.00632768 0.00858159 0.09778794'
	block  = F9plug 
[]
[./IC_gcu_F8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.02619037 0.03195331 0.03834577 0.22906003'
	block  = F8graph 
[]
[./IC_gcu_F7rifl]
	type = ArrayConstantIC
	variable = flux 
	value = '0.06941237 0.07801867 0.08500573 0.31192126'
	block  = F7rifl 
[]
[./IC_gcu_MNR396]
	type = ArrayConstantIC
	variable = flux 
	value = '0.17508916 0.1723843  0.14806052 0.2436542 '
	block  = MNR396 
[]
[./IC_gcu_MNR375]
	type = ArrayConstantIC
	variable = flux 
	value = '0.21342686 0.21832912 0.194009   0.31461145'
	block  = MNR375 
[]
[./IC_gcu_MNR374]
	type = ArrayConstantIC
	variable = flux 
	value = '0.22637665 0.23150723 0.20860264 0.36944641'
	block  = MNR374 
[]
[./IC_gcu_MNR372]
	type = ArrayConstantIC
	variable = flux 
	value = '0.22937739 0.23607956 0.2104963  0.33362869'
	block  = MNR372 
[]
[./IC_gcu_MNR382]
	type = ArrayConstantIC
	variable = flux 
	value = '0.19817023 0.20112122 0.17707027 0.27336727'
	block  = MNR382 
[]
[./IC_gcu_MNR389]
	type = ArrayConstantIC
	variable = flux 
	value = '0.13446555 0.13356009 0.11583374 0.18857258'
	block  = MNR389 
[]
[./IC_gcu_E9rifl]
	type = ArrayConstantIC
	variable = flux 
	value = '0.01088456 0.01228705 0.01639869 0.15340581'
	block  = E9rifl 
[]
[./IC_gcu_E8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.04550292 0.05642383 0.06252376 0.28175415'
	block  = E8graph 
[]
[./IC_gcu_MNR394]
	type = ArrayConstantIC
	variable = flux 
	value = '0.16493273 0.16168377 0.1386692  0.24590449'
	block  = MNR394 
[]
[./IC_gcu_MNRC77]
	type = ArrayConstantIC
	variable = flux 
	value = '0.2073704  0.22705744 0.22001278 0.43935628'
	block  = MNRC77 
[]
[./IC_gcu_MNR377]
	type = ArrayConstantIC
	variable = flux 
	value = '0.31813221 0.33151404 0.29243374 0.40549821'
	block  = MNR377 
[]
[./IC_gcu_MNRC76]
	type = ArrayConstantIC
	variable = flux 
	value = '0.29142407 0.32317167 0.31707122 0.62732191'
	block  = MNRC76 
[]
[./IC_gcu_MNR395]
	type = ArrayConstantIC
	variable = flux 
	value = '0.36273324 0.37462884 0.32503915 0.40458018'
	block  = MNR395 
[]
[./IC_gcu_MNRC80]
	type = ArrayConstantIC
	variable = flux 
	value = '0.24700633 0.27193603 0.26081444 0.45160432'
	block  = MNRC80 
[]
[./IC_gcu_MNR387]
	type = ArrayConstantIC
	variable = flux 
	value = '0.19188334 0.19564395 0.17042414 0.2452792 '
	block  = MNR387 
[]
[./IC_gcu_D9graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.01330296 0.01593492 0.0211407  0.18421549'
	block  = D9graph 
[]
[./IC_gcu_D8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.04998109 0.06476515 0.07688436 0.35689044'
	block  = D8graph 
[]
[./IC_gcu_D7rifl]
	type = ArrayConstantIC
	variable = flux 
	value = '0.13104429 0.15153572 0.16278142 0.47429263'
	block  = D7rifl 
[]
[./IC_gcu_MNR392]
	type = ArrayConstantIC
	variable = flux 
	value = '0.29655465 0.30116049 0.26113651 0.37498599'
	block  = MNR392 
[]
[./IC_gcu_MNR381]
	type = ArrayConstantIC
	variable = flux 
	value = '0.36549675 0.37537404 0.33188848 0.5087079 '
	block  = MNR381 
[]
[./IC_gcu_MNR391]
	type = ArrayConstantIC
	variable = flux 
	value = '0.42246155 0.43735422 0.38240562 0.51219619'
	block  = MNR391 
[]
[./IC_gcu_MNR388]
	type = ArrayConstantIC
	variable = flux 
	value = '0.41007892 0.42927631 0.3776699  0.4778202 '
	block  = MNR388 
[]
[./IC_gcu_MNR378]
	type = ArrayConstantIC
	variable = flux 
	value = '0.3178358  0.33201887 0.29619226 0.4285243 '
	block  = MNR378 
[]
[./IC_gcu_MNR390]
	type = ArrayConstantIC
	variable = flux 
	value = '0.21315821 0.21667426 0.18853749 0.27527978'
	block  = MNR390 
[]
[./IC_gcu_C9rifl]
	type = ArrayConstantIC
	variable = flux 
	value = '0.01325797 0.01509633 0.02041089 0.17874503'
	block  = C9rifl 
[]
[./IC_gcu_C8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.05593052 0.07134897 0.07927448 0.32554293'
	block  = C8graph 
[]
[./IC_gcu_MNR379]
	type = ArrayConstantIC
	variable = flux 
	value = '0.19248716 0.19869759 0.17693097 0.29317267'
	block  = MNR379 
[]
[./IC_gcu_MNR393]
	type = ArrayConstantIC
	variable = flux 
	value = '0.29459343 0.29666986 0.25550423 0.3812624 '
	block  = MNR393 
[]
[./IC_gcu_010400]
	type = ArrayConstantIC
	variable = flux 
	value = '0.21681827 0.25186512 0.28265489 1.        '
	block  = u10400 
[]
[./IC_gcu_MNR384]
	type = ArrayConstantIC
	variable = flux 
	value = '0.39511398 0.403305   0.35233696 0.52211487'
	block  = MNR384 
[]
[./IC_gcu_MNR383]
	type = ArrayConstantIC
	variable = flux 
	value = '0.37460736 0.39258299 0.34855697 0.4772389 '
	block  = MNR383 
[]
[./IC_gcu_MNRC74]
	type = ArrayConstantIC
	variable = flux 
	value = '0.23596435 0.26425874 0.2633758  0.55836777'
	block  = MNRC74 
[]
[./IC_gcu_MNR361]
	type = ArrayConstantIC
	variable = flux 
	value = '0.17816845 0.18462501 0.16695784 0.29341461'
	block  = MNR361 
[]
[./IC_gcu_B9plug]
	type = ArrayConstantIC
	variable = flux 
	value = '0.00920787 0.01033799 0.01411473 0.14080952'
	block  = B9plug 
[]
[./IC_gcu_B8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.04901337 0.06176179 0.06780674 0.28007468'
	block  = B8graph 
[]
[./IC_gcu_MNR398]
	type = ArrayConstantIC
	variable = flux 
	value = '0.17384383 0.17479432 0.14983844 0.22659031'
	block  = MNR398 
[]
[./IC_gcu_MNRC79]
	type = ArrayConstantIC
	variable = flux 
	value = '0.21342844 0.22909198 0.21644436 0.40848533'
	block  = MNRC79 
[]
[./IC_gcu_MNR385]
	type = ArrayConstantIC
	variable = flux 
	value = '0.29609485 0.29768739 0.25723974 0.40004556'
	block  = MNR385 
[]
[./IC_gcu_MNRC78]
	type = ArrayConstantIC
	variable = flux 
	value = '0.25835782 0.28204637 0.27396375 0.56292386'
	block  = MNRC78 
[]
[./IC_gcu_MNR358]
	type = ArrayConstantIC
	variable = flux 
	value = '0.28236634 0.30015292 0.27185695 0.41727598'
	block  = MNR358 
[]
[./IC_gcu_MNR373]
	type = ArrayConstantIC
	variable = flux 
	value = '0.22723759 0.24359188 0.22002482 0.3593235 '
	block  = MNR373 
[]
[./IC_gcu_MNR365]
	type = ArrayConstantIC
	variable = flux 
	value = '0.14417998 0.14914246 0.13418852 0.2325258 '
	block  = MNR365 
[]
[./IC_gcu_A9plug]
	type = ArrayConstantIC
	variable = flux 
	value = '0.00603604 0.00642813 0.0085508  0.09554026'
	block  = A9plug 
[]
[./IC_gcu_A8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.02757841 0.03426011 0.04114594 0.24264767'
	block  = A8graph 
[]
[./IC_gcu_A7rifl]
	type = ArrayConstantIC
	variable = flux 
	value = '0.07174174 0.08171801 0.0896053  0.32553875'
	block  = A7rifl 
[]
[./IC_gcu_MNR397]
	type = ArrayConstantIC
	variable = flux 
	value = '0.17443036 0.17229632 0.14795473 0.24156311'
	block  = MNR397 
[]
[./IC_gcu_MNR376]
	type = ArrayConstantIC
	variable = flux 
	value = '0.20033411 0.20502794 0.18181752 0.29646039'
	block  = MNR376 
[]
[./IC_gcu_MNR366]
	type = ArrayConstantIC
	variable = flux 
	value = '0.19319466 0.19880128 0.18130011 0.34515561'
	block  = MNR366 
[]
[./IC_gcu_MNR362]
	type = ArrayConstantIC
	variable = flux 
	value = '0.17311066 0.18404162 0.16963703 0.33197436'
	block  = MNR362 
[]
[./IC_gcu_010500]
	type = ArrayConstantIC
	variable = flux 
	value = '0.09195352 0.13487874 0.13408535 0.39288725'
	block  = u10500 
[]
[./IC_gcu_MNR369]
	type = ArrayConstantIC
	variable = flux 
	value = '0.08937121 0.09173043 0.08246218 0.17667436'
	block  = MNR369 
[]
[]


