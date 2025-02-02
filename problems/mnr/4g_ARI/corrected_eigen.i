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
    components = 4
[../]
[]

[BCs]
[./albedo]
	variable = flux
	type = L2ArrayAlbedoBC
    gamma_factors = '0.679025 0.782709 1.36039 0.158057'
	boundary = 'north south west east bottom top'
	albedo_matrix = '0.0869676 0.        0.        0.       ; 0.137082 0.170448 0.       0.      ; 8.50043e-02 2.32033e-01 2.39851e-01 8.35499e-06; 0.101336 0.17025  0.38504  0.778011 '
[]
[]


[Materials]
[./gcu_F9plug]
	block = 'F9plug'
	type = CorrectedNuclearMaterial
	sph_factors = '0.651459 0.919054 1.09919  0.607363'
 	nu_sigma_f = '0. 0. 0. 0.'
	diffusivity = '3.10429  0.992023 0.553852 0.149901'
	sigma_r = '0.104618  0.166151  0.166128  0.0191639'
	chi = '0. 0. 0. 0.'
	sigma_s = '0. 0. 0. 0.; 0.103485 0.       0.       0.      ; 6.57390e-04 1.66127e-01 0.00000e+00 5.22700e-05; 0.00000e+00 1.60468e-05 1.65058e-01 0.00000e+00'
[]
[./gcu_F8graph]
	block = 'F8graph'
	type = CorrectedNuclearMaterial
	sph_factors = '0.653252 0.958806 1.14638  0.726819'
 	nu_sigma_f = '0. 0. 0. 0.'
	diffusivity = '2.42515  1.02587  0.759067 0.331316'
	sigma_r = '0.0480281  0.0571778  0.055797   0.00765581'
	chi = '0. 0. 0. 0.'
	sigma_s = '0. 0. 0. 0.; 0.0475728 0.        0.        0.       ; 2.28557e-04 5.71570e-02 0.00000e+00 5.63296e-05; 0.0000e+00 6.0116e-06 5.5390e-02 0.0000e+00'
[]
[./gcu_F7rifl]
	block = 'F7rifl'
	type = CorrectedNuclearMaterial
	sph_factors = '0.68473  0.876067 1.05877  0.967392'
 	nu_sigma_f = '0. 0. 0. 0.'
	diffusivity = '4.86073 1.68728 0.98145 0.2767 '
	sigma_r = '0.0617902 0.0869694 0.0828426 0.0114129'
	chi = '0. 0. 0. 0.'
	sigma_s = '1.e-06 0.e+00 0.e+00 0.e+00; 0.0612101 0.        0.        0.       ; 3.64194e-04 8.69486e-02 0.00000e+00 7.97539e-05; 0.00000e+00 1.07413e-05 8.22433e-02 0.00000e+00'
[]
[./gcu_MNR396]
	block = 'MNR396'
	type = CorrectedNuclearMaterial
	sph_factors = '1.0737  1.07812 1.06659 1.02606'
 	nu_sigma_f = '0.00130242 0.00060823 0.00895538 0.110754  '
	diffusivity = '2.9032   1.14209  0.760132 0.245135'
	sigma_r = '0.079583  0.0920733 0.0992755 0.0717072'
	chi = '7.61555e-01 2.38272e-01 1.72789e-04 0.00000e+00'
	sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0782771 0.        0.        0.       ; 0.00044975 0.0915491  0.         0.00022373; 0.00000e+00 9.66175e-06 8.80555e-02 0.00000e+00'
[]
[./gcu_MNR375]
	block = 'MNR375'
	type = CorrectedNuclearMaterial
	sph_factors = '1.10095 1.0911  1.09008 1.40939'
 	nu_sigma_f = '0.00112356 0.00041799 0.00626456 0.0850913 '
	diffusivity = '2.90025  1.13904  0.759177 0.245475'
	sigma_r = '0.0793557 0.093136  0.0995149 0.0607956'
	chi = '7.62133e-01 2.37694e-01 1.72386e-04 0.00000e+00'
	sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0781181 0.        0.        0.       ; 0.00044906 0.0926994  0.         0.00021798; 5.88426e-08 9.70139e-06 8.86474e-02 0.00000e+00'
[]
[./gcu_MNR374]
	block = 'MNR374'
	type = CorrectedNuclearMaterial
	sph_factors = '1.05824 1.0562  1.06658 1.604  '
 	nu_sigma_f = '0.00108411 0.00037635 0.00566283 0.0783239 '
	diffusivity = '2.89863  1.13668  0.757973 0.243751'
	sigma_r = '0.0795924 0.094145  0.0994752 0.0578653'
	chi = '7.62304e-01 2.37525e-01 1.70719e-04 0.00000e+00'
	sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0783629 0.        0.        0.       ; 0.00045121 0.0937272  0.         0.00021283; 1.78281e-08 1.03345e-05 8.86442e-02 0.00000e+00'
[]
[./gcu_MNR372]
	block = 'MNR372'
	type = CorrectedNuclearMaterial
	sph_factors = '1.11206 1.06718 1.0611  1.80897'
 	nu_sigma_f = '0.00111449 0.00041413 0.00620728 0.0847695 '
	diffusivity = '2.89771  1.13919  0.759336 0.245581'
	sigma_r = '0.0793658 0.0930895 0.0992362 0.0607073'
	chi = '7.62269e-01 2.37558e-01 1.72298e-04 0.00000e+00'
	sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0781322 0.        0.        0.       ; 0.00045061 0.0926557  0.         0.00021668; 5.88740e-08 9.19620e-06 8.84012e-02 0.00000e+00'
[]
[./gcu_MNR382]
	block = 'MNR382'
	type = CorrectedNuclearMaterial
	sph_factors = '1.10568 1.04799 1.03445 2.08174'
 	nu_sigma_f = '0.00121216 0.00051169 0.00762253 0.0995238 '
	diffusivity = '2.89754  1.14102  0.759333 0.247578'
	sigma_r = '0.0796423 0.0923244 0.0995415 0.0672564'
	chi = '7.61809e-01 2.38024e-01 1.67311e-04 0.00000e+00'
	sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0783725 0.        0.        0.       ; 0.00045064 0.0918508  0.         0.00022158; 3.04154e-08 9.93682e-06 8.84694e-02 0.00000e+00'
[]
[./gcu_MNR389]
	block = 'MNR389'
	type = CorrectedNuclearMaterial
	sph_factors = '1.02569  1.00705  0.996031 2.45374 '
 	nu_sigma_f = '0.00124079 0.00053786 0.00797762 0.101856  '
	diffusivity = '2.89801  1.14355  0.760437 0.245175'
	sigma_r = '0.0792098 0.0913355 0.0993364 0.0680177'
	chi = '7.61920e-01 2.37901e-01 1.79392e-04 0.00000e+00'
	sigma_s = '5.e-06 0.e+00 0.e+00 0.e+00; 0.0779269 0.        0.        0.       ; 0.0004471  0.0908426  0.         0.00021195; 8.48216e-08 9.19993e-06 8.81910e-02 0.00000e+00'
[]
[./gcu_E9rifl]
	block = 'E9rifl'
	type = CorrectedNuclearMaterial
	sph_factors = '0.680581 0.922502 1.05197  0.584756'
 	nu_sigma_f = '0. 0. 0. 0.'
	diffusivity = '4.95103  1.64423  0.967471 0.266693'
	sigma_r = '0.0602857 0.093593  0.0930823 0.0116285'
	chi = '0. 0. 0. 0.'
	sigma_s = '1.2e-06 0.0e+00 0.0e+00 0.0e+00; 0.0597022 0.        0.        0.       ; 3.51955e-04 9.35582e-02 0.00000e+00 3.71681e-05; 0.00000e+00 8.20217e-06 9.24679e-02 0.00000e+00'
[]
[./gcu_E8graph]
	block = 'E8graph'
	type = CorrectedNuclearMaterial
	sph_factors = '0.718588 1.00536  1.12904  0.696574'
 	nu_sigma_f = '0. 0. 0. 0.'
	diffusivity = '2.40221  1.02972  0.759361 0.334246'
	sigma_r = '0.0495236  0.0561481  0.0539084  0.00762522'
	chi = '0. 0. 0. 0.'
	sigma_s = '0. 0. 0. 0.; 0.049095 0.       0.       0.      ; 2.25764e-04 5.61230e-02 0.00000e+00 6.99313e-05; 0.00000e+00 5.16693e-06 5.34981e-02 0.00000e+00'
[]
[./gcu_MNR394]
	block = 'MNR394'
	type = CorrectedNuclearMaterial
	sph_factors = '1.13502  1.17065  1.12079  0.592784'
 	nu_sigma_f = '0.00131495 0.00060194 0.00880366 0.110472  '
	diffusivity = '2.89925  1.14051  0.760377 0.246802'
	sigma_r = '0.0796418 0.0917814 0.100076  0.0718846'
	chi = '7.61421e-01 2.38404e-01 1.74712e-04 0.00000e+00'
	sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0783366 0.        0.        0.       ; 0.00044789 0.0912683  0.         0.00020438; 2.71312e-08 9.43654e-06 8.88644e-02 0.00000e+00'
[]
[./gcu_MNRC77]
	block = 'MNRC77'
	type = CorrectedNuclearMaterial
	sph_factors = '0.912268 0.99876  1.01574  0.690572'
 	nu_sigma_f = '0.00054682 0.00018137 0.00282778 0.047174  '
	diffusivity = '2.81945  1.13521  0.753275 0.253821'
	sigma_r = '0.0769309 0.0915975 0.107874  0.0876276'
	chi = '7.62038e-01 2.37795e-01 1.67347e-04 0.00000e+00'
	sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0757479 0.        0.        0.       ; 0.0004151  0.0897641  0.         0.00026675; 2.32919e-08 9.54929e-06 7.46747e-02 0.00000e+00'
[]
[./gcu_MNR377]
	block = 'MNR377'
	type = CorrectedNuclearMaterial
	sph_factors = '1.20281 1.13957 1.12105 1.12146'
 	nu_sigma_f = '0.00113958 0.00045846 0.00690534 0.0920225 '
	diffusivity = '2.89351  1.14004  0.760873 0.248817'
	sigma_r = '0.0793972 0.0934939 0.0986073 0.0638755'
	chi = '7.62193e-01 2.37640e-01 1.66818e-04 0.00000e+00'
	sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0781598 0.        0.        0.       ; 0.000448   0.0930429  0.         0.00026325; 5.46560e-08 1.01733e-05 8.77036e-02 0.00000e+00'
[]
[./gcu_MNRC76]
	block = 'MNRC76'
	type = CorrectedNuclearMaterial
	sph_factors = '0.974489 1.0139   1.01627  0.987151'
 	nu_sigma_f = '0.00053349 0.00017195 0.00268917 0.0448561 '
	diffusivity = '2.81563  1.13436  0.753634 0.254609'
	sigma_r = '0.0770786 0.0919181 0.108048  0.0881201'
	chi = '7.61994e-01 2.37827e-01 1.79251e-04 0.00000e+00'
	sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0758955 0.        0.        0.       ; 0.00041982 0.090071   0.         0.00027561; 2.97926e-08 1.00977e-05 7.45356e-02 0.00000e+00'
[]
[./gcu_MNR395]
	block = 'MNR395'
	type = CorrectedNuclearMaterial
	sph_factors = '1.31595 1.1765  1.1162  1.42702'
 	nu_sigma_f = '0.00126188 0.00060166 0.00895199 0.111702  '
	diffusivity = '2.89132  1.14164  0.760981 0.250136'
	sigma_r = '0.0796518 0.0924065 0.098668  0.0723366'
	chi = '7.61386e-01 2.38446e-01 1.67219e-04 0.00000e+00'
	sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0783659 0.        0.        0.       ; 0.0004501  0.0918894  0.         0.00027934; 4.88055e-08 9.46009e-06 8.74362e-02 0.00000e+00'
[]
[./gcu_MNRC80]
	block = 'MNRC80'
	type = CorrectedNuclearMaterial
	sph_factors = '1.05419 1.01761 1.06877 2.16047'
 	nu_sigma_f = '0.00064657 0.00026005 0.0037687  0.0482946 '
	diffusivity = '2.86008  1.13385  0.749819 0.236401'
	sigma_r = '0.0782188 0.0941123 0.0965051 0.0451566'
	chi = '7.61860e-01 2.37970e-01 1.69824e-04 0.00000e+00'
	sigma_s = '2.e-06 0.e+00 0.e+00 0.e+00; 0.0771616 0.        0.        0.       ; 0.00044502 0.0938228  0.         0.00020995; 2.58654e-08 1.04256e-05 9.00098e-02 0.00000e+00'
[]
[./gcu_MNR387]
	block = 'MNR387'
	type = CorrectedNuclearMaterial
	sph_factors = '1.11134 1.05205 1.03045 2.03358'
 	nu_sigma_f = '0.00121069 0.0005267  0.0078358  0.100761  '
	diffusivity = '2.89281  1.14331  0.76064  0.245815'
	sigma_r = '0.0793268 0.0917644 0.0989109 0.067616 '
	chi = '7.61774e-01 2.38047e-01 1.78889e-04 0.00000e+00'
	sigma_s = '5.e-06 0.e+00 0.e+00 0.e+00; 0.0780618 0.        0.        0.       ; 0.00044565 0.0912814  0.         0.00023644; 1.55179e-08 9.59761e-06 8.78773e-02 0.00000e+00'
[]
[./gcu_D9graph]
	block = 'D9graph'
	type = CorrectedNuclearMaterial
	sph_factors = '0.673397 0.936415 1.03162  0.569925'
 	nu_sigma_f = '0. 0. 0. 0.'
	diffusivity = '2.46472  1.02499  0.760059 0.329219'
	sigma_r = '0.0476189 0.0588576 0.0584447 0.0077221'
	chi = '0. 0. 0. 0.'
	sigma_s = '0. 0. 0. 0.; 0.0471588 0.        0.        0.       ; 2.37573e-04 5.88353e-02 0.00000e+00 4.04370e-05; 0.00000e+00 5.95545e-06 5.80037e-02 0.00000e+00'
[]
[./gcu_D8graph]
	block = 'D8graph'
	type = CorrectedNuclearMaterial
	sph_factors = '0.672532 0.96734  1.11473  0.708677'
 	nu_sigma_f = '0. 0. 0. 0.'
	diffusivity = '2.39627  1.02464  0.75877  0.332446'
	sigma_r = '0.0493164  0.0573411  0.055143   0.00767105'
	chi = '0. 0. 0. 0.'
	sigma_s = '0. 0. 0. 0.; 0.0488897 0.        0.        0.       ; 2.21207e-04 5.73167e-02 0.00000e+00 7.18568e-05; 8.78387e-08 6.94469e-06 5.47364e-02 0.00000e+00'
[]
[./gcu_D7rifl]
	block = 'D7rifl'
	type = CorrectedNuclearMaterial
	sph_factors = '0.796748 0.957209 1.09602  0.87046 '
 	nu_sigma_f = '0. 0. 0. 0.'
	diffusivity = '4.82528  1.68541  0.978847 0.279524'
	sigma_r = '0.0626009 0.0869276 0.0819643 0.0113744'
	chi = '0. 0. 0. 0.'
	sigma_s = '4.e-07 0.e+00 0.e+00 0.e+00; 0.0620093 0.        0.        0.       ; 0.00038518 0.0869003  0.         0.00010123; 0.00000e+00 9.13511e-06 8.13642e-02 0.00000e+00'
[]
[./gcu_MNR392]
	block = 'MNR392'
	type = CorrectedNuclearMaterial
	sph_factors = '1.24578  1.19381  1.13251  0.755745'
 	nu_sigma_f = '0.00124675 0.00056911 0.00845899 0.106887  '
	diffusivity = '2.89638  1.14131  0.759922 0.246067'
	sigma_r = '0.0795445 0.0925191 0.0988917 0.0705371'
	chi = '7.61758e-01 2.38070e-01 1.72027e-04 0.00000e+00'
	sigma_s = '5.e-06 0.e+00 0.e+00 0.e+00; 0.0782693 0.        0.        0.       ; 0.00044754 0.0920172  0.         0.00024938; 5.86080e-08 1.11977e-05 8.77465e-02 0.00000e+00'
[]
[./gcu_MNR381]
	block = 'MNR381'
	type = CorrectedNuclearMaterial
	sph_factors = '1.3228   1.22825  1.15531  0.941822'
 	nu_sigma_f = '0.00116358 0.00046448 0.00694119 0.0932238 '
	diffusivity = '2.89549 1.13844 0.7585  0.24723'
	sigma_r = '0.0796499 0.0930476 0.099489  0.0647432'
	chi = '7.61860e-01 2.37963e-01 1.76743e-04 0.00000e+00'
	sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0783976 0.        0.        0.       ; 0.00045048 0.0925902  0.         0.00022488; 5.54708e-08 1.03600e-05 8.85510e-02 0.00000e+00'
[]
[./gcu_MNR391]
	block = 'MNR391'
	type = CorrectedNuclearMaterial
	sph_factors = '1.34661 1.2241  1.15056 1.05713'
 	nu_sigma_f = '0.00121276 0.00054046 0.00806397 0.103344  '
	diffusivity = '2.89294  1.13922  0.758902 0.247968'
	sigma_r = '0.0798153 0.0932952 0.0986463 0.0690964'
	chi = '7.61844e-01 2.37984e-01 1.72322e-04 0.00000e+00'
	sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0785479 0.        0.        0.       ; 0.00045391 0.0928049  0.         0.00026715; 9.42024e-09 9.72474e-06 8.75511e-02 0.00000e+00'
[]
[./gcu_MNR388]
	block = 'MNR388'
	type = CorrectedNuclearMaterial
	sph_factors = '1.35244 1.20518 1.14099 1.30473'
 	nu_sigma_f = '0.00119945 0.00052902 0.0079356  0.102222  '
	diffusivity = '2.89028  1.14023  0.75999  0.248824'
	sigma_r = '0.0796684 0.0930598 0.0987025 0.0685463'
	chi = '7.61978e-01 2.37849e-01 1.73651e-04 0.00000e+00'
	sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0784105 0.        0.        0.       ; 0.00045174 0.0925713  0.         0.00026954; 2.65702e-08 9.84645e-06 8.76431e-02 0.00000e+00'
[]
[./gcu_MNR378]
	block = 'MNR378'
	type = CorrectedNuclearMaterial
	sph_factors = '1.21227 1.1217  1.0965  1.60154'
 	nu_sigma_f = '0.00114135 0.0004538  0.00683909 0.0919049 '
	diffusivity = '2.89118  1.13801  0.758752 0.247173'
	sigma_r = '0.0799391 0.0938609 0.0989833 0.0639552'
	chi = '7.62079e-01 2.37748e-01 1.73408e-04 0.00000e+00'
	sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0786982 0.        0.        0.       ; 0.00045145 0.093407   0.         0.00025303; 3.35166e-08 1.04184e-05 8.80709e-02 0.00000e+00'
[]
[./gcu_MNR390]
	block = 'MNR390'
	type = CorrectedNuclearMaterial
	sph_factors = '1.13492 1.07734 1.05628 1.87232'
 	nu_sigma_f = '0.00123515 0.00055062 0.00817328 0.103626  '
	diffusivity = '2.8962  1.14273 0.7606  0.24562'
	sigma_r = '0.079327  0.091863  0.0991746 0.0689199'
	chi = '7.61727e-01 2.38093e-01 1.79877e-04 0.00000e+00'
	sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0780486 0.        0.        0.       ; 0.00044749 0.0913642  0.         0.00023534; 1.52811e-08 1.04796e-05 8.80509e-02 0.00000e+00'
[]
[./gcu_C9rifl]
	block = 'C9rifl'
	type = CorrectedNuclearMaterial
	sph_factors = '0.646432 0.875489 0.997545 0.584962'
 	nu_sigma_f = '0. 0. 0. 0.'
	diffusivity = '4.93574  1.64449  0.964011 0.266157'
	sigma_r = '0.0609695 0.0934219 0.0932386 0.011647 '
	chi = '0. 0. 0. 0.'
	sigma_s = '7.e-07 0.e+00 0.e+00 0.e+00; 0.0603347 0.        0.        0.       ; 3.84344e-04 9.33930e-02 0.00000e+00 3.93508e-05; 0.00000e+00 1.00638e-05 9.26117e-02 0.00000e+00'
[]
[./gcu_C8graph]
	block = 'C8graph'
	type = CorrectedNuclearMaterial
	sph_factors = '0.715804 0.981101 1.10523  0.704437'
 	nu_sigma_f = '0. 0. 0. 0.'
	diffusivity = '2.39149  1.02833  0.759329 0.334241'
	sigma_r = '0.0499834  0.0564769  0.0536948  0.00763742'
	chi = '0. 0. 0. 0.'
	sigma_s = '1.e-06 0.e+00 0.e+00 0.e+00; 0.0495532 0.        0.        0.       ; 2.23947e-04 5.64532e-02 0.00000e+00 7.53974e-05; 0.00000e+00 5.38488e-06 5.32920e-02 0.00000e+00'
[]
[./gcu_MNR379]
	block = 'MNR379'
	type = CorrectedNuclearMaterial
	sph_factors = '1.1411   1.17793  1.15072  0.637268'
 	nu_sigma_f = '0.00113668 0.0004286  0.00643116 0.0875189 '
	diffusivity = '2.8918   1.13785  0.758587 0.244759'
	sigma_r = '0.079846  0.0931736 0.0995468 0.0619485'
	chi = '7.62025e-01 2.37803e-01 1.72083e-04 0.00000e+00'
	sigma_s = '3.e-06 0.e+00 0.e+00 0.e+00; 0.078613 0.       0.       0.      ; 0.00045317 0.0927292  0.         0.00020863; 2.22076e-08 9.91170e-06 8.86737e-02 0.00000e+00'
[]
[./gcu_MNR393]
	block = 'MNR393'
	type = CorrectedNuclearMaterial
	sph_factors = '1.27155  1.22492  1.15034  0.756826'
 	nu_sigma_f = '0.0012711  0.00058867 0.00873176 0.10937   '
	diffusivity = '2.89713  1.14272  0.760527 0.243427'
	sigma_r = '0.0793921 0.0918247 0.0989991 0.0716701'
	chi = '7.61575e-01 2.38253e-01 1.71546e-04 0.00000e+00'
	sigma_s = '5.e-06 0.e+00 0.e+00 0.e+00; 0.0781017 0.        0.        0.       ; 0.00045367 0.0913112  0.         0.0002382 ; 4.42872e-08 9.70428e-06 8.77916e-02 0.00000e+00'
[]
[./gcu_010400]
	block = 'u10400'
	type = CorrectedNuclearMaterial
	sph_factors = '0.831389 0.924132 1.08477  1.56727 '
 	nu_sigma_f = '0. 0. 0. 0.'
	diffusivity = '2.96036  1.02956  0.60422  0.171776'
	sigma_r = '0.102678  0.144027  0.135959  0.0181258'
	chi = '0. 0. 0. 0.'
	sigma_s = '1.e-06 0.e+00 0.e+00 0.e+00; 0.101697 0.       0.       0.      ; 6.27050e-04 1.43987e-01 0.00000e+00 1.38013e-04; 3.91069e-08 1.54589e-05 1.34988e-01 0.00000e+00'
[]
[./gcu_MNR384]
	block = 'MNR384'
	type = CorrectedNuclearMaterial
	sph_factors = '1.32816 1.22253 1.14961 1.05435'
 	nu_sigma_f = '0.00121321 0.00052938 0.0078946  0.102199  '
	diffusivity = '2.89451  1.1415   0.759781 0.244681'
	sigma_r = '0.0794907 0.0925532 0.0991128 0.0687536'
	chi = '7.61890e-01 2.37935e-01 1.75247e-04 0.00000e+00'
	sigma_s = '5.e-06 0.e+00 0.e+00 0.e+00; 0.0782223 0.        0.        0.       ; 0.00045262 0.0920713  0.         0.0002445 ; 2.05355e-08 9.65836e-06 8.80462e-02 0.00000e+00'
[]
[./gcu_MNR383]
	block = 'MNR383'
	type = CorrectedNuclearMaterial
	sph_factors = '1.28984 1.18568 1.14434 1.29925'
 	nu_sigma_f = '0.0011394  0.00045984 0.00692504 0.092327  '
	diffusivity = '2.89104  1.13952  0.760652 0.248224'
	sigma_r = '0.0795075 0.0934458 0.0987057 0.0641661'
	chi = '7.62016e-01 2.37810e-01 1.74364e-04 0.00000e+00'
	sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0782716 0.        0.        0.       ; 0.00044759 0.0929912  0.         0.00025686; 3.13461e-08 9.56530e-06 8.77479e-02 0.00000e+00'
[]
[./gcu_MNRC74]
	block = 'MNRC74'
	type = CorrectedNuclearMaterial
	sph_factors = '0.915854 0.979852 1.00385  1.18848 '
 	nu_sigma_f = '0.00049541 0.00013985 0.00219501 0.037918  '
	diffusivity = '2.81407  1.13511  0.754934 0.253701'
	sigma_r = '0.0767822 0.0918608 0.108383  0.0851779'
	chi = '7.62371e-01 2.37454e-01 1.75439e-04 0.00000e+00'
	sigma_s = '3.e-06 0.e+00 0.e+00 0.e+00; 0.0756098 0.        0.        0.       ; 0.00041517 0.0899854  0.         0.00026393; 1.75753e-08 1.02313e-05 7.44537e-02 0.00000e+00'
[]
[./gcu_MNR361]
	block = 'MNR361'
	type = CorrectedNuclearMaterial
	sph_factors = '1.01726 1.01875 1.05149 1.98806'
 	nu_sigma_f = '0.00103737 0.00033237 0.00500693 0.0709388 '
	diffusivity = '2.89578  1.14036  0.761559 0.242675'
	sigma_r = '0.0788935 0.0932566 0.0993743 0.0543969'
	chi = '7.62390e-01 2.37430e-01 1.80917e-04 0.00000e+00'
	sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0776898 0.        0.        0.       ; 0.00044609 0.0928582  0.         0.00020216; 0.00000e+00 1.05521e-05 8.87050e-02 0.00000e+00'
[]
[./gcu_B9plug]
	block = 'B9plug'
	type = CorrectedNuclearMaterial
	sph_factors = '0.582698 0.824988 0.966913 0.627333'
 	nu_sigma_f = '0. 0. 0. 0.'
	diffusivity = '3.04976  0.988524 0.553759 0.150464'
	sigma_r = '0.10767   0.167465  0.165881  0.0191128'
	chi = '0. 0. 0. 0.'
	sigma_s = '0. 0. 0. 0.; 0.106571 0.       0.       0.      ; 6.71188e-04 1.67431e-01 0.00000e+00 6.07694e-05; 0.00000e+00 1.92243e-05 1.64810e-01 0.00000e+00'
[]
[./gcu_B8graph]
	block = 'B8graph'
	type = CorrectedNuclearMaterial
	sph_factors = '0.716328 0.980168 1.12669  0.758009'
 	nu_sigma_f = '0. 0. 0. 0.'
	diffusivity = '2.39345  1.02895  0.759085 0.334437'
	sigma_r = '0.0498854  0.0561586  0.0535234  0.00762015'
	chi = '0. 0. 0. 0.'
	sigma_s = '0. 0. 0. 0.; 0.0494451 0.        0.        0.       ; 2.28604e-04 5.61370e-02 0.00000e+00 7.85885e-05; 0.00000e+00 6.53769e-06 5.31288e-02 0.00000e+00'
[]
[./gcu_MNR398]
	block = 'MNR398'
	type = CorrectedNuclearMaterial
	sph_factors = '1.14198  1.17547  1.15714  0.651696'
 	nu_sigma_f = '0.00129354 0.00060891 0.00897931 0.112249  '
	diffusivity = '2.89221  1.14153  0.760865 0.247928'
	sigma_r = '0.0797685 0.092141  0.0989917 0.0722453'
	chi = '7.61631e-01 2.38194e-01 1.75807e-04 0.00000e+00'
	sigma_s = '5.e-06 0.e+00 0.e+00 0.e+00; 0.0784636 0.        0.        0.       ; 0.00045362 0.0916105  0.         0.00023256; 0.00000e+00 9.36636e-06 8.77583e-02 0.00000e+00'
[]
[./gcu_MNRC79]
	block = 'MNRC79'
	type = CorrectedNuclearMaterial
	sph_factors = '0.961393 1.0549   1.05816  0.66993 '
 	nu_sigma_f = '0.00061655 0.00025387 0.0038956  0.0615524 '
	diffusivity = '2.82098  1.13727  0.753939 0.255078'
	sigma_r = '0.076855  0.090713  0.107699  0.0947245'
	chi = '7.62235e-01 2.37601e-01 1.63319e-04 0.00000e+00'
	sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.075634 0.       0.       0.      ; 0.00042259 0.0888281  0.         0.00027643; 0.00000e+00 9.31918e-06 7.41493e-02 0.00000e+00'
[]
[./gcu_MNR385]
	block = 'MNR385'
	type = CorrectedNuclearMaterial
	sph_factors = '1.25398  1.21611  1.16132  0.979963'
 	nu_sigma_f = '0.00122697 0.00053275 0.00791601 0.102137  '
	diffusivity = '2.89937  1.14011  0.76037  0.249343'
	sigma_r = '0.0794235 0.0923572 0.0992967 0.0685126'
	chi = '7.61910e-01 2.37916e-01 1.73437e-04 0.00000e+00'
	sigma_s = '5.e-06 0.e+00 0.e+00 0.e+00; 0.0781428 0.        0.        0.       ; 0.00045302 0.0918629  0.         0.00023264; 1.56019e-08 9.85605e-06 8.82609e-02 0.00000e+00'
[]
[./gcu_MNRC78]
	block = 'MNRC78'
	type = CorrectedNuclearMaterial
	sph_factors = '0.971459 1.0453   1.05179  0.929242'
 	nu_sigma_f = '0.00055543 0.00019217 0.00298735 0.0494075 '
	diffusivity = '2.81749  1.13638  0.754151 0.254062'
	sigma_r = '0.0767918 0.0912621 0.108245  0.0896332'
	chi = '7.62184e-01 2.37652e-01 1.63526e-04 0.00000e+00'
	sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0756017 0.        0.        0.       ; 0.00041996 0.0893958  0.         0.00026407; 5.48047e-08 9.65915e-06 7.45696e-02 0.00000e+00'
[]
[./gcu_MNR358]
	block = 'MNR358'
	type = CorrectedNuclearMaterial
	sph_factors = '1.17835 1.1425  1.14254 1.46198'
 	nu_sigma_f = '0.00104644 0.00035167 0.00533536 0.0751701 '
	diffusivity = '2.88964  1.13738  0.760262 0.245744'
	sigma_r = '0.0795761 0.0941853 0.0989996 0.0564438'
	chi = '7.62482e-01 2.37349e-01 1.69057e-04 0.00000e+00'
	sigma_s = '5.e-06 0.e+00 0.e+00 0.e+00; 0.0783759 0.        0.        0.       ; 0.00044952 0.0937766  0.         0.00023262; 4.39169e-08 1.03476e-05 8.82903e-02 0.00000e+00'
[]
[./gcu_MNR373]
	block = 'MNR373'
	type = CorrectedNuclearMaterial
	sph_factors = '1.12662 1.11657 1.12697 1.58587'
 	nu_sigma_f = '0.00109532 0.00039531 0.00596064 0.082228  '
	diffusivity = '2.88456  1.133    0.759195 0.244804'
	sigma_r = '0.0802953 0.0947451 0.0988645 0.0596044'
	chi = '7.62202e-01 2.37628e-01 1.70023e-04 0.00000e+00'
	sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0790675 0.        0.        0.       ; 0.00045878 0.0943181  0.         0.00022808; 3.52784e-08 1.06594e-05 8.80361e-02 0.00000e+00'
[]
[./gcu_MNR365]
	block = 'MNR365'
	type = CorrectedNuclearMaterial
	sph_factors = '1.0301  1.03276 1.05912 1.88921'
 	nu_sigma_f = '0.00108711 0.00037791 0.00567099 0.0783033 '
	diffusivity = '2.89422  1.14009  0.760272 0.242387'
	sigma_r = '0.079301  0.0929471 0.0995281 0.0576766'
	chi = '7.62281e-01 2.37548e-01 1.71468e-04 0.00000e+00'
	sigma_s = '5.e-06 0.e+00 0.e+00 0.e+00; 0.0780674 0.        0.        0.       ; 0.00045427 0.0925292  0.         0.0001988 ; 2.54937e-08 9.99067e-06 8.87066e-02 0.00000e+00'
[]
[./gcu_A9plug]
	block = 'A9plug'
	type = CorrectedNuclearMaterial
	sph_factors = '0.796458 1.20558  1.35243  0.662484'
 	nu_sigma_f = '0. 0. 0. 0.'
	diffusivity = '3.10842  0.99144  0.553756 0.149958'
	sigma_r = '0.104523  0.164804  0.166064  0.0191721'
	chi = '0. 0. 0. 0.'
	sigma_s = '0. 0. 0. 0.; 0.103401 0.       0.       0.      ; 6.55641e-04 1.64771e-01 0.00000e+00 5.15890e-05; 0.00000e+00 1.83153e-05 1.64974e-01 0.00000e+00'
[]
[./gcu_A8graph]
	block = 'A8graph'
	type = CorrectedNuclearMaterial
	sph_factors = '0.666645 0.988921 1.19086  0.78067 '
 	nu_sigma_f = '0. 0. 0. 0.'
	diffusivity = '2.41974  1.0269   0.75968  0.331325'
	sigma_r = '0.0484076  0.0571887  0.0557703  0.00767815'
	chi = '0. 0. 0. 0.'
	sigma_s = '0. 0. 0. 0.; 0.0479556 0.        0.        0.       ; 2.26867e-04 5.71641e-02 0.00000e+00 5.54623e-05; 1.66141e-07 5.22719e-06 5.53520e-02 0.00000e+00'
[]
[./gcu_A7rifl]
	block = 'A7rifl'
	type = CorrectedNuclearMaterial
	sph_factors = '0.698476 0.898626 1.0874   1.01172 '
 	nu_sigma_f = '0. 0. 0. 0.'
	diffusivity = '4.86455  1.68935  0.981041 0.276818'
	sigma_r = '0.0619334 0.0870896 0.0829542 0.0114158'
	chi = '0. 0. 0. 0.'
	sigma_s = '2.e-07 0.e+00 0.e+00 0.e+00; 0.0613436 0.        0.        0.       ; 3.74599e-04 8.70609e-02 0.00000e+00 8.30293e-05; 6.66237e-08 8.98664e-06 8.23541e-02 0.00000e+00'
[]
[./gcu_MNR397]
	block = 'MNR397'
	type = CorrectedNuclearMaterial
	sph_factors = '1.1024  1.12035 1.1172  1.12082'
 	nu_sigma_f = '0.00130345 0.00060795 0.00896263 0.111171  '
	diffusivity = '2.89942  1.14259  0.760405 0.244937'
	sigma_r = '0.0795359 0.0919336 0.0992169 0.0718862'
	chi = '7.61917e-01 2.37910e-01 1.73042e-04 0.00000e+00'
	sigma_s = '5.e-06 0.e+00 0.e+00 0.e+00; 0.0782332 0.        0.        0.       ; 0.00044844 0.0914098  0.         0.00022861; 5.44790e-08 1.09631e-05 8.79653e-02 0.00000e+00'
[]
[./gcu_MNR376]
	block = 'MNR376'
	type = CorrectedNuclearMaterial
	sph_factors = '1.12154 1.13519 1.14748 1.55099'
 	nu_sigma_f = '0.00112234 0.00041745 0.00627608 0.0852417 '
	diffusivity = '2.89925  1.13951  0.759322 0.245443'
	sigma_r = '0.0793687 0.0929016 0.0993554 0.0608869'
	chi = '7.61870e-01 2.37955e-01 1.75260e-04 0.00000e+00'
	sigma_s = '3.e-06 0.e+00 0.e+00 0.e+00; 0.0781442 0.        0.        0.       ; 0.00044825 0.0924716  0.         0.0002147 ; 6.75290e-08 1.00368e-05 8.84389e-02 0.00000e+00'
[]
[./gcu_MNR366]
	block = 'MNR366'
	type = CorrectedNuclearMaterial
	sph_factors = '1.04619 1.08616 1.1185  1.71221'
 	nu_sigma_f = '0.00104755 0.00033298 0.00501724 0.0709306 '
	diffusivity = '2.89849  1.13659  0.758077 0.242535'
	sigma_r = '0.0795757 0.0943302 0.0996696 0.0544988'
	chi = '7.62284e-01 2.37538e-01 1.77902e-04 0.00000e+00'
	sigma_s = '5.e-06 0.e+00 0.e+00 0.e+00; 0.0783683 0.        0.        0.       ; 0.00044925 0.0939328  0.         0.00019549; 0.00000e+00 9.89674e-06 8.89542e-02 0.00000e+00'
[]
[./gcu_MNR362]
	block = 'MNR362'
	type = CorrectedNuclearMaterial
	sph_factors = '1.06703 1.09892 1.12327 1.66545'
 	nu_sigma_f = '0.00103612 0.0003119  0.00470528 0.0675564 '
	diffusivity = '2.8882   1.13438  0.759173 0.241641'
	sigma_r = '0.0798686 0.0942155 0.100079  0.0531011'
	chi = '7.62647e-01 2.37183e-01 1.69698e-04 0.00000e+00'
	sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0786687 0.        0.        0.       ; 0.00045181 0.0938262  0.         0.00017674; 0.00000e+00 9.55453e-06 8.93935e-02 0.00000e+00'
[]
[./gcu_010500]
	block = 'u10500'
	type = CorrectedNuclearMaterial
	sph_factors = '0.742804 0.999227 1.10084  2.06574 '
 	nu_sigma_f = '0. 0. 0. 0.'
	diffusivity = '1.78678  0.690046 0.49539  0.303033'
	sigma_r = '0.0671272  0.0466173  0.0450159  0.00605525'
	chi = '0. 0. 0. 0.'
	sigma_s = '0.004034 0.       0.       0.      ; 0.0700851 0.        0.        0.       ; 0.0001563  0.0466078  0.         0.00012793; 0.00000e+00 3.01174e-06 4.47274e-02 0.00000e+00'
[]
[./gcu_MNR369]
	block = 'MNR369'
	type = CorrectedNuclearMaterial
	sph_factors = '0.976206 0.993429 1.02635  1.8735  '
 	nu_sigma_f = '0.00111766 0.00038057 0.00566688 0.0784673 '
	diffusivity = '2.88615  1.13822  0.760318 0.239788'
	sigma_r = '0.0796716 0.0924788 0.100052  0.0577783'
	chi = '7.62478e-01 2.37349e-01 1.73392e-04 0.00000e+00'
	sigma_s = '4.e-06 0.e+00 0.e+00 0.e+00; 0.0784276 0.        0.        0.       ; 0.00045619 0.0920599  0.         0.00016385; 0.00000e+00 1.03842e-05 8.92541e-02 0.00000e+00'
[]
[]
