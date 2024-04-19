[Mesh]
file = mnr_active.msh
[]


[Outputs]
exodus = true
[]


[Executioner]
type = Eigenvalue   
nl_rel_tol = 1e-12
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
	albedo_matrix = '3.20244E-01  7.30317E-06; 2.03543E-01  7.77998E-01'
    execute_on = 'LINEAR'
    boundary = 'north south west east bottom top'
[]
[./alb_1]
    type = AlbedoCorrectedArraySideIntegralPostprocessor
    variable = flux
	albedo_matrix = '3.20244E-01  7.30317E-06; 2.03543E-01  7.77998E-01'
    component = 1
    execute_on = 'LINEAR'
    boundary = 'north south west east bottom top' 
[]
[]



[BCs]
[./albedo]
	variable = flux
	type = L2ArrayAlbedoBC
    gamma_factors = '0.735584 0.132912'
	boundary = 'north south west east bottom top'
	albedo_matrix = '3.20244E-01  7.30317E-06; 2.03543E-01  7.77998E-01'
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
	sph_factors = '0.817978 0.555608'
 	nu_sigma_f = '0. 0.'
	diffusivity = '1.4207   0.149946'
	sigma_r = '0.0683535 0.0191672'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 4.97481e-05; 0.0677735 0.       '
[]
[./gcu_F8graph]
	block = 'F8graph'
	type = CorrectedNuclearMaterial
	sph_factors = '0.859021 0.675759'
 	nu_sigma_f = '0. 0.'
	diffusivity = '1.30022  0.331092'
	sigma_r = '0.0222311  0.00769906'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 5.51796e-05; 0.0219974 0.       '
[]
[./gcu_F7rifl]
	block = 'F7rifl'
	type = CorrectedNuclearMaterial
	sph_factors = '0.825621 0.903973'
 	nu_sigma_f = '0. 0.'
	diffusivity = '2.3749   0.277091'
	sigma_r = '0.0303988 0.0113775'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 7.86458e-05; 0.0301093 0.       '
[]
[./gcu_MNR396]
	block = 'MNR396'
	type = CorrectedNuclearMaterial
	sph_factors = '1.05344  0.995942'
 	nu_sigma_f = '0.00334208 0.110737  '
	diffusivity = '1.64793  0.245007'
	sigma_r = '0.0302369 0.0717206'
	chi = '1. 0.'
	sigma_s = '4.00000e-06 2.25825e-04; 0.0263795 0.       '
[]
[./gcu_MNR375]
	block = 'MNR375'
	type = CorrectedNuclearMaterial
	sph_factors = '1.08335 1.41359'
 	nu_sigma_f = '0.00245694 0.0852511 '
	diffusivity = '1.62702  0.245646'
	sigma_r = '0.0310363 0.060919 '
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.15249e-04; 0.0272676 0.       '
[]
[./gcu_MNR374]
	block = 'MNR374'
	type = CorrectedNuclearMaterial
	sph_factors = '1.05169 1.64141'
 	nu_sigma_f = '0.00226885 0.0783093 '
	diffusivity = '1.61232  0.243812'
	sigma_r = '0.0316409 0.0578106'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.13022e-04; 0.0278356 0.       '
[]
[./gcu_MNR372]
	block = 'MNR372'
	type = CorrectedNuclearMaterial
	sph_factors = '1.0767  1.87408'
 	nu_sigma_f = '0.0024356 0.084766 '
	diffusivity = '1.62322  0.245571'
	sigma_r = '0.0309785 0.0606943'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.14019e-04; 0.0272282 0.       '
[]
[./gcu_MNR382]
	block = 'MNR382'
	type = CorrectedNuclearMaterial
	sph_factors = '1.05929 2.16208'
 	nu_sigma_f = '0.00290398 0.0993907 '
	diffusivity = '1.63541  0.247445'
	sigma_r = '0.0305261 0.0670981'
	chi = '1. 0.'
	sigma_s = '6.00000e-06 2.21498e-04; 0.0267304 0.       '
[]
[./gcu_MNR389]
	block = 'MNR389'
	type = CorrectedNuclearMaterial
	sph_factors = '0.995111 2.49622 '
 	nu_sigma_f = '0.00299134 0.101938  '
	diffusivity = '1.65143 0.24509'
	sigma_r = '0.0299377 0.0680946'
	chi = '1. 0.'
	sigma_s = '6.00000e-06 2.11195e-04; 0.0261723 0.       '
[]
[./gcu_E9rifl]
	block = 'E9rifl'
	type = CorrectedNuclearMaterial
	sph_factors = '0.840046 0.548768'
 	nu_sigma_f = '0. 0.'
	diffusivity = '2.28598  0.266235'
	sigma_r = '0.0386709 0.0116337'
	chi = '0. 0.'
	sigma_s = '1.00000e-06 3.58462e-05; 0.0383434 0.       '
[]
[./gcu_E8graph]
	block = 'E8graph'
	type = CorrectedNuclearMaterial
	sph_factors = '0.903464 0.659752'
 	nu_sigma_f = '0. 0.'
	diffusivity = '1.30696 0.33438'
	sigma_r = '0.0204948  0.00762001'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 7.19916e-05; 0.0202744 0.       '
[]
[./gcu_MNR394]
	block = 'MNR394'
	type = CorrectedNuclearMaterial
	sph_factors = '1.11329 0.56728'
 	nu_sigma_f = '0.00330341 0.110439  '
	diffusivity = '1.65047  0.247063'
	sigma_r = '0.0303153 0.0718603'
	chi = '1. 0.'
	sigma_s = '6.000e-06 2.005e-04; 0.0264931 0.       '
[]
[./gcu_MNRC77]
	block = 'MNRC77'
	type = CorrectedNuclearMaterial
	sph_factors = '0.974546 0.693487'
 	nu_sigma_f = '0.00115652 0.0471123 '
	diffusivity = '1.5365   0.253763'
	sigma_r = '0.0361395 0.0876617'
	chi = '1. 0.'
	sigma_s = '4.00000e-06 2.69735e-04; 0.0243765 0.       '
[]
[./gcu_MNR377]
	block = 'MNR377'
	type = CorrectedNuclearMaterial
	sph_factors = '1.16763 1.16246'
 	nu_sigma_f = '0.00270486 0.0920426 '
	diffusivity = '1.61042  0.248952'
	sigma_r = '0.0312171 0.0638873'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.61173e-04; 0.0273915 0.       '
[]
[./gcu_MNRC76]
	block = 'MNRC76'
	type = CorrectedNuclearMaterial
	sph_factors = '1.01955 1.04615'
 	nu_sigma_f = '0.00111144 0.0448174 '
	diffusivity = '1.52749  0.254614'
	sigma_r = '0.0365865 0.0881364'
	chi = '1. 0.'
	sigma_s = '3.00000e-06 2.78649e-04; 0.0246218 0.       '
[]
[./gcu_MNR395]
	block = 'MNR395'
	type = CorrectedNuclearMaterial
	sph_factors = '1.2259 1.5292'
 	nu_sigma_f = '0.00336908 0.111627  '
	diffusivity = '1.62698  0.250176'
	sigma_r = '0.0304182 0.0723224'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.78784e-04; 0.0265379 0.       '
[]
[./gcu_MNRC80]
	block = 'MNRC80'
	type = CorrectedNuclearMaterial
	sph_factors = '1.0635  2.30498'
 	nu_sigma_f = '0.00153879 0.0483193 '
	diffusivity = '1.55958  0.236374'
	sigma_r = '0.032175  0.0452066'
	chi = '1. 0.'
	sigma_s = '3.0000e-06 2.0819e-04; 0.0297383 0.       '
[]
[./gcu_MNR387]
	block = 'MNR387'
	type = CorrectedNuclearMaterial
	sph_factors = '1.06397 2.11865'
 	nu_sigma_f = '0.00295838 0.100896  '
	diffusivity = '1.63771  0.245642'
	sigma_r = '0.0301298 0.0676358'
	chi = '1. 0.'
	sigma_s = '6.00000e-06 2.35674e-04; 0.0263568 0.       '
[]
[./gcu_D9graph]
	block = 'D9graph'
	type = CorrectedNuclearMaterial
	sph_factors = '0.844309 0.540004'
 	nu_sigma_f = '0. 0.'
	diffusivity = '1.28991  0.329315'
	sigma_r = '0.0245848  0.00772959'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 4.26774e-05; 0.0243246 0.       '
[]
[./gcu_D8graph]
	block = 'D8graph'
	type = CorrectedNuclearMaterial
	sph_factors = '0.882005 0.678866'
 	nu_sigma_f = '0. 0.'
	diffusivity = '1.27762  0.332383'
	sigma_r = '0.0221475  0.00769473'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 6.95302e-05; 0.0219221 0.       '
[]
[./gcu_D7rifl]
	block = 'D7rifl'
	type = CorrectedNuclearMaterial
	sph_factors = '0.928095 0.845109'
 	nu_sigma_f = '0. 0.'
	diffusivity = '2.35192  0.279559'
	sigma_r = '0.0298975 0.0113602'
	chi = '0. 0.'
	sigma_s = '0.         0.00010033; 0.0296097 0.       '
[]
[./gcu_MNR392]
	block = 'MNR392'
	type = CorrectedNuclearMaterial
	sph_factors = '1.1936   0.765181'
 	nu_sigma_f = '0.00319156 0.106884  '
	diffusivity = '1.63136  0.245832'
	sigma_r = '0.0304422 0.0705706'
	chi = '1. 0.'
	sigma_s = '6.00000e-06 2.50875e-04; 0.0265973 0.       '
[]
[./gcu_MNR381]
	block = 'MNR381'
	type = CorrectedNuclearMaterial
	sph_factors = '1.25082  0.983813'
 	nu_sigma_f = '0.00269338 0.0931601 '
	diffusivity = '1.62551  0.247359'
	sigma_r = '0.0309019 0.0647204'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.24381e-04; 0.0271033 0.       '
[]
[./gcu_MNR391]
	block = 'MNR391'
	type = CorrectedNuclearMaterial
	sph_factors = '1.26712 1.12716'
 	nu_sigma_f = '0.00308279 0.103371  '
	diffusivity = '1.61802  0.247867'
	sigma_r = '0.0307501 0.0691078'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.67852e-04; 0.0268862 0.       '
[]
[./gcu_MNR388]
	block = 'MNR388'
	type = CorrectedNuclearMaterial
	sph_factors = '1.26221 1.40423'
 	nu_sigma_f = '0.00302647 0.102296  '
	diffusivity = '1.61779  0.248887'
	sigma_r = '0.030748 0.068575'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.68962e-04; 0.0269062 0.       '
[]
[./gcu_MNR378]
	block = 'MNR378'
	type = CorrectedNuclearMaterial
	sph_factors = '1.16243 1.70925'
 	nu_sigma_f = '0.00267212 0.0919514 '
	diffusivity = '1.60818  0.247331'
	sigma_r = '0.0313066 0.064023 '
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.55113e-04; 0.0274728 0.       '
[]
[./gcu_MNR390]
	block = 'MNR390'
	type = CorrectedNuclearMaterial
	sph_factors = '1.08567 1.94074'
 	nu_sigma_f = '0.00308587 0.10375   '
	diffusivity = '1.63683  0.245778'
	sigma_r = '0.0303147 0.0690233'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.33029e-04; 0.026494 0.      '
[]
[./gcu_C9rifl]
	block = 'C9rifl'
	type = CorrectedNuclearMaterial
	sph_factors = '0.802068 0.553997'
 	nu_sigma_f = '0. 0.'
	diffusivity = '2.25835 0.26605'
	sigma_r = '0.038974  0.0116377'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 4.07148e-05; 0.0386165 0.       '
[]
[./gcu_C8graph]
	block = 'C8graph'
	type = CorrectedNuclearMaterial
	sph_factors = '0.898633 0.67406 '
 	nu_sigma_f = '0. 0.'
	diffusivity = '1.29706  0.334315'
	sigma_r = '0.0206027  0.00765423'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 7.70935e-05; 0.0203877 0.       '
[]
[./gcu_MNR379]
	block = 'MNR379'
	type = CorrectedNuclearMaterial
	sph_factors = '1.13783  0.616593'
 	nu_sigma_f = '0.00251589 0.0876179 '
	diffusivity = '1.61986 0.24461'
	sigma_r = '0.0310445 0.0620662'
	chi = '1. 0.'
	sigma_s = '6.00000e-06 2.09274e-04; 0.0272646 0.       '
[]
[./gcu_MNR393]
	block = 'MNR393'
	type = CorrectedNuclearMaterial
	sph_factors = '1.21476  0.763382'
 	nu_sigma_f = '0.00326583 0.1094    '
	diffusivity = '1.6394   0.243613'
	sigma_r = '0.0301977 0.0717154'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.37406e-04; 0.0263564 0.       '
[]
[./gcu_010400]
	block = 'u10400'
	type = CorrectedNuclearMaterial
	sph_factors = '0.950436 1.62471 '
 	nu_sigma_f = '0. 0.'
	diffusivity = '1.42799  0.171766'
	sigma_r = '0.0511744 0.0181183'
	chi = '0. 0.'
	sigma_s = '0.         0.00013801; 0.0506983 0.       '
[]
[./gcu_MNR384]
	block = 'MNR384'
	type = CorrectedNuclearMaterial
	sph_factors = '1.25084 1.11216'
 	nu_sigma_f = '0.00300416 0.102093  '
	diffusivity = '1.62589  0.244578'
	sigma_r = '0.0306843 0.0686622'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.47422e-04; 0.026854 0.      '
[]
[./gcu_MNR383]
	block = 'MNR383'
	type = CorrectedNuclearMaterial
	sph_factors = '1.22849 1.38196'
 	nu_sigma_f = '0.00269859 0.0923001 '
	diffusivity = '1.60998  0.248261'
	sigma_r = '0.0312    0.0641503'
	chi = '1. 0.'
	sigma_s = '6.00000e-06 2.59566e-04; 0.0273646 0.       '
[]
[./gcu_MNRC74]
	block = 'MNRC74'
	type = CorrectedNuclearMaterial
	sph_factors = '0.976555 1.25417 '
 	nu_sigma_f = '0.00093681 0.0379896 '
	diffusivity = '1.52067  0.253758'
	sigma_r = '0.0371383 0.0852296'
	chi = '1. 0.'
	sigma_s = '4.00000e-06 2.66672e-04; 0.0248925 0.       '
[]
[./gcu_MNR361]
	block = 'MNR361'
	type = CorrectedNuclearMaterial
	sph_factors = '1.01801 2.03668'
 	nu_sigma_f = '0.00204009 0.0709181 '
	diffusivity = '1.61233  0.242783'
	sigma_r = '0.0316747 0.0544174'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.04152e-04; 0.0279323 0.       '
[]
[./gcu_B9plug]
	block = 'B9plug'
	type = CorrectedNuclearMaterial
	sph_factors = '0.745008 0.583926'
 	nu_sigma_f = '0. 0.'
	diffusivity = '1.37366  0.150431'
	sigma_r = '0.0696998 0.0191595'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 5.90206e-05; 0.0691122 0.       '
[]
[./gcu_B8graph]
	block = 'B8graph'
	type = CorrectedNuclearMaterial
	sph_factors = '0.898181 0.716435'
 	nu_sigma_f = '0. 0.'
	diffusivity = '1.30213 0.33431'
	sigma_r = '0.0202987  0.00763945'
	chi = '0. 0.'
	sigma_s = '0.0000e+00 7.5811e-05; 0.0200858 0.       '
[]
[./gcu_MNR398]
	block = 'MNR398'
	type = CorrectedNuclearMaterial
	sph_factors = '1.13169  0.618867'
 	nu_sigma_f = '0.00336243 0.112234  '
	diffusivity = '1.63711  0.247773'
	sigma_r = '0.0302235 0.0722585'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.29493e-04; 0.0263728 0.       '
[]
[./gcu_MNRC79]
	block = 'MNRC79'
	type = CorrectedNuclearMaterial
	sph_factors = '1.0166   0.664365'
 	nu_sigma_f = '0.00153569 0.0615478 '
	diffusivity = '1.55001  0.254866'
	sigma_r = '0.0353284 0.0946974'
	chi = '1. 0.'
	sigma_s = '4.00000e-06 2.76624e-04; 0.0236889 0.       '
[]
[./gcu_MNR385]
	block = 'MNR385'
	type = CorrectedNuclearMaterial
	sph_factors = '1.20913 0.99833'
 	nu_sigma_f = '0.00300327 0.102206  '
	diffusivity = '1.63653  0.249054'
	sigma_r = '0.0305686 0.0685484'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.32706e-04; 0.0267657 0.       '
[]
[./gcu_MNRC78]
	block = 'MNRC78'
	type = CorrectedNuclearMaterial
	sph_factors = '1.02482  0.958349'
 	nu_sigma_f = '0.0012218 0.0494156'
	diffusivity = '1.53699  0.254216'
	sigma_r = '0.0363074 0.0896138'
	chi = '1. 0.'
	sigma_s = '4.00000e-06 2.65679e-04; 0.0244007 0.       '
[]
[./gcu_MNR358]
	block = 'MNR358'
	type = CorrectedNuclearMaterial
	sph_factors = '1.16214 1.52288'
 	nu_sigma_f = '0.00216806 0.0751743 '
	diffusivity = '1.59616  0.245737'
	sigma_r = '0.0318904 0.056418 '
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.34012e-04; 0.0280938 0.       '
[]
[./gcu_MNR373]
	block = 'MNR373'
	type = CorrectedNuclearMaterial
	sph_factors = '1.1288  1.64942'
 	nu_sigma_f = '0.00239784 0.0823054 '
	diffusivity = '1.5861   0.244866'
	sigma_r = '0.0319833 0.0596444'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.27118e-04; 0.0281294 0.       '
[]
[./gcu_MNR365]
	block = 'MNR365'
	type = CorrectedNuclearMaterial
	sph_factors = '1.02596 1.91561'
 	nu_sigma_f = '0.00225483 0.0782339 '
	diffusivity = '1.61847 0.24229'
	sigma_r = '0.0313021 0.0576127'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 1.99263e-04; 0.0275389 0.       '
[]
[./gcu_A9plug]
	block = 'A9plug'
	type = CorrectedNuclearMaterial
	sph_factors = '1.01585  0.602612'
 	nu_sigma_f = '0. 0.'
	diffusivity = '1.41838  0.150003'
	sigma_r = '0.0679068 0.0192178'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 5.92917e-05; 0.0673553 0.       '
[]
[./gcu_A8graph]
	block = 'A8graph'
	type = CorrectedNuclearMaterial
	sph_factors = '0.887364 0.726912'
 	nu_sigma_f = '0. 0.'
	diffusivity = '1.28966  0.331662'
	sigma_r = '0.0223192  0.00767158'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 5.79246e-05; 0.0220842 0.       '
[]
[./gcu_A7rifl]
	block = 'A7rifl'
	type = CorrectedNuclearMaterial
	sph_factors = '0.848427 0.945699'
 	nu_sigma_f = '0. 0.'
	diffusivity = '2.35817  0.277236'
	sigma_r = '0.03065   0.0114303'
	chi = '0. 0.'
	sigma_s = '1.00000e-06 8.06178e-05; 0.0303586 0.       '
[]
[./gcu_MNR397]
	block = 'MNR397'
	type = CorrectedNuclearMaterial
	sph_factors = '1.08919 1.07531'
 	nu_sigma_f = '0.00334704 0.111084  '
	diffusivity = '1.64619  0.244943'
	sigma_r = '0.0301966 0.0718898'
	chi = '1. 0.'
	sigma_s = '5.000e-06 2.246e-04; 0.0263537 0.       '
[]
[./gcu_MNR376]
	block = 'MNR376'
	type = CorrectedNuclearMaterial
	sph_factors = '1.11796 1.52962'
 	nu_sigma_f = '0.0024615 0.0853195'
	diffusivity = '1.62564  0.245239'
	sigma_r = '0.030948  0.0609319'
	chi = '1. 0.'
	sigma_s = '5.00000e-06 2.14837e-04; 0.0271776 0.       '
[]
[./gcu_MNR366]
	block = 'MNR366'
	type = CorrectedNuclearMaterial
	sph_factors = '1.06474 1.71158'
 	nu_sigma_f = '0.00205671 0.0708917 '
	diffusivity = '1.60673  0.242561'
	sigma_r = '0.0319491 0.0545172'
	chi = '1. 0.'
	sigma_s = '5.000e-06 1.971e-04; 0.0281655 0.       '
[]
[./gcu_MNR362]
	block = 'MNR362'
	type = CorrectedNuclearMaterial
	sph_factors = '1.08212 1.69189'
 	nu_sigma_f = '0.00194949 0.0675757 '
	diffusivity = '1.59534  0.241642'
	sigma_r = '0.0322181 0.0531552'
	chi = '1. 0.'
	sigma_s = '6.00000e-06 1.78464e-04; 0.0284384 0.       '
[]
[./gcu_010500]
	block = 'u10500'
	type = CorrectedNuclearMaterial
	sph_factors = '0.946154 2.12226 '
 	nu_sigma_f = '0. 0.'
	diffusivity = '0.898233 0.303051'
	sigma_r = '0.0176824  0.00604401'
	chi = '0. 0.'
	sigma_s = '0.002856 0.000127; 0.0165357 0.       '
[]
[./gcu_MNR369]
	block = 'MNR369'
	type = CorrectedNuclearMaterial
	sph_factors = '0.97647 1.87824'
 	nu_sigma_f = '0.00225575 0.0783635 '
	diffusivity = '1.62333  0.239892'
	sigma_r = '0.0312257 0.0577952'
	chi = '1. 0.'
	sigma_s = '6.00000e-06 1.59804e-04; 0.0274995 0.       '
[]
[]
