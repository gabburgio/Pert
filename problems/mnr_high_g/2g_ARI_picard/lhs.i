

[MultiApps]
  [sub_app]
    type = TransientMultiApp
    positions = '0 0 0'
    input_files = '01_sub.i'
    sub_cycling = true
  []
[]


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
	albedo_matrix = '3.20244E-01 7.30317E-06 ;2.03543E-01 7.77998E-01' 
    execute_on = 'LINEAR'
    boundary = 'north south west east bottom top'
[]
[./alb_1]
    type = AlbedoCorrectedArraySideIntegralPostprocessor
    variable = flux
	albedo_matrix = '3.20244E-01 7.30317E-06 ;2.03543E-01 7.77998E-01' 
    component = 1
    execute_on = 'LINEAR'
    boundary = 'north south west east bottom top' 
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
[]



[Materials]
[./mat_gcu_F9plug]
	block = 'F9plug'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.4207   0.149946'
	ref_sigma_r = '0.0683535 0.0191672'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 4.97481e-05; 0.0677735 0.       '
	sph_factors_uo = uo_gcu_F9plug
	normalization_factors_uo = total

[]
[./mat_gcu_F8graph]
	block = 'F8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.30022  0.331092'
	ref_sigma_r = '0.0222311  0.00769906'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 5.51796e-05; 0.0219974 0.       '
	sph_factors_uo = uo_gcu_F8graph
	normalization_factors_uo = total

[]
[./mat_gcu_F7rifl]
	block = 'F7rifl'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '2.3749   0.277091'
	ref_sigma_r = '0.0303988 0.0113775'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 7.86458e-05; 0.0301093 0.       '
	sph_factors_uo = uo_gcu_F7rifl
	normalization_factors_uo = total

[]
[./mat_gcu_MNR396]
	block = 'MNR396'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00334208 0.110737  '
	ref_diffusivity = '1.64793  0.245007'
	ref_sigma_r = '0.0302369 0.0717206'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '4.00000e-06 2.25825e-04; 0.0263795 0.       '
	sph_factors_uo = uo_gcu_MNR396
	normalization_factors_uo = total

[]
[./mat_gcu_MNR375]
	block = 'MNR375'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00245694 0.0852511 '
	ref_diffusivity = '1.62702  0.245646'
	ref_sigma_r = '0.0310363 0.060919 '
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.00000e-06 2.15249e-04; 0.0272676 0.       '
	sph_factors_uo = uo_gcu_MNR375
	normalization_factors_uo = total

[]
[./mat_gcu_MNR374]
	block = 'MNR374'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00226885 0.0783093 '
	ref_diffusivity = '1.61232  0.243812'
	ref_sigma_r = '0.0316409 0.0578106'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.00000e-06 2.13022e-04; 0.0278356 0.       '
	sph_factors_uo = uo_gcu_MNR374
	normalization_factors_uo = total

[]
[./mat_gcu_MNR372]
	block = 'MNR372'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.0024356 0.084766 '
	ref_diffusivity = '1.62322  0.245571'
	ref_sigma_r = '0.0309785 0.0606943'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.00000e-06 2.14019e-04; 0.0272282 0.       '
	sph_factors_uo = uo_gcu_MNR372
	normalization_factors_uo = total

[]
[./mat_gcu_MNR382]
	block = 'MNR382'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00290398 0.0993907 '
	ref_diffusivity = '1.63541  0.247445'
	ref_sigma_r = '0.0305261 0.0670981'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '6.00000e-06 2.21498e-04; 0.0267304 0.       '
	sph_factors_uo = uo_gcu_MNR382
	normalization_factors_uo = total

[]
[./mat_gcu_MNR389]
	block = 'MNR389'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00299134 0.101938  '
	ref_diffusivity = '1.65143 0.24509'
	ref_sigma_r = '0.0299377 0.0680946'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '6.00000e-06 2.11195e-04; 0.0261723 0.       '
	sph_factors_uo = uo_gcu_MNR389
	normalization_factors_uo = total

[]
[./mat_gcu_E9rifl]
	block = 'E9rifl'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '2.28598  0.266235'
	ref_sigma_r = '0.0386709 0.0116337'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '1.00000e-06 3.58462e-05; 0.0383434 0.       '
	sph_factors_uo = uo_gcu_E9rifl
	normalization_factors_uo = total

[]
[./mat_gcu_E8graph]
	block = 'E8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.30696 0.33438'
	ref_sigma_r = '0.0204948  0.00762001'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 7.19916e-05; 0.0202744 0.       '
	sph_factors_uo = uo_gcu_E8graph
	normalization_factors_uo = total

[]
[./mat_gcu_MNR394]
	block = 'MNR394'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00330341 0.110439  '
	ref_diffusivity = '1.65047  0.247063'
	ref_sigma_r = '0.0303153 0.0718603'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '6.000e-06 2.005e-04; 0.0264931 0.       '
	sph_factors_uo = uo_gcu_MNR394
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC77]
	block = 'MNRC77'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00115652 0.0471123 '
	ref_diffusivity = '1.5365   0.253763'
	ref_sigma_r = '0.0361395 0.0876617'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '4.00000e-06 2.69735e-04; 0.0243765 0.       '
	sph_factors_uo = uo_gcu_MNRC77
	normalization_factors_uo = total

[]
[./mat_gcu_MNR377]
	block = 'MNR377'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00270486 0.0920426 '
	ref_diffusivity = '1.61042  0.248952'
	ref_sigma_r = '0.0312171 0.0638873'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.00000e-06 2.61173e-04; 0.0273915 0.       '
	sph_factors_uo = uo_gcu_MNR377
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC76]
	block = 'MNRC76'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00111144 0.0448174 '
	ref_diffusivity = '1.52749  0.254614'
	ref_sigma_r = '0.0365865 0.0881364'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '3.00000e-06 2.78649e-04; 0.0246218 0.       '
	sph_factors_uo = uo_gcu_MNRC76
	normalization_factors_uo = total

[]
[./mat_gcu_MNR395]
	block = 'MNR395'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00336908 0.111627  '
	ref_diffusivity = '1.62698  0.250176'
	ref_sigma_r = '0.0304182 0.0723224'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.00000e-06 2.78784e-04; 0.0265379 0.       '
	sph_factors_uo = uo_gcu_MNR395
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC80]
	block = 'MNRC80'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00153879 0.0483193 '
	ref_diffusivity = '1.55958  0.236374'
	ref_sigma_r = '0.032175  0.0452066'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '3.0000e-06 2.0819e-04; 0.0297383 0.       '
	sph_factors_uo = uo_gcu_MNRC80
	normalization_factors_uo = total

[]
[./mat_gcu_MNR387]
	block = 'MNR387'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00295838 0.100896  '
	ref_diffusivity = '1.63771  0.245642'
	ref_sigma_r = '0.0301298 0.0676358'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '6.00000e-06 2.35674e-04; 0.0263568 0.       '
	sph_factors_uo = uo_gcu_MNR387
	normalization_factors_uo = total

[]
[./mat_gcu_D9graph]
	block = 'D9graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.28991  0.329315'
	ref_sigma_r = '0.0245848  0.00772959'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 4.26774e-05; 0.0243246 0.       '
	sph_factors_uo = uo_gcu_D9graph
	normalization_factors_uo = total

[]
[./mat_gcu_D8graph]
	block = 'D8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.27762  0.332383'
	ref_sigma_r = '0.0221475  0.00769473'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 6.95302e-05; 0.0219221 0.       '
	sph_factors_uo = uo_gcu_D8graph
	normalization_factors_uo = total

[]
[./mat_gcu_D7rifl]
	block = 'D7rifl'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '2.35192  0.279559'
	ref_sigma_r = '0.0298975 0.0113602'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00010033; 0.0296097 0.       '
	sph_factors_uo = uo_gcu_D7rifl
	normalization_factors_uo = total

[]
[./mat_gcu_MNR392]
	block = 'MNR392'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00319156 0.106884  '
	ref_diffusivity = '1.63136  0.245832'
	ref_sigma_r = '0.0304422 0.0705706'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '6.00000e-06 2.50875e-04; 0.0265973 0.       '
	sph_factors_uo = uo_gcu_MNR392
	normalization_factors_uo = total

[]
[./mat_gcu_MNR381]
	block = 'MNR381'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00269338 0.0931601 '
	ref_diffusivity = '1.62551  0.247359'
	ref_sigma_r = '0.0309019 0.0647204'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.00000e-06 2.24381e-04; 0.0271033 0.       '
	sph_factors_uo = uo_gcu_MNR381
	normalization_factors_uo = total

[]
[./mat_gcu_MNR391]
	block = 'MNR391'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00308279 0.103371  '
	ref_diffusivity = '1.61802  0.247867'
	ref_sigma_r = '0.0307501 0.0691078'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.00000e-06 2.67852e-04; 0.0268862 0.       '
	sph_factors_uo = uo_gcu_MNR391
	normalization_factors_uo = total

[]
[./mat_gcu_MNR388]
	block = 'MNR388'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00302647 0.102296  '
	ref_diffusivity = '1.61779  0.248887'
	ref_sigma_r = '0.030748 0.068575'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.00000e-06 2.68962e-04; 0.0269062 0.       '
	sph_factors_uo = uo_gcu_MNR388
	normalization_factors_uo = total

[]
[./mat_gcu_MNR378]
	block = 'MNR378'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00267212 0.0919514 '
	ref_diffusivity = '1.60818  0.247331'
	ref_sigma_r = '0.0313066 0.064023 '
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.00000e-06 2.55113e-04; 0.0274728 0.       '
	sph_factors_uo = uo_gcu_MNR378
	normalization_factors_uo = total

[]
[./mat_gcu_MNR390]
	block = 'MNR390'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00308587 0.10375   '
	ref_diffusivity = '1.63683  0.245778'
	ref_sigma_r = '0.0303147 0.0690233'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.00000e-06 2.33029e-04; 0.026494 0.      '
	sph_factors_uo = uo_gcu_MNR390
	normalization_factors_uo = total

[]
[./mat_gcu_C9rifl]
	block = 'C9rifl'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '2.25835 0.26605'
	ref_sigma_r = '0.038974  0.0116377'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 4.07148e-05; 0.0386165 0.       '
	sph_factors_uo = uo_gcu_C9rifl
	normalization_factors_uo = total

[]
[./mat_gcu_C8graph]
	block = 'C8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.29706  0.334315'
	ref_sigma_r = '0.0206027  0.00765423'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 7.70935e-05; 0.0203877 0.       '
	sph_factors_uo = uo_gcu_C8graph
	normalization_factors_uo = total

[]
[./mat_gcu_MNR379]
	block = 'MNR379'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00251589 0.0876179 '
	ref_diffusivity = '1.61986 0.24461'
	ref_sigma_r = '0.0310445 0.0620662'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '6.00000e-06 2.09274e-04; 0.0272646 0.       '
	sph_factors_uo = uo_gcu_MNR379
	normalization_factors_uo = total

[]
[./mat_gcu_MNR393]
	block = 'MNR393'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00326583 0.1094    '
	ref_diffusivity = '1.6394   0.243613'
	ref_sigma_r = '0.0301977 0.0717154'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.00000e-06 2.37406e-04; 0.0263564 0.       '
	sph_factors_uo = uo_gcu_MNR393
	normalization_factors_uo = total

[]
[./mat_gcu_010400]
	block = 'u10400'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.42799  0.171766'
	ref_sigma_r = '0.0511744 0.0181183'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.         0.00013801; 0.0506983 0.       '
	sph_factors_uo = uo_gcu_010400
	normalization_factors_uo = total

[]
[./mat_gcu_MNR384]
	block = 'MNR384'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00300416 0.102093  '
	ref_diffusivity = '1.62589  0.244578'
	ref_sigma_r = '0.0306843 0.0686622'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.00000e-06 2.47422e-04; 0.026854 0.      '
	sph_factors_uo = uo_gcu_MNR384
	normalization_factors_uo = total

[]
[./mat_gcu_MNR383]
	block = 'MNR383'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00269859 0.0923001 '
	ref_diffusivity = '1.60998  0.248261'
	ref_sigma_r = '0.0312    0.0641503'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '6.00000e-06 2.59566e-04; 0.0273646 0.       '
	sph_factors_uo = uo_gcu_MNR383
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC74]
	block = 'MNRC74'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00093681 0.0379896 '
	ref_diffusivity = '1.52067  0.253758'
	ref_sigma_r = '0.0371383 0.0852296'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '4.00000e-06 2.66672e-04; 0.0248925 0.       '
	sph_factors_uo = uo_gcu_MNRC74
	normalization_factors_uo = total

[]
[./mat_gcu_MNR361]
	block = 'MNR361'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00204009 0.0709181 '
	ref_diffusivity = '1.61233  0.242783'
	ref_sigma_r = '0.0316747 0.0544174'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.00000e-06 2.04152e-04; 0.0279323 0.       '
	sph_factors_uo = uo_gcu_MNR361
	normalization_factors_uo = total

[]
[./mat_gcu_B9plug]
	block = 'B9plug'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.37366  0.150431'
	ref_sigma_r = '0.0696998 0.0191595'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 5.90206e-05; 0.0691122 0.       '
	sph_factors_uo = uo_gcu_B9plug
	normalization_factors_uo = total

[]
[./mat_gcu_B8graph]
	block = 'B8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.30213 0.33431'
	ref_sigma_r = '0.0202987  0.00763945'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.0000e+00 7.5811e-05; 0.0200858 0.       '
	sph_factors_uo = uo_gcu_B8graph
	normalization_factors_uo = total

[]
[./mat_gcu_MNR398]
	block = 'MNR398'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00336243 0.112234  '
	ref_diffusivity = '1.63711  0.247773'
	ref_sigma_r = '0.0302235 0.0722585'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.00000e-06 2.29493e-04; 0.0263728 0.       '
	sph_factors_uo = uo_gcu_MNR398
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC79]
	block = 'MNRC79'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00153569 0.0615478 '
	ref_diffusivity = '1.55001  0.254866'
	ref_sigma_r = '0.0353284 0.0946974'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '4.00000e-06 2.76624e-04; 0.0236889 0.       '
	sph_factors_uo = uo_gcu_MNRC79
	normalization_factors_uo = total

[]
[./mat_gcu_MNR385]
	block = 'MNR385'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00300327 0.102206  '
	ref_diffusivity = '1.63653  0.249054'
	ref_sigma_r = '0.0305686 0.0685484'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.00000e-06 2.32706e-04; 0.0267657 0.       '
	sph_factors_uo = uo_gcu_MNR385
	normalization_factors_uo = total

[]
[./mat_gcu_MNRC78]
	block = 'MNRC78'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.0012218 0.0494156'
	ref_diffusivity = '1.53699  0.254216'
	ref_sigma_r = '0.0363074 0.0896138'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '4.00000e-06 2.65679e-04; 0.0244007 0.       '
	sph_factors_uo = uo_gcu_MNRC78
	normalization_factors_uo = total

[]
[./mat_gcu_MNR358]
	block = 'MNR358'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00216806 0.0751743 '
	ref_diffusivity = '1.59616  0.245737'
	ref_sigma_r = '0.0318904 0.056418 '
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.00000e-06 2.34012e-04; 0.0280938 0.       '
	sph_factors_uo = uo_gcu_MNR358
	normalization_factors_uo = total

[]
[./mat_gcu_MNR373]
	block = 'MNR373'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00239784 0.0823054 '
	ref_diffusivity = '1.5861   0.244866'
	ref_sigma_r = '0.0319833 0.0596444'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.00000e-06 2.27118e-04; 0.0281294 0.       '
	sph_factors_uo = uo_gcu_MNR373
	normalization_factors_uo = total

[]
[./mat_gcu_MNR365]
	block = 'MNR365'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00225483 0.0782339 '
	ref_diffusivity = '1.61847 0.24229'
	ref_sigma_r = '0.0313021 0.0576127'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.00000e-06 1.99263e-04; 0.0275389 0.       '
	sph_factors_uo = uo_gcu_MNR365
	normalization_factors_uo = total

[]
[./mat_gcu_A9plug]
	block = 'A9plug'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.41838  0.150003'
	ref_sigma_r = '0.0679068 0.0192178'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 5.92917e-05; 0.0673553 0.       '
	sph_factors_uo = uo_gcu_A9plug
	normalization_factors_uo = total

[]
[./mat_gcu_A8graph]
	block = 'A8graph'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '1.28966  0.331662'
	ref_sigma_r = '0.0223192  0.00767158'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.00000e+00 5.79246e-05; 0.0220842 0.       '
	sph_factors_uo = uo_gcu_A8graph
	normalization_factors_uo = total

[]
[./mat_gcu_A7rifl]
	block = 'A7rifl'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '2.35817  0.277236'
	ref_sigma_r = '0.03065   0.0114303'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '1.00000e-06 8.06178e-05; 0.0303586 0.       '
	sph_factors_uo = uo_gcu_A7rifl
	normalization_factors_uo = total

[]
[./mat_gcu_MNR397]
	block = 'MNR397'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00334704 0.111084  '
	ref_diffusivity = '1.64619  0.244943'
	ref_sigma_r = '0.0301966 0.0718898'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.000e-06 2.246e-04; 0.0263537 0.       '
	sph_factors_uo = uo_gcu_MNR397
	normalization_factors_uo = total

[]
[./mat_gcu_MNR376]
	block = 'MNR376'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.0024615 0.0853195'
	ref_diffusivity = '1.62564  0.245239'
	ref_sigma_r = '0.030948  0.0609319'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.00000e-06 2.14837e-04; 0.0271776 0.       '
	sph_factors_uo = uo_gcu_MNR376
	normalization_factors_uo = total

[]
[./mat_gcu_MNR366]
	block = 'MNR366'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00205671 0.0708917 '
	ref_diffusivity = '1.60673  0.242561'
	ref_sigma_r = '0.0319491 0.0545172'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '5.000e-06 1.971e-04; 0.0281655 0.       '
	sph_factors_uo = uo_gcu_MNR366
	normalization_factors_uo = total

[]
[./mat_gcu_MNR362]
	block = 'MNR362'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00194949 0.0675757 '
	ref_diffusivity = '1.59534  0.241642'
	ref_sigma_r = '0.0322181 0.0531552'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '6.00000e-06 1.78464e-04; 0.0284384 0.       '
	sph_factors_uo = uo_gcu_MNR362
	normalization_factors_uo = total

[]
[./mat_gcu_010500]
	block = 'u10500'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0. 0.'
	ref_diffusivity = '0.898233 0.303051'
	ref_sigma_r = '0.0176824  0.00604401'
	chi = '0. 0.'
	ref_k = 1
	ref_sigma_s = '0.002856 0.000127; 0.0165357 0.       '
	sph_factors_uo = uo_gcu_010500
	normalization_factors_uo = total

[]
[./mat_gcu_MNR369]
	block = 'MNR369'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00225575 0.0783635 '
	ref_diffusivity = '1.62333  0.239892'
	ref_sigma_r = '0.0312257 0.0577952'
	chi = '1. 0.'
	ref_k = 1
	ref_sigma_s = '6.00000e-06 1.59804e-04; 0.0274995 0.       '
	sph_factors_uo = uo_gcu_MNR369
	normalization_factors_uo = total

[]
[]


[UserObjects]
[./uo_gcu_F9plug]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = ' 63.9011653  298.29440575'
	block  = F9plug 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_F8graph]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '292.38487838 687.27033705'
	block  = F8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_F7rifl]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '690.55995758 905.84588994'
	block  = F7rifl 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR396]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1486.5940897   661.42495606'
	block  = MNR396 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR375]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2018.58909803  970.68367194'
	block  = MNR375 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR374]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2259.37491117 1120.60292861'
	block  = MNR374 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR372]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2678.23251743 1269.88358299'
	block  = MNR372 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR382]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2558.56827245 1170.48431743'
	block  = MNR382 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR389]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1813.30302259  859.98933301'
	block  = MNR389 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_E9rifl]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '123.48587034 473.44172786'
	block  = E9rifl 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_E8graph]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '510.41352572 860.39214368'
	block  = E8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR394]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1396.88684201  694.65519946'
	block  = MNR394 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC77]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1867.46959653  635.6630846 '
	block  = MNRC77 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR377]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2964.78482821 1171.32923739'
	block  = MNR377 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC76]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2964.70295612  986.0232265 '
	block  = MNRC76 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR395]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '4047.70694668 1460.37045966'
	block  = MNR395 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC80]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3279.15727476 1849.70335327'
	block  = MNRC80 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR387]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2513.71874221 1064.16194804'
	block  = MNR387 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_D9graph]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '158.01820744 570.55021238'
	block  = D9graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_D8graph]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = ' 599.58369251 1099.51922831'
	block  = D8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_D7rifl]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1387.80558992 1437.35949039'
	block  = D7rifl 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR392]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2704.82457187 1081.08818368'
	block  = MNR392 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR381]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3567.33065289 1622.14151991'
	block  = MNR381 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR391]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '4258.98605901 1597.22948073'
	block  = MNR391 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR388]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '4501.1964465  1688.18609649'
	block  = MNR388 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR378]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3614.98020857 1480.25882747'
	block  = MNR378 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR390]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2543.32368952 1082.72071313'
	block  = MNR390 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_C9rifl]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '152.21626    553.19332956'
	block  = C9rifl 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_C8graph]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = ' 648.71513299 1003.47016862'
	block  = C8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR379]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1787.28407277  886.43565513'
	block  = MNR379 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR393]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2630.86132686 1095.7678492 '
	block  = MNR393 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_010400]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2415.71785193 3141.49754466'
	block  = u10400 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR384]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3844.02556418 1595.54782803'
	block  = MNR384 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR383]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3867.11349322 1544.38759718'
	block  = MNR383 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC74]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2529.7492972   904.16751212'
	block  = MNRC74 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR361]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1962.24472652 1020.05254148'
	block  = MNR361 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_B9plug]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '103.54575937 432.57773091'
	block  = B9plug 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_B8graph]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '549.7104909  847.67740829'
	block  = B8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR398]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1476.09972536  630.65251276'
	block  = MNR398 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC79]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1792.42563995  574.6274424 '
	block  = MNRC79 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR385]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2521.23459996 1110.25429659'
	block  = MNR385 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNRC78]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2378.97365848  832.75540139'
	block  = MNRC78 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR358]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2818.25016369 1294.0522236 '
	block  = MNR358 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR373]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2339.28206983 1090.0531774 '
	block  = MNR373 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR365]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1565.21421913  818.5473191 '
	block  = MNR365 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_A9plug]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = ' 63.0126894 285.6910164'
	block  = A9plug 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_A8graph]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '304.76885053 712.74401876'
	block  = A8graph 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_A7rifl]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '699.92776198 921.01678799'
	block  = A7rifl 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR397]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1407.4810903   625.80241022'
	block  = MNR397 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR376]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1757.44988361  849.36724821'
	block  = MNR376 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR366]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1733.10112441  936.6052337 '
	block  = MNR366 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR362]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1755.76331858 1068.86631826'
	block  = MNR362 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_010500]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1263.6907782  1353.23264427'
	block  = u10500 
	execute_on = 'LINEAR' 
[]
[./uo_gcu_MNR369]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '992.08503595 643.25098979'
	block  = MNR369 
	execute_on = 'LINEAR' 
[]
[./total]
	type = NormalizationFactorsUserObject
	SPH_user_objects = 'uo_gcu_F9plug uo_gcu_F8graph uo_gcu_F7rifl uo_gcu_MNR396 uo_gcu_MNR375 uo_gcu_MNR374 uo_gcu_MNR372 uo_gcu_MNR382 uo_gcu_MNR389 uo_gcu_E9rifl uo_gcu_E8graph uo_gcu_MNR394 uo_gcu_MNRC77 uo_gcu_MNR377 uo_gcu_MNRC76 uo_gcu_MNR395 uo_gcu_MNRC80 uo_gcu_MNR387 uo_gcu_D9graph uo_gcu_D8graph uo_gcu_D7rifl uo_gcu_MNR392 uo_gcu_MNR381 uo_gcu_MNR391 uo_gcu_MNR388 uo_gcu_MNR378 uo_gcu_MNR390 uo_gcu_C9rifl uo_gcu_C8graph uo_gcu_MNR379 uo_gcu_MNR393 uo_gcu_010400 uo_gcu_MNR384 uo_gcu_MNR383 uo_gcu_MNRC74 uo_gcu_MNR361 uo_gcu_B9plug uo_gcu_B8graph uo_gcu_MNR398 uo_gcu_MNRC79 uo_gcu_MNR385 uo_gcu_MNRC78 uo_gcu_MNR358 uo_gcu_MNR373 uo_gcu_MNR365 uo_gcu_A9plug uo_gcu_A8graph uo_gcu_A7rifl uo_gcu_MNR397 uo_gcu_MNR376 uo_gcu_MNR366 uo_gcu_MNR362 uo_gcu_010500 uo_gcu_MNR369 '
	ref_integrals = '102225.82819873  55571.56776173'
	execute_on = 'LINEAR' 
[]
[./output]
	type = OutputUserObject
	SPH_uo_names = 'uo_gcu_A9plug uo_gcu_B9plug uo_gcu_C9rifl uo_gcu_D9graph uo_gcu_E9rifl uo_gcu_F9plug uo_gcu_A8graph uo_gcu_B8graph uo_gcu_C8graph uo_gcu_D8graph uo_gcu_E8graph uo_gcu_F8graph uo_gcu_A7rifl uo_gcu_MNR398 uo_gcu_MNR379 uo_gcu_D7rifl uo_gcu_MNR394 uo_gcu_F7rifl uo_gcu_MNR397 uo_gcu_MNRC79 uo_gcu_MNR393 uo_gcu_MNR392 uo_gcu_MNRC77 uo_gcu_MNR396 uo_gcu_MNR376 uo_gcu_MNR385 uo_gcu_010400 uo_gcu_MNR381 uo_gcu_MNR377 uo_gcu_MNR375 uo_gcu_MNR366 uo_gcu_MNRC78 uo_gcu_MNR384 uo_gcu_MNR391 uo_gcu_MNRC76 uo_gcu_MNR374 uo_gcu_MNR362 uo_gcu_MNR358 uo_gcu_MNR383 uo_gcu_MNR388 uo_gcu_MNR395 uo_gcu_MNR372 uo_gcu_010500 uo_gcu_MNR373 uo_gcu_MNRC74 uo_gcu_MNR378 uo_gcu_MNRC80 uo_gcu_MNR382 uo_gcu_MNR369 uo_gcu_MNR365 uo_gcu_MNR361 uo_gcu_MNR390 uo_gcu_MNR387 uo_gcu_MNR389 '
	execute_on = 'TIMESTEP_END'
	normalization_uo_name = total
	surface_integrators = 'alb_0 alb_1'
    ref_surface_integrals  = '849.04139729 -28.38456195'
[]
[]


[ICs]
[./IC_gcu_F9plug]
	type = ArrayConstantIC
	variable = flux 
	value = '0.01419648 0.06627003'
	block  = F9plug 
[]
[./IC_gcu_F8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.06495715 0.15268615'
	block  = F8graph 
[]
[./IC_gcu_F7rifl]
	type = ArrayConstantIC
	variable = flux 
	value = '0.15341698 0.20124558'
	block  = F7rifl 
[]
[./IC_gcu_MNR396]
	type = ArrayConstantIC
	variable = flux 
	value = '0.33026643 0.14694425'
	block  = MNR396 
[]
[./IC_gcu_MNR375]
	type = ArrayConstantIC
	variable = flux 
	value = '0.44845612 0.21565015'
	block  = MNR375 
[]
[./IC_gcu_MNR374]
	type = ArrayConstantIC
	variable = flux 
	value = '0.50194986 0.24895668'
	block  = MNR374 
[]
[./IC_gcu_MNR372]
	type = ArrayConstantIC
	variable = flux 
	value = '0.59500458 0.28212134'
	block  = MNR372 
[]
[./IC_gcu_MNR382]
	type = ArrayConstantIC
	variable = flux 
	value = '0.5684196  0.26003849'
	block  = MNR382 
[]
[./IC_gcu_MNR389]
	type = ArrayConstantIC
	variable = flux 
	value = '0.40284912 0.19105794'
	block  = MNR389 
[]
[./IC_gcu_E9rifl]
	type = ArrayConstantIC
	variable = flux 
	value = '0.02743401 0.10518131'
	block  = E9rifl 
[]
[./IC_gcu_E8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.11339508 0.19114743'
	block  = E8graph 
[]
[./IC_gcu_MNR394]
	type = ArrayConstantIC
	variable = flux 
	value = '0.31033679 0.15432679'
	block  = MNR394 
[]
[./IC_gcu_MNRC77]
	type = ArrayConstantIC
	variable = flux 
	value = '0.41488294 0.14122092'
	block  = MNRC77 
[]
[./IC_gcu_MNR377]
	type = ArrayConstantIC
	variable = flux 
	value = '0.65866595 0.2602262 '
	block  = MNR377 
[]
[./IC_gcu_MNRC76]
	type = ArrayConstantIC
	variable = flux 
	value = '0.65864776 0.21905803'
	block  = MNRC76 
[]
[./IC_gcu_MNR395]
	type = ArrayConstantIC
	variable = flux 
	value = '0.89925134 0.32444051'
	block  = MNR395 
[]
[./IC_gcu_MNRC80]
	type = ArrayConstantIC
	variable = flux 
	value = '0.72850792 0.41093593'
	block  = MNRC80 
[]
[./IC_gcu_MNR387]
	type = ArrayConstantIC
	variable = flux 
	value = '0.55845568 0.23641757'
	block  = MNR387 
[]
[./IC_gcu_D9graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.03510582 0.12675523'
	block  = D9graph 
[]
[./IC_gcu_D8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.1332054  0.24427266'
	block  = D8graph 
[]
[./IC_gcu_D7rifl]
	type = ArrayConstantIC
	variable = flux 
	value = '0.30831927 0.31932832'
	block  = D7rifl 
[]
[./IC_gcu_MNR392]
	type = ArrayConstantIC
	variable = flux 
	value = '0.60091236 0.24017796'
	block  = MNR392 
[]
[./IC_gcu_MNR381]
	type = ArrayConstantIC
	variable = flux 
	value = '0.79252943 0.36038008'
	block  = MNR381 
[]
[./IC_gcu_MNR391]
	type = ArrayConstantIC
	variable = flux 
	value = '0.94618978 0.35484554'
	block  = MNR391 
[]
[./IC_gcu_MNR388]
	type = ArrayConstantIC
	variable = flux 
	value = '1.         0.37505275'
	block  = MNR388 
[]
[./IC_gcu_MNR378]
	type = ArrayConstantIC
	variable = flux 
	value = '0.80311541 0.32885897'
	block  = MNR378 
[]
[./IC_gcu_MNR390]
	type = ArrayConstantIC
	variable = flux 
	value = '0.56503281 0.24054065'
	block  = MNR390 
[]
[./IC_gcu_C9rifl]
	type = ArrayConstantIC
	variable = flux 
	value = '0.03381684 0.12289917'
	block  = C9rifl 
[]
[./IC_gcu_C8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.1441206 0.2229341'
	block  = C8graph 
[]
[./IC_gcu_MNR379]
	type = ArrayConstantIC
	variable = flux 
	value = '0.39706867 0.19693334'
	block  = MNR379 
[]
[./IC_gcu_MNR393]
	type = ArrayConstantIC
	variable = flux 
	value = '0.58448045 0.24343924'
	block  = MNR393 
[]
[./IC_gcu_010400]
	type = ArrayConstantIC
	variable = flux 
	value = '0.5366835 0.697925 '
	block  = u10400 
[]
[./IC_gcu_MNR384]
	type = ArrayConstantIC
	variable = flux 
	value = '0.85400084 0.35447194'
	block  = MNR384 
[]
[./IC_gcu_MNR383]
	type = ArrayConstantIC
	variable = flux 
	value = '0.85913013 0.34310602'
	block  = MNR383 
[]
[./IC_gcu_MNRC74]
	type = ArrayConstantIC
	variable = flux 
	value = '0.56201708 0.20087271'
	block  = MNRC74 
[]
[./IC_gcu_MNR361]
	type = ArrayConstantIC
	variable = flux 
	value = '0.43593848 0.22661809'
	block  = MNR361 
[]
[./IC_gcu_B9plug]
	type = ArrayConstantIC
	variable = flux 
	value = '0.02300405 0.09610283'
	block  = B9plug 
[]
[./IC_gcu_B8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.12212542 0.18832269'
	block  = B8graph 
[]
[./IC_gcu_MNR398]
	type = ArrayConstantIC
	variable = flux 
	value = '0.32793497 0.14010775'
	block  = MNR398 
[]
[./IC_gcu_MNRC79]
	type = ArrayConstantIC
	variable = flux 
	value = '0.39821093 0.12766105'
	block  = MNRC79 
[]
[./IC_gcu_MNR385]
	type = ArrayConstantIC
	variable = flux 
	value = '0.56012543 0.2466576 '
	block  = MNR385 
[]
[./IC_gcu_MNRC78]
	type = ArrayConstantIC
	variable = flux 
	value = '0.52852029 0.18500757'
	block  = MNRC78 
[]
[./IC_gcu_MNR358]
	type = ArrayConstantIC
	variable = flux 
	value = '0.62611135 0.28749072'
	block  = MNR358 
[]
[./IC_gcu_MNR373]
	type = ArrayConstantIC
	variable = flux 
	value = '0.51970228 0.24216965'
	block  = MNR373 
[]
[./IC_gcu_MNR365]
	type = ArrayConstantIC
	variable = flux 
	value = '0.34773293 0.18185105'
	block  = MNR365 
[]
[./IC_gcu_A9plug]
	type = ArrayConstantIC
	variable = flux 
	value = '0.0139991  0.06347002'
	block  = A9plug 
[]
[./IC_gcu_A8graph]
	type = ArrayConstantIC
	variable = flux 
	value = '0.06770841 0.15834546'
	block  = A8graph 
[]
[./IC_gcu_A7rifl]
	type = ArrayConstantIC
	variable = flux 
	value = '0.15549816 0.20461599'
	block  = A7rifl 
[]
[./IC_gcu_MNR397]
	type = ArrayConstantIC
	variable = flux 
	value = '0.31269044 0.13903024'
	block  = MNR397 
[]
[./IC_gcu_MNR376]
	type = ArrayConstantIC
	variable = flux 
	value = '0.39044061 0.18869811'
	block  = MNR376 
[]
[./IC_gcu_MNR366]
	type = ArrayConstantIC
	variable = flux 
	value = '0.38503121 0.20807917'
	block  = MNR366 
[]
[./IC_gcu_MNR362]
	type = ArrayConstantIC
	variable = flux 
	value = '0.39006592 0.23746271'
	block  = MNR362 
[]
[./IC_gcu_010500]
	type = ArrayConstantIC
	variable = flux 
	value = '0.28074553 0.30063843'
	block  = u10500 
[]
[./IC_gcu_MNR369]
	type = ArrayConstantIC
	variable = flux 
	value = '0.22040474 0.14290667'
	block  = MNR369 
[]
[]


