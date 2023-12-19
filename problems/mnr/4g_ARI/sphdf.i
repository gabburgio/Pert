[Mesh]
file = mnr_active.msh
[]


[Outputs]
exodus = true
[]


[Executioner]
type = Steady
solve_type = 'PJFNK'	
#nl_rel_tol = 1e-10
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
	albedo_matrix = '0.0869676 0.        0.        0.       ; 0.137082 0.170448 0.       0.      ; 8.50043e-02 2.32033e-01 2.39851e-01 8.35499e-06; 0.101336 0.17025  0.38504  0.778011 '
    execute_on = 'LINEAR'
    boundary = 'north south west east bottom top'
[]
[./alb_1]
    type = AlbedoCorrectedArraySideIntegralPostprocessor
    variable = flux
	albedo_matrix = '0.0869676 0.        0.        0.       ; 0.137082 0.170448 0.       0.      ; 8.50043e-02 2.32033e-01 2.39851e-01 8.35499e-06; 0.101336 0.17025  0.38504  0.778011 '
    component = 1
    execute_on = 'LINEAR'
    boundary = 'north south west east bottom top' 
[]
[./alb_2]
    type = AlbedoCorrectedArraySideIntegralPostprocessor
    variable = flux
	albedo_matrix = '0.0869676 0.        0.        0.       ; 0.137082 0.170448 0.       0.      ; 8.50043e-02 2.32033e-01 2.39851e-01 8.35499e-06; 0.101336 0.17025  0.38504  0.778011 '
    component = 2
    execute_on = 'LINEAR'
    boundary = 'north south west east bottom top' 
[]
[./alb_3]
    type = AlbedoCorrectedArraySideIntegralPostprocessor
    variable = flux
	albedo_matrix = '0.0869676 0.        0.        0.       ; 0.137082 0.170448 0.       0.      ; 8.50043e-02 2.32033e-01 2.39851e-01 8.35499e-06; 0.101336 0.17025  0.38504  0.778011 '
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
	albedo_matrix = '0.0869676 0.        0.        0.       ; 0.137082 0.170448 0.       0.      ; 8.50043e-02 2.32033e-01 2.39851e-01 8.35499e-06; 0.101336 0.17025  0.38504  0.778011 '
	ref_current_integral = '641.61524666 389.23833175 186.42955718 -40.54691211'
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
	ref_diffusivity = '3.10429  0.992023 0.553852 0.149901'
	ref_sigma_r = '0.104618  0.166151  0.166128  0.0191639'
	chi = '0. 0. 0. 0.'
	ref_k = 1
	ref_sigma_s = '0. 0. 0. 0.; 0.103485 0.       0.       0.      ; 6.57390e-04 1.66127e-01 0.00000e+00 5.22700e-05; 0.00000e+00 1.60468e-05 1.65058e-01 0.00000e+00'
	sph_factors_uo = uo_gcu_F9plug
	normalization_factors_uo = total

[]
[./mat_gcu_F8graph]
	block = 'F8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0. 0. 0.'
	ref_diffusivity = '2.42515  1.02587  0.759067 0.331316'
	ref_sigma_r = '0.0480281  0.0571778  0.055797   0.00765581'
	chi = '0. 0. 0. 0.'
	ref_k = 1
	ref_sigma_s = '0. 0. 0. 0.; 0.0475728 0.        0.        0.       ; 2.28557e-04 5.71570e-02 0.00000e+00 5.63296e-05; 0.0000e+00 6.0116e-06 5.5390e-02 0.0000e+00'
	sph_factors_uo = uo_gcu_F8graph
	normalization_factors_uo = total

[]
[./mat_gcu_F7rifl]
	block = 'F7rifl'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0. 0. 0.'
	ref_diffusivity = '4.86073 1.68728 0.98145 0.2767 '
	ref_sigma_r = '0.0617902 0.0869694 0.0828426 0.0114129'
	chi = '0. 0. 0. 0.'
	ref_k = 1
	ref_sigma_s = '1.e-06 0.e+00 0.e+00 0.e+00; 0.0612101 0.        0.        0.       ; 3.64194e-04 8.69486e-02 0.00000e+00 7.97539e-05; 0.00000e+00 1.07413e-05 8.22433e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_F7rifl
	normalization_factors_uo = total

[]
[./mat_gcu_MNR396]
	block = 'MNR396'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00130242 0.00060823 0.00895538 0.110754  '
	ref_diffusivity = '2.9032   1.14209  0.760132 0.245135'
	ref_sigma_r = '0.079583  0.0920733 0.0992755 0.0717072'
	chi = '7.61555e-01 2.38272e-01 1.72789e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0782771 0.        0.        0.       ; 0.00044975 0.0915491  0.         0.00022373; 0.00000e+00 9.66175e-06 8.80555e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR396
	normalization_factors_uo = total

[]
[./mat_gcu_MNR375]
	block = 'MNR375'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00112356 0.00041799 0.00626456 0.0850913 '
	ref_diffusivity = '2.90025  1.13904  0.759177 0.245475'
	ref_sigma_r = '0.0793557 0.093136  0.0995149 0.0607956'
	chi = '7.62133e-01 2.37694e-01 1.72386e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0781181 0.        0.        0.       ; 0.00044906 0.0926994  0.         0.00021798; 5.88426e-08 9.70139e-06 8.86474e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR375
	normalization_factors_uo = total

[]
[./mat_gcu_MNR374]
	block = 'MNR374'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00108411 0.00037635 0.00566283 0.0783239 '
	ref_diffusivity = '2.89863  1.13668  0.757973 0.243751'
	ref_sigma_r = '0.0795924 0.094145  0.0994752 0.0578653'
	chi = '7.62304e-01 2.37525e-01 1.70719e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0783629 0.        0.        0.       ; 0.00045121 0.0937272  0.         0.00021283; 1.78281e-08 1.03345e-05 8.86442e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR374
	normalization_factors_uo = total

[]
[./mat_gcu_MNR372]
	block = 'MNR372'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00111449 0.00041413 0.00620728 0.0847695 '
	ref_diffusivity = '2.89771  1.13919  0.759336 0.245581'
	ref_sigma_r = '0.0793658 0.0930895 0.0992362 0.0607073'
	chi = '7.62269e-01 2.37558e-01 1.72298e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0781322 0.        0.        0.       ; 0.00045061 0.0926557  0.         0.00021668; 5.88740e-08 9.19620e-06 8.84012e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR372
	normalization_factors_uo = total

[]
[./mat_gcu_MNR382]
	block = 'MNR382'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00121216 0.00051169 0.00762253 0.0995238 '
	ref_diffusivity = '2.89754  1.14102  0.759333 0.247578'
	ref_sigma_r = '0.0796423 0.0923244 0.0995415 0.0672564'
	chi = '7.61809e-01 2.38024e-01 1.67311e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0783725 0.        0.        0.       ; 0.00045064 0.0918508  0.         0.00022158; 3.04154e-08 9.93682e-06 8.84694e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR382
	normalization_factors_uo = total

[]
[./mat_gcu_MNR389]
	block = 'MNR389'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00124079 0.00053786 0.00797762 0.101856  '
	ref_diffusivity = '2.89801  1.14355  0.760437 0.245175'
	ref_sigma_r = '0.0792098 0.0913355 0.0993364 0.0680177'
	chi = '7.61920e-01 2.37901e-01 1.79392e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '5.e-06 0.e+00 0.e+00 0.e+00; 0.0779269 0.        0.        0.       ; 0.0004471  0.0908426  0.         0.00021195; 8.48216e-08 9.19993e-06 8.81910e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR389
	normalization_factors_uo = total

[]
[./mat_gcu_E9rifl]
	block = 'E9rifl'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0. 0. 0.'
	ref_diffusivity = '4.95103  1.64423  0.967471 0.266693'
	ref_sigma_r = '0.0602857 0.093593  0.0930823 0.0116285'
	chi = '0. 0. 0. 0.'
	ref_k = 1
	ref_sigma_s = '1.2e-06 0.0e+00 0.0e+00 0.0e+00; 0.0597022 0.        0.        0.       ; 3.51955e-04 9.35582e-02 0.00000e+00 3.71681e-05; 0.00000e+00 8.20217e-06 9.24679e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_E9rifl
	normalization_factors_uo = total

[]
[./mat_gcu_E8graph]
	block = 'E8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0. 0. 0.'
	ref_diffusivity = '2.40221  1.02972  0.759361 0.334246'
	ref_sigma_r = '0.0495236  0.0561481  0.0539084  0.00762522'
	chi = '0. 0. 0. 0.'
	ref_k = 1
	ref_sigma_s = '0. 0. 0. 0.; 0.049095 0.       0.       0.      ; 2.25764e-04 5.61230e-02 0.00000e+00 6.99313e-05; 0.00000e+00 5.16693e-06 5.34981e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_E8graph
	normalization_factors_uo = total

[]
[./mat_gcu_MNR394]
	block = 'MNR394'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00131495 0.00060194 0.00880366 0.110472  '
	ref_diffusivity = '2.89925  1.14051  0.760377 0.246802'
	ref_sigma_r = '0.0796418 0.0917814 0.100076  0.0718846'
	chi = '7.61421e-01 2.38404e-01 1.74712e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0783366 0.        0.        0.       ; 0.00044789 0.0912683  0.         0.00020438; 2.71312e-08 9.43654e-06 8.88644e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR394
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC77]
	block = 'MNRC77'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00054682 0.00018137 0.00282778 0.047174  '
	ref_diffusivity = '2.81945  1.13521  0.753275 0.253821'
	ref_sigma_r = '0.0769309 0.0915975 0.107874  0.0876276'
	chi = '7.62038e-01 2.37795e-01 1.67347e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0757479 0.        0.        0.       ; 0.0004151  0.0897641  0.         0.00026675; 2.32919e-08 9.54929e-06 7.46747e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNRC77
	normalization_factors_uo = total

[]
[./mat_gcu_MNR377]
	block = 'MNR377'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00113958 0.00045846 0.00690534 0.0920225 '
	ref_diffusivity = '2.89351  1.14004  0.760873 0.248817'
	ref_sigma_r = '0.0793972 0.0934939 0.0986073 0.0638755'
	chi = '7.62193e-01 2.37640e-01 1.66818e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0781598 0.        0.        0.       ; 0.000448   0.0930429  0.         0.00026325; 5.46560e-08 1.01733e-05 8.77036e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR377
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC76]
	block = 'MNRC76'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00053349 0.00017195 0.00268917 0.0448561 '
	ref_diffusivity = '2.81563  1.13436  0.753634 0.254609'
	ref_sigma_r = '0.0770786 0.0919181 0.108048  0.0881201'
	chi = '7.61994e-01 2.37827e-01 1.79251e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0758955 0.        0.        0.       ; 0.00041982 0.090071   0.         0.00027561; 2.97926e-08 1.00977e-05 7.45356e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNRC76
	normalization_factors_uo = total

[]
[./mat_gcu_MNR395]
	block = 'MNR395'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00126188 0.00060166 0.00895199 0.111702  '
	ref_diffusivity = '2.89132  1.14164  0.760981 0.250136'
	ref_sigma_r = '0.0796518 0.0924065 0.098668  0.0723366'
	chi = '7.61386e-01 2.38446e-01 1.67219e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0783659 0.        0.        0.       ; 0.0004501  0.0918894  0.         0.00027934; 4.88055e-08 9.46009e-06 8.74362e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR395
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC80]
	block = 'MNRC80'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00064657 0.00026005 0.0037687  0.0482946 '
	ref_diffusivity = '2.86008  1.13385  0.749819 0.236401'
	ref_sigma_r = '0.0782188 0.0941123 0.0965051 0.0451566'
	chi = '7.61860e-01 2.37970e-01 1.69824e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '2.e-06 0.e+00 0.e+00 0.e+00; 0.0771616 0.        0.        0.       ; 0.00044502 0.0938228  0.         0.00020995; 2.58654e-08 1.04256e-05 9.00098e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNRC80
	normalization_factors_uo = total

[]
[./mat_gcu_MNR387]
	block = 'MNR387'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00121069 0.0005267  0.0078358  0.100761  '
	ref_diffusivity = '2.89281  1.14331  0.76064  0.245815'
	ref_sigma_r = '0.0793268 0.0917644 0.0989109 0.067616 '
	chi = '7.61774e-01 2.38047e-01 1.78889e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '5.e-06 0.e+00 0.e+00 0.e+00; 0.0780618 0.        0.        0.       ; 0.00044565 0.0912814  0.         0.00023644; 1.55179e-08 9.59761e-06 8.78773e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR387
	normalization_factors_uo = total

[]
[./mat_gcu_D9graph]
	block = 'D9graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0. 0. 0.'
	ref_diffusivity = '2.46472  1.02499  0.760059 0.329219'
	ref_sigma_r = '0.0476189 0.0588576 0.0584447 0.0077221'
	chi = '0. 0. 0. 0.'
	ref_k = 1
	ref_sigma_s = '0. 0. 0. 0.; 0.0471588 0.        0.        0.       ; 2.37573e-04 5.88353e-02 0.00000e+00 4.04370e-05; 0.00000e+00 5.95545e-06 5.80037e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_D9graph
	normalization_factors_uo = total

[]
[./mat_gcu_D8graph]
	block = 'D8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0. 0. 0.'
	ref_diffusivity = '2.39627  1.02464  0.75877  0.332446'
	ref_sigma_r = '0.0493164  0.0573411  0.055143   0.00767105'
	chi = '0. 0. 0. 0.'
	ref_k = 1
	ref_sigma_s = '0. 0. 0. 0.; 0.0488897 0.        0.        0.       ; 2.21207e-04 5.73167e-02 0.00000e+00 7.18568e-05; 8.78387e-08 6.94469e-06 5.47364e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_D8graph
	normalization_factors_uo = total

[]
[./mat_gcu_D7rifl]
	block = 'D7rifl'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0. 0. 0.'
	ref_diffusivity = '4.82528  1.68541  0.978847 0.279524'
	ref_sigma_r = '0.0626009 0.0869276 0.0819643 0.0113744'
	chi = '0. 0. 0. 0.'
	ref_k = 1
	ref_sigma_s = '4.e-07 0.e+00 0.e+00 0.e+00; 0.0620093 0.        0.        0.       ; 0.00038518 0.0869003  0.         0.00010123; 0.00000e+00 9.13511e-06 8.13642e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_D7rifl
	normalization_factors_uo = total

[]
[./mat_gcu_MNR392]
	block = 'MNR392'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00124675 0.00056911 0.00845899 0.106887  '
	ref_diffusivity = '2.89638  1.14131  0.759922 0.246067'
	ref_sigma_r = '0.0795445 0.0925191 0.0988917 0.0705371'
	chi = '7.61758e-01 2.38070e-01 1.72027e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '5.e-06 0.e+00 0.e+00 0.e+00; 0.0782693 0.        0.        0.       ; 0.00044754 0.0920172  0.         0.00024938; 5.86080e-08 1.11977e-05 8.77465e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR392
	normalization_factors_uo = total

[]
[./mat_gcu_MNR381]
	block = 'MNR381'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00116358 0.00046448 0.00694119 0.0932238 '
	ref_diffusivity = '2.89549 1.13844 0.7585  0.24723'
	ref_sigma_r = '0.0796499 0.0930476 0.099489  0.0647432'
	chi = '7.61860e-01 2.37963e-01 1.76743e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0783976 0.        0.        0.       ; 0.00045048 0.0925902  0.         0.00022488; 5.54708e-08 1.03600e-05 8.85510e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR381
	normalization_factors_uo = total

[]
[./mat_gcu_MNR391]
	block = 'MNR391'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00121276 0.00054046 0.00806397 0.103344  '
	ref_diffusivity = '2.89294  1.13922  0.758902 0.247968'
	ref_sigma_r = '0.0798153 0.0932952 0.0986463 0.0690964'
	chi = '7.61844e-01 2.37984e-01 1.72322e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0785479 0.        0.        0.       ; 0.00045391 0.0928049  0.         0.00026715; 9.42024e-09 9.72474e-06 8.75511e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR391
	normalization_factors_uo = total

[]
[./mat_gcu_MNR388]
	block = 'MNR388'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00119945 0.00052902 0.0079356  0.102222  '
	ref_diffusivity = '2.89028  1.14023  0.75999  0.248824'
	ref_sigma_r = '0.0796684 0.0930598 0.0987025 0.0685463'
	chi = '7.61978e-01 2.37849e-01 1.73651e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0784105 0.        0.        0.       ; 0.00045174 0.0925713  0.         0.00026954; 2.65702e-08 9.84645e-06 8.76431e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR388
	normalization_factors_uo = total

[]
[./mat_gcu_MNR378]
	block = 'MNR378'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00114135 0.0004538  0.00683909 0.0919049 '
	ref_diffusivity = '2.89118  1.13801  0.758752 0.247173'
	ref_sigma_r = '0.0799391 0.0938609 0.0989833 0.0639552'
	chi = '7.62079e-01 2.37748e-01 1.73408e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0786982 0.        0.        0.       ; 0.00045145 0.093407   0.         0.00025303; 3.35166e-08 1.04184e-05 8.80709e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR378
	normalization_factors_uo = total

[]
[./mat_gcu_MNR390]
	block = 'MNR390'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00123515 0.00055062 0.00817328 0.103626  '
	ref_diffusivity = '2.8962  1.14273 0.7606  0.24562'
	ref_sigma_r = '0.079327  0.091863  0.0991746 0.0689199'
	chi = '7.61727e-01 2.38093e-01 1.79877e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0780486 0.        0.        0.       ; 0.00044749 0.0913642  0.         0.00023534; 1.52811e-08 1.04796e-05 8.80509e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR390
	normalization_factors_uo = total

[]
[./mat_gcu_C9rifl]
	block = 'C9rifl'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0. 0. 0.'
	ref_diffusivity = '4.93574  1.64449  0.964011 0.266157'
	ref_sigma_r = '0.0609695 0.0934219 0.0932386 0.011647 '
	chi = '0. 0. 0. 0.'
	ref_k = 1
	ref_sigma_s = '7.e-07 0.e+00 0.e+00 0.e+00; 0.0603347 0.        0.        0.       ; 3.84344e-04 9.33930e-02 0.00000e+00 3.93508e-05; 0.00000e+00 1.00638e-05 9.26117e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_C9rifl
	normalization_factors_uo = total

[]
[./mat_gcu_C8graph]
	block = 'C8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0. 0. 0.'
	ref_diffusivity = '2.39149  1.02833  0.759329 0.334241'
	ref_sigma_r = '0.0499834  0.0564769  0.0536948  0.00763742'
	chi = '0. 0. 0. 0.'
	ref_k = 1
	ref_sigma_s = '1.e-06 0.e+00 0.e+00 0.e+00; 0.0495532 0.        0.        0.       ; 2.23947e-04 5.64532e-02 0.00000e+00 7.53974e-05; 0.00000e+00 5.38488e-06 5.32920e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_C8graph
	normalization_factors_uo = total

[]
[./mat_gcu_MNR379]
	block = 'MNR379'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00113668 0.0004286  0.00643116 0.0875189 '
	ref_diffusivity = '2.8918   1.13785  0.758587 0.244759'
	ref_sigma_r = '0.079846  0.0931736 0.0995468 0.0619485'
	chi = '7.62025e-01 2.37803e-01 1.72083e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '3.e-06 0.e+00 0.e+00 0.e+00; 0.078613 0.       0.       0.      ; 0.00045317 0.0927292  0.         0.00020863; 2.22076e-08 9.91170e-06 8.86737e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR379
	normalization_factors_uo = total

[]
[./mat_gcu_MNR393]
	block = 'MNR393'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.0012711  0.00058867 0.00873176 0.10937   '
	ref_diffusivity = '2.89713  1.14272  0.760527 0.243427'
	ref_sigma_r = '0.0793921 0.0918247 0.0989991 0.0716701'
	chi = '7.61575e-01 2.38253e-01 1.71546e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '5.e-06 0.e+00 0.e+00 0.e+00; 0.0781017 0.        0.        0.       ; 0.00045367 0.0913112  0.         0.0002382 ; 4.42872e-08 9.70428e-06 8.77916e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR393
	normalization_factors_uo = total

[]
[./mat_gcu_010400]
	block = 'u10400'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0. 0. 0.'
	ref_diffusivity = '2.96036  1.02956  0.60422  0.171776'
	ref_sigma_r = '0.102678  0.144027  0.135959  0.0181258'
	chi = '0. 0. 0. 0.'
	ref_k = 1
	ref_sigma_s = '1.e-06 0.e+00 0.e+00 0.e+00; 0.101697 0.       0.       0.      ; 6.27050e-04 1.43987e-01 0.00000e+00 1.38013e-04; 3.91069e-08 1.54589e-05 1.34988e-01 0.00000e+00'
	sph_factors_uo = uo_gcu_010400
	normalization_factors_uo = total

[]
[./mat_gcu_MNR384]
	block = 'MNR384'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00121321 0.00052938 0.0078946  0.102199  '
	ref_diffusivity = '2.89451  1.1415   0.759781 0.244681'
	ref_sigma_r = '0.0794907 0.0925532 0.0991128 0.0687536'
	chi = '7.61890e-01 2.37935e-01 1.75247e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '5.e-06 0.e+00 0.e+00 0.e+00; 0.0782223 0.        0.        0.       ; 0.00045262 0.0920713  0.         0.0002445 ; 2.05355e-08 9.65836e-06 8.80462e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR384
	normalization_factors_uo = total

[]
[./mat_gcu_MNR383]
	block = 'MNR383'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.0011394  0.00045984 0.00692504 0.092327  '
	ref_diffusivity = '2.89104  1.13952  0.760652 0.248224'
	ref_sigma_r = '0.0795075 0.0934458 0.0987057 0.0641661'
	chi = '7.62016e-01 2.37810e-01 1.74364e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0782716 0.        0.        0.       ; 0.00044759 0.0929912  0.         0.00025686; 3.13461e-08 9.56530e-06 8.77479e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR383
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC74]
	block = 'MNRC74'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00049541 0.00013985 0.00219501 0.037918  '
	ref_diffusivity = '2.81407  1.13511  0.754934 0.253701'
	ref_sigma_r = '0.0767822 0.0918608 0.108383  0.0851779'
	chi = '7.62371e-01 2.37454e-01 1.75439e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '3.e-06 0.e+00 0.e+00 0.e+00; 0.0756098 0.        0.        0.       ; 0.00041517 0.0899854  0.         0.00026393; 1.75753e-08 1.02313e-05 7.44537e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNRC74
	normalization_factors_uo = total

[]
[./mat_gcu_MNR361]
	block = 'MNR361'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00103737 0.00033237 0.00500693 0.0709388 '
	ref_diffusivity = '2.89578  1.14036  0.761559 0.242675'
	ref_sigma_r = '0.0788935 0.0932566 0.0993743 0.0543969'
	chi = '7.62390e-01 2.37430e-01 1.80917e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0776898 0.        0.        0.       ; 0.00044609 0.0928582  0.         0.00020216; 0.00000e+00 1.05521e-05 8.87050e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR361
	normalization_factors_uo = total

[]
[./mat_gcu_B9plug]
	block = 'B9plug'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0. 0. 0.'
	ref_diffusivity = '3.04976  0.988524 0.553759 0.150464'
	ref_sigma_r = '0.10767   0.167465  0.165881  0.0191128'
	chi = '0. 0. 0. 0.'
	ref_k = 1
	ref_sigma_s = '0. 0. 0. 0.; 0.106571 0.       0.       0.      ; 6.71188e-04 1.67431e-01 0.00000e+00 6.07694e-05; 0.00000e+00 1.92243e-05 1.64810e-01 0.00000e+00'
	sph_factors_uo = uo_gcu_B9plug
	normalization_factors_uo = total

[]
[./mat_gcu_B8graph]
	block = 'B8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0. 0. 0.'
	ref_diffusivity = '2.39345  1.02895  0.759085 0.334437'
	ref_sigma_r = '0.0498854  0.0561586  0.0535234  0.00762015'
	chi = '0. 0. 0. 0.'
	ref_k = 1
	ref_sigma_s = '0. 0. 0. 0.; 0.0494451 0.        0.        0.       ; 2.28604e-04 5.61370e-02 0.00000e+00 7.85885e-05; 0.00000e+00 6.53769e-06 5.31288e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_B8graph
	normalization_factors_uo = total

[]
[./mat_gcu_MNR398]
	block = 'MNR398'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00129354 0.00060891 0.00897931 0.112249  '
	ref_diffusivity = '2.89221  1.14153  0.760865 0.247928'
	ref_sigma_r = '0.0797685 0.092141  0.0989917 0.0722453'
	chi = '7.61631e-01 2.38194e-01 1.75807e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '5.e-06 0.e+00 0.e+00 0.e+00; 0.0784636 0.        0.        0.       ; 0.00045362 0.0916105  0.         0.00023256; 0.00000e+00 9.36636e-06 8.77583e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR398
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC79]
	block = 'MNRC79'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00061655 0.00025387 0.0038956  0.0615524 '
	ref_diffusivity = '2.82098  1.13727  0.753939 0.255078'
	ref_sigma_r = '0.076855  0.090713  0.107699  0.0947245'
	chi = '7.62235e-01 2.37601e-01 1.63319e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.075634 0.       0.       0.      ; 0.00042259 0.0888281  0.         0.00027643; 0.00000e+00 9.31918e-06 7.41493e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNRC79
	normalization_factors_uo = total

[]
[./mat_gcu_MNR385]
	block = 'MNR385'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00122697 0.00053275 0.00791601 0.102137  '
	ref_diffusivity = '2.89937  1.14011  0.76037  0.249343'
	ref_sigma_r = '0.0794235 0.0923572 0.0992967 0.0685126'
	chi = '7.61910e-01 2.37916e-01 1.73437e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '5.e-06 0.e+00 0.e+00 0.e+00; 0.0781428 0.        0.        0.       ; 0.00045302 0.0918629  0.         0.00023264; 1.56019e-08 9.85605e-06 8.82609e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR385
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC78]
	block = 'MNRC78'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00055543 0.00019217 0.00298735 0.0494075 '
	ref_diffusivity = '2.81749  1.13638  0.754151 0.254062'
	ref_sigma_r = '0.0767918 0.0912621 0.108245  0.0896332'
	chi = '7.62184e-01 2.37652e-01 1.63526e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0756017 0.        0.        0.       ; 0.00041996 0.0893958  0.         0.00026407; 5.48047e-08 9.65915e-06 7.45696e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNRC78
	normalization_factors_uo = total

[]
[./mat_gcu_MNR358]
	block = 'MNR358'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00104644 0.00035167 0.00533536 0.0751701 '
	ref_diffusivity = '2.88964  1.13738  0.760262 0.245744'
	ref_sigma_r = '0.0795761 0.0941853 0.0989996 0.0564438'
	chi = '7.62482e-01 2.37349e-01 1.69057e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '5.e-06 0.e+00 0.e+00 0.e+00; 0.0783759 0.        0.        0.       ; 0.00044952 0.0937766  0.         0.00023262; 4.39169e-08 1.03476e-05 8.82903e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR358
	normalization_factors_uo = total

[]
[./mat_gcu_MNR373]
	block = 'MNR373'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00109532 0.00039531 0.00596064 0.082228  '
	ref_diffusivity = '2.88456  1.133    0.759195 0.244804'
	ref_sigma_r = '0.0802953 0.0947451 0.0988645 0.0596044'
	chi = '7.62202e-01 2.37628e-01 1.70023e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0790675 0.        0.        0.       ; 0.00045878 0.0943181  0.         0.00022808; 3.52784e-08 1.06594e-05 8.80361e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR373
	normalization_factors_uo = total

[]
[./mat_gcu_MNR365]
	block = 'MNR365'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00108711 0.00037791 0.00567099 0.0783033 '
	ref_diffusivity = '2.89422  1.14009  0.760272 0.242387'
	ref_sigma_r = '0.079301  0.0929471 0.0995281 0.0576766'
	chi = '7.62281e-01 2.37548e-01 1.71468e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '5.e-06 0.e+00 0.e+00 0.e+00; 0.0780674 0.        0.        0.       ; 0.00045427 0.0925292  0.         0.0001988 ; 2.54937e-08 9.99067e-06 8.87066e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR365
	normalization_factors_uo = total

[]
[./mat_gcu_A9plug]
	block = 'A9plug'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0. 0. 0.'
	ref_diffusivity = '3.10842  0.99144  0.553756 0.149958'
	ref_sigma_r = '0.104523  0.164804  0.166064  0.0191721'
	chi = '0. 0. 0. 0.'
	ref_k = 1
	ref_sigma_s = '0. 0. 0. 0.; 0.103401 0.       0.       0.      ; 6.55641e-04 1.64771e-01 0.00000e+00 5.15890e-05; 0.00000e+00 1.83153e-05 1.64974e-01 0.00000e+00'
	sph_factors_uo = uo_gcu_A9plug
	normalization_factors_uo = total

[]
[./mat_gcu_A8graph]
	block = 'A8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0. 0. 0.'
	ref_diffusivity = '2.41974  1.0269   0.75968  0.331325'
	ref_sigma_r = '0.0484076  0.0571887  0.0557703  0.00767815'
	chi = '0. 0. 0. 0.'
	ref_k = 1
	ref_sigma_s = '0. 0. 0. 0.; 0.0479556 0.        0.        0.       ; 2.26867e-04 5.71641e-02 0.00000e+00 5.54623e-05; 1.66141e-07 5.22719e-06 5.53520e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_A8graph
	normalization_factors_uo = total

[]
[./mat_gcu_A7rifl]
	block = 'A7rifl'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0. 0. 0.'
	ref_diffusivity = '4.86455  1.68935  0.981041 0.276818'
	ref_sigma_r = '0.0619334 0.0870896 0.0829542 0.0114158'
	chi = '0. 0. 0. 0.'
	ref_k = 1
	ref_sigma_s = '2.e-07 0.e+00 0.e+00 0.e+00; 0.0613436 0.        0.        0.       ; 3.74599e-04 8.70609e-02 0.00000e+00 8.30293e-05; 6.66237e-08 8.98664e-06 8.23541e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_A7rifl
	normalization_factors_uo = total

[]
[./mat_gcu_MNR397]
	block = 'MNR397'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00130345 0.00060795 0.00896263 0.111171  '
	ref_diffusivity = '2.89942  1.14259  0.760405 0.244937'
	ref_sigma_r = '0.0795359 0.0919336 0.0992169 0.0718862'
	chi = '7.61917e-01 2.37910e-01 1.73042e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '5.e-06 0.e+00 0.e+00 0.e+00; 0.0782332 0.        0.        0.       ; 0.00044844 0.0914098  0.         0.00022861; 5.44790e-08 1.09631e-05 8.79653e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR397
	normalization_factors_uo = total

[]
[./mat_gcu_MNR376]
	block = 'MNR376'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00112234 0.00041745 0.00627608 0.0852417 '
	ref_diffusivity = '2.89925  1.13951  0.759322 0.245443'
	ref_sigma_r = '0.0793687 0.0929016 0.0993554 0.0608869'
	chi = '7.61870e-01 2.37955e-01 1.75260e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '3.e-06 0.e+00 0.e+00 0.e+00; 0.0781442 0.        0.        0.       ; 0.00044825 0.0924716  0.         0.0002147 ; 6.75290e-08 1.00368e-05 8.84389e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR376
	normalization_factors_uo = total

[]
[./mat_gcu_MNR366]
	block = 'MNR366'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00104755 0.00033298 0.00501724 0.0709306 '
	ref_diffusivity = '2.89849  1.13659  0.758077 0.242535'
	ref_sigma_r = '0.0795757 0.0943302 0.0996696 0.0544988'
	chi = '7.62284e-01 2.37538e-01 1.77902e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '5.e-06 0.e+00 0.e+00 0.e+00; 0.0783683 0.        0.        0.       ; 0.00044925 0.0939328  0.         0.00019549; 0.00000e+00 9.89674e-06 8.89542e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR366
	normalization_factors_uo = total

[]
[./mat_gcu_MNR362]
	block = 'MNR362'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00103612 0.0003119  0.00470528 0.0675564 '
	ref_diffusivity = '2.8882   1.13438  0.759173 0.241641'
	ref_sigma_r = '0.0798686 0.0942155 0.100079  0.0531011'
	chi = '7.62647e-01 2.37183e-01 1.69698e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0786687 0.        0.        0.       ; 0.00045181 0.0938262  0.         0.00017674; 0.00000e+00 9.55453e-06 8.93935e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR362
	normalization_factors_uo = total

[]
[./mat_gcu_010500]
	block = 'u10500'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0. 0. 0.'
	ref_diffusivity = '1.78678  0.690046 0.49539  0.303033'
	ref_sigma_r = '0.0671272  0.0466173  0.0450159  0.00605525'
	chi = '0. 0. 0. 0.'
	ref_k = 1
	ref_sigma_s = '0.004034 0.       0.       0.      ; 0.0700851 0.        0.        0.       ; 0.0001563  0.0466078  0.         0.00012793; 0.00000e+00 3.01174e-06 4.47274e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_010500
	normalization_factors_uo = total

[]
[./mat_gcu_MNR369]
	block = 'MNR369'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00111766 0.00038057 0.00566688 0.0784673 '
	ref_diffusivity = '2.88615  1.13822  0.760318 0.239788'
	ref_sigma_r = '0.0796716 0.0924788 0.100052  0.0577783'
	chi = '7.62478e-01 2.37349e-01 1.73392e-04 0.00000e+00'
	ref_k = 1
	ref_sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0784276 0.        0.        0.       ; 0.00045619 0.0920599  0.         0.00016385; 0.00000e+00 1.03842e-05 8.92541e-02 0.00000e+00'
	sph_factors_uo = uo_gcu_MNR369
	normalization_factors_uo = total

[]
[]


	

[UserObjects]
[./uo_gcu_F9plug]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 26.37532633  27.85091669  37.66524831 427.54074012'
	block  = F9plug 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_F8graph]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '114.13619801 139.12165585 165.75907972 986.35571029'
	block  = F8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_F7rifl]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 294.66010579  333.57078712  363.33388855 1300.4053975 '
	block  = F7rifl 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR396]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '749.38759428 743.8966978  639.03654506 948.83536716'
	block  = MNR396 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR375]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 993.22520225 1011.47339117  891.30307838 1395.13158175'
	block  = MNR375 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR374]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '1092.11770402 1130.06313366 1017.74400434 1606.4629886 '
	block  = MNR374 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR372]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '1314.94523503 1344.18226254 1182.39104835 1820.96493019'
	block  = MNR372 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR382]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '1276.22478579 1285.07644911 1108.6397129  1677.06727474'
	block  = MNR382 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR389]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 919.7603892   907.74993385  770.37888289 1233.03270827'
	block  = MNR389 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_E9rifl]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 48.62332098  54.74996839  73.41056168 678.66353239'
	block  = E9rifl 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_E8graph]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 203.26157391  252.09743814  276.90511117 1233.19710637'
	block  = E8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR394]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '710.86442276 697.48241756 598.20710307 997.56061496'
	block  = MNR394 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC77]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '836.7205612  966.26156558 874.60258014 911.92564555'
	block  = MNRC77 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR377]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '1427.59316054 1496.40081032 1328.13231106 1681.18662137'
	block  = MNR377 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC76]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '1310.14481056 1536.79577162 1404.52810735 1414.38025052'
	block  = MNRC76 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR395]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '1991.99062042 2053.8794588  1762.84080826 2093.83289378'
	block  = MNR395 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC80]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '1504.79685605 1646.79219066 1554.35583706 2656.27401629'
	block  = MNRC80 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR387]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '1252.75343443 1267.73949537 1080.53938081 1525.64723201'
	block  = MNR387 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_D9graph]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 59.61309899  71.98382104  94.84055836 819.58793081'
	block  = D9graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_D8graph]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 224.99993445  291.48722249  344.01006636 1578.53175169'
	block  = D8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_D7rifl]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 585.96179329  679.60999572  726.08298957 2067.62783691'
	block  = D7rifl 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR392]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '1339.40062642 1366.74237872 1176.74279941 1552.34783172'
	block  = MNR392 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR381]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '1757.90886531 1793.05717873 1565.82612724 2325.99588823'
	block  = MNR381 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR391]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '2072.37894195 2156.24545754 1873.78838773 2289.12139477'
	block  = MNR391 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR388]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '2192.84751986 2281.83151339 1982.12673452 2422.68780402'
	block  = MNR388 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR378]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '1739.29665204 1828.76914278 1619.13573343 2128.2061876 '
	block  = MNR378 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR390]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '1268.0330634  1282.11728334 1098.92848238 1556.32861424'
	block  = MNR390 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_C9rifl]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 59.01187166  67.81327614  91.1392526  792.43171351'
	block  = C9rifl 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_C8graph]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 252.88654901  321.80692891  356.78145006 1440.49371417'
	block  = C8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR379]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 876.51429517  899.33275121  788.95821655 1274.93543499'
	block  = MNR379 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR393]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '1315.41964097 1328.09708289 1132.53380222 1573.65852235'
	block  = MNR393 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_010400]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '1000.95895851 1162.32978327 1300.97609376 4501.1964465 '
	block  = u10400 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR384]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '1889.58939352 1939.03564441 1681.33927675 2284.52999074'
	block  = MNR384 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR383]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '1863.38903374 1953.42987219 1727.2814996  2213.76600359'
	block  = MNR383 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC74]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '1106.79375712 1308.97758406 1212.53461395 1296.92720345'
	block  = MNRC74 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR361]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 946.28249955  981.86059657  886.57780733 1463.64801205'
	block  = MNR361 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_B9plug]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 40.43018946  45.60215364  62.28644693 621.51640487'
	block  = B9plug 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_B8graph]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 217.18468371  273.27426175  298.32853193 1217.02737913'
	block  = B8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR398]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '737.77874    744.12685514 636.30753663 905.02797105'
	block  = MNR398 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC79]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '819.52217157 929.65950327 821.06046806 824.45176598'
	block  = MNRC79 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR385]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '1252.72290336 1263.50037298 1094.87489499 1589.86817485'
	block  = MNR385 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC78]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '1065.7083238  1229.70247251 1115.40117183 1193.68050062'
	block  = MNRC78 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR358]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '1334.38648443 1420.23986846 1284.75704709 1855.71633963'
	block  = MNR358 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR373]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '1095.08626397 1185.52635494 1070.71307162 1561.26525428'
	block  = MNR373 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR365]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 763.51878511  785.59275262  697.55522243 1174.59622995'
	block  = MNR365 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_A9plug]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 26.17546521  27.70507209  36.78689275 410.236666  '
	block  = A9plug 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_A8graph]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 117.00964191  145.29503929  174.65794878 1023.40164747'
	block  = A8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_A7rifl]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 295.91892552  337.83809204  369.51760559 1319.94763431'
	block  = A7rifl 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR397]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '708.91043393 705.07526115 604.00331031 896.31017475'
	block  = MNR397 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR376]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 863.36949294  880.67826414  773.13607386 1216.6704004 '
	block  = MNR376 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR366]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 831.60073471  865.52780511  786.09534109 1341.72568524'
	block  = MNR366 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR362]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 832.77265829  880.12635624  800.26880571 1531.6688995 '
	block  = MNR362 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_010500]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = ' 462.22873886  678.84202175  668.62820276 1935.93556598'
	block  = u10500 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR369]
	type = SPHFactorsUserObject
	var_size = 4
	variable = flux 
	ref_fluxes = '489.54230863 497.02711919 437.91660867 921.9727179 '
	block  = MNR369 
	execute_on = 'LINEAR' 
[]
[./total]
	type = NormalizationFactorsUserObject
	SPH_user_objects = 'uo_gcu_F9plug uo_gcu_F8graph uo_gcu_F7rifl uo_gcu_MNR396 uo_gcu_MNR375 uo_gcu_MNR374 uo_gcu_MNR372 uo_gcu_MNR382 uo_gcu_MNR389 uo_gcu_E9rifl uo_gcu_E8graph uo_gcu_MNR394 uo_gcu_MNRC77 uo_gcu_MNR377 uo_gcu_MNRC76 uo_gcu_MNR395 uo_gcu_MNRC80 uo_gcu_MNR387 uo_gcu_D9graph uo_gcu_D8graph uo_gcu_D7rifl uo_gcu_MNR392 uo_gcu_MNR381 uo_gcu_MNR391 uo_gcu_MNR388 uo_gcu_MNR378 uo_gcu_MNR390 uo_gcu_C9rifl uo_gcu_C8graph uo_gcu_MNR379 uo_gcu_MNR393 uo_gcu_010400 uo_gcu_MNR384 uo_gcu_MNR383 uo_gcu_MNRC74 uo_gcu_MNR361 uo_gcu_B9plug uo_gcu_B8graph uo_gcu_MNR398 uo_gcu_MNRC79 uo_gcu_MNR385 uo_gcu_MNRC78 uo_gcu_MNR358 uo_gcu_MNR373 uo_gcu_MNR365 uo_gcu_A9plug uo_gcu_A8graph uo_gcu_A7rifl uo_gcu_MNR397 uo_gcu_MNR376 uo_gcu_MNR366 uo_gcu_MNR362 uo_gcu_010500 uo_gcu_MNR369 '
	ref_integrals = '48572.73474192 51505.05148393 46521.67236196 79711.50630511'
	execute_on = 'LINEAR' 
[]
[./output]
	type = OutputUserObject
	SPH_uo_names = 'uo_gcu_A9plug uo_gcu_B9plug uo_gcu_C9rifl uo_gcu_D9graph uo_gcu_E9rifl uo_gcu_F9plug uo_gcu_A8graph uo_gcu_B8graph uo_gcu_C8graph uo_gcu_D8graph uo_gcu_E8graph uo_gcu_F8graph uo_gcu_A7rifl uo_gcu_MNR398 uo_gcu_MNR379 uo_gcu_D7rifl uo_gcu_MNR394 uo_gcu_F7rifl uo_gcu_MNR397 uo_gcu_MNRC79 uo_gcu_MNR393 uo_gcu_MNR392 uo_gcu_MNRC77 uo_gcu_MNR396 uo_gcu_MNR376 uo_gcu_MNR385 uo_gcu_010400 uo_gcu_MNR381 uo_gcu_MNR377 uo_gcu_MNR375 uo_gcu_MNR366 uo_gcu_MNRC78 uo_gcu_MNR384 uo_gcu_MNR391 uo_gcu_MNRC76 uo_gcu_MNR374 uo_gcu_MNR362 uo_gcu_MNR358 uo_gcu_MNR383 uo_gcu_MNR388 uo_gcu_MNR395 uo_gcu_MNR372 uo_gcu_010500 uo_gcu_MNR373 uo_gcu_MNRC74 uo_gcu_MNR378 uo_gcu_MNRC80 uo_gcu_MNR382 uo_gcu_MNR369 uo_gcu_MNR365 uo_gcu_MNR361 uo_gcu_MNR390 uo_gcu_MNR387 uo_gcu_MNR389 '
	execute_on = 'TIMESTEP_END'
	normalization_uo_name = total
	surface_integrators = 'alb_0 alb_1 alb_2 alb_3'
	ref_surface_integrals = '641.61524666 389.23833175 186.42955718 -40.54691211' 
[]
[]


[ICs]
[./IC_gcu_F9plug]
	type = ArrayConstantIC
	variable = flux 
	value = '0.00585963 0.00618745 0.00836783 0.0949838 '
	block  = F9plug 
[]
[./IC_gcu_F8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.02535686 0.03090771 0.03682556 0.2191319 '
	block  = F8graph 
[]
[./IC_gcu_F7rifl]
	type = ArrayConstantIC
	variable = flux 
	value = '0.06546262 0.07410714 0.0807194  0.28890216'
	block  = F7rifl 
[]
[./IC_gcu_MNR396]
	type = ArrayConstantIC
	variable = flux 
	value = '0.16648631 0.16526644 0.14197037 0.21079626'
	block  = MNR396 
[]
[./IC_gcu_MNR375]
	type = ArrayConstantIC
	variable = flux 
	value = '0.22065804 0.22471212 0.1980147  0.30994683'
	block  = MNR375 
[]
[./IC_gcu_MNR374]
	type = ArrayConstantIC
	variable = flux 
	value = '0.24262831 0.25105839 0.22610522 0.35689688'
	block  = MNR374 
[]
[./IC_gcu_MNR372]
	type = ArrayConstantIC
	variable = flux 
	value = '0.29213238 0.29862777 0.26268372 0.40455131'
	block  = MNR372 
[]
[./IC_gcu_MNR382]
	type = ArrayConstantIC
	variable = flux 
	value = '0.28353012 0.28549664 0.2462989  0.37258256'
	block  = MNR382 
[]
[./IC_gcu_MNR389]
	type = ArrayConstantIC
	variable = flux 
	value = '0.20433687 0.20166859 0.1711498  0.27393444'
	block  = MNR389 
[]
[./IC_gcu_E9rifl]
	type = ArrayConstantIC
	variable = flux 
	value = '0.01080231 0.01216343 0.01630912 0.15077403'
	block  = E9rifl 
[]
[./IC_gcu_E8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.04515723 0.05600676 0.06151811 0.27397096'
	block  = E8graph 
[]
[./IC_gcu_MNR394]
	type = ArrayConstantIC
	variable = flux 
	value = '0.15792788 0.15495489 0.13289958 0.22162121'
	block  = MNR394 
[]
[./IC_gcu_MNRC77]
	type = ArrayConstantIC
	variable = flux 
	value = '0.18588848 0.21466772 0.19430447 0.20259628'
	block  = MNRC77 
[]
[./IC_gcu_MNR377]
	type = ArrayConstantIC
	variable = flux 
	value = '0.3171586  0.33244512 0.29506206 0.37349772'
	block  = MNR377 
[]
[./IC_gcu_MNRC76]
	type = ArrayConstantIC
	variable = flux 
	value = '0.2910659  0.3414194  0.31203439 0.31422318'
	block  = MNRC76 
[]
[./IC_gcu_MNR395]
	type = ArrayConstantIC
	variable = flux 
	value = '0.44254692 0.45629634 0.39163827 0.46517252'
	block  = MNR395 
[]
[./IC_gcu_MNRC80]
	type = ArrayConstantIC
	variable = flux 
	value = '0.33431042 0.36585655 0.3453206  0.59012621'
	block  = MNRC80 
[]
[./IC_gcu_MNR387]
	type = ArrayConstantIC
	variable = flux 
	value = '0.27831565 0.281645   0.24005604 0.3389426 '
	block  = MNR387 
[]
[./IC_gcu_D9graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.01324383 0.01599215 0.02107008 0.18208224'
	block  = D9graph 
[]
[./IC_gcu_D8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.0499867  0.06475772 0.07642636 0.35069159'
	block  = D8graph 
[]
[./IC_gcu_D7rifl]
	type = ArrayConstantIC
	variable = flux 
	value = '0.13017912 0.1509843  0.16130889 0.45935072'
	block  = D7rifl 
[]
[./IC_gcu_MNR392]
	type = ArrayConstantIC
	variable = flux 
	value = '0.29756547 0.3036398  0.26142889 0.34487449'
	block  = MNR392 
[]
[./IC_gcu_MNR381]
	type = ArrayConstantIC
	variable = flux 
	value = '0.39054258 0.39835124 0.34786887 0.51675058'
	block  = MNR381 
[]
[./IC_gcu_MNR391]
	type = ArrayConstantIC
	variable = flux 
	value = '0.46040624 0.47903829 0.41628674 0.50855843'
	block  = MNR391 
[]
[./IC_gcu_MNR388]
	type = ArrayConstantIC
	variable = flux 
	value = '0.48716992 0.50693889 0.44035553 0.53823196'
	block  = MNR388 
[]
[./IC_gcu_MNR378]
	type = ArrayConstantIC
	variable = flux 
	value = '0.38640763 0.40628512 0.3597123  0.472809  '
	block  = MNR378 
[]
[./IC_gcu_MNR390]
	type = ArrayConstantIC
	variable = flux 
	value = '0.28171022 0.28483922 0.24414142 0.34575887'
	block  = MNR390 
[]
[./IC_gcu_C9rifl]
	type = ArrayConstantIC
	variable = flux 
	value = '0.01311026 0.01506561 0.02024778 0.17604913'
	block  = C9rifl 
[]
[./IC_gcu_C8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.05618207 0.07149364 0.07926369 0.32002463'
	block  = C8graph 
[]
[./IC_gcu_MNR379]
	type = ArrayConstantIC
	variable = flux 
	value = '0.19472918 0.1997986  0.17527745 0.28324368'
	block  = MNR379 
[]
[./IC_gcu_MNR393]
	type = ArrayConstantIC
	variable = flux 
	value = '0.29223778 0.29505424 0.25160728 0.34960894'
	block  = MNR393 
[]
[./IC_gcu_010400]
	type = ArrayConstantIC
	variable = flux 
	value = '0.2223762  0.25822685 0.28902895 1.        '
	block  = u10400 
[]
[./IC_gcu_MNR384]
	type = ArrayConstantIC
	variable = flux 
	value = '0.41979714 0.43078227 0.37353164 0.50753839'
	block  = MNR384 
[]
[./IC_gcu_MNR383]
	type = ArrayConstantIC
	variable = flux 
	value = '0.41397639 0.43398014 0.38373831 0.49181724'
	block  = MNR383 
[]
[./IC_gcu_MNRC74]
	type = ArrayConstantIC
	variable = flux 
	value = '0.24588879 0.29080659 0.26938051 0.28812944'
	block  = MNRC74 
[]
[./IC_gcu_MNR361]
	type = ArrayConstantIC
	variable = flux 
	value = '0.2102291  0.21813325 0.19696492 0.32516866'
	block  = MNR361 
[]
[./IC_gcu_B9plug]
	type = ArrayConstantIC
	variable = flux 
	value = '0.0089821  0.01013112 0.01383775 0.13807804'
	block  = B9plug 
[]
[./IC_gcu_B8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.04825043 0.06071147 0.06627761 0.27037864'
	block  = B8graph 
[]
[./IC_gcu_MNR398]
	type = ArrayConstantIC
	variable = flux 
	value = '0.16390725 0.16531757 0.14136409 0.20106387'
	block  = MNR398 
[]
[./IC_gcu_MNRC79]
	type = ArrayConstantIC
	variable = flux 
	value = '0.18206763 0.20653609 0.18240938 0.1831628 '
	block  = MNRC79 
[]
[./IC_gcu_MNR385]
	type = ArrayConstantIC
	variable = flux 
	value = '0.27830887 0.28070323 0.24324086 0.35321013'
	block  = MNR385 
[]
[./IC_gcu_MNRC78]
	type = ArrayConstantIC
	variable = flux 
	value = '0.23676112 0.27319458 0.24780104 0.26519183'
	block  = MNRC78 
[]
[./IC_gcu_MNR358]
	type = ArrayConstantIC
	variable = flux 
	value = '0.29645151 0.31552497 0.28542568 0.4122718 '
	block  = MNR358 
[]
[./IC_gcu_MNR373]
	type = ArrayConstantIC
	variable = flux 
	value = '0.24328782 0.26338027 0.23787299 0.34685561'
	block  = MNR373 
[]
[./IC_gcu_MNR365]
	type = ArrayConstantIC
	variable = flux 
	value = '0.16962574 0.17452976 0.15497107 0.260952  '
	block  = MNR365 
[]
[./IC_gcu_A9plug]
	type = ArrayConstantIC
	variable = flux 
	value = '0.00581522 0.00615505 0.00817269 0.09113947'
	block  = A9plug 
[]
[./IC_gcu_A8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.02599523 0.0322792  0.03880256 0.22736214'
	block  = A8graph 
[]
[./IC_gcu_A7rifl]
	type = ArrayConstantIC
	variable = flux 
	value = '0.06574228 0.07505518 0.0820932  0.29324373'
	block  = A7rifl 
[]
[./IC_gcu_MNR397]
	type = ArrayConstantIC
	variable = flux 
	value = '0.15749378 0.15664174 0.13418728 0.1991271 '
	block  = MNR397 
[]
[./IC_gcu_MNR376]
	type = ArrayConstantIC
	variable = flux 
	value = '0.19180889 0.19565426 0.17176235 0.27029933'
	block  = MNR376 
[]
[./IC_gcu_MNR366]
	type = ArrayConstantIC
	variable = flux 
	value = '0.18475104 0.19228839 0.17464142 0.29808201'
	block  = MNR366 
[]
[./IC_gcu_MNR362]
	type = ArrayConstantIC
	variable = flux 
	value = '0.1850114  0.19553165 0.17779024 0.34028039'
	block  = MNR362 
[]
[./IC_gcu_010500]
	type = ArrayConstantIC
	variable = flux 
	value = '0.10269019 0.15081368 0.14854455 0.43009355'
	block  = u10500 
[]
[./IC_gcu_MNR369]
	type = ArrayConstantIC
	variable = flux 
	value = '0.10875826 0.11042111 0.09728894 0.20482837'
	block  = MNR369 
[]
[]


