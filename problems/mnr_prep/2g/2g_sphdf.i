[Mesh]
file = mnr.msh
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


[UserObjects]
[./MNR396]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2192.14593556 1015.83478993'
	block  = MNR396 
	execute_on = 'LINEAR' 
[]
[./MNR375]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2788.68517685 1329.58114378'
	block  = MNR375 
	execute_on = 'LINEAR' 
[]
[./MNR374]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2986.60889653 1529.10965038'
	block  = MNR374 
	execute_on = 'LINEAR' 
[]
[./MNR372]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3154.79617161 1480.92633201'
	block  = MNR372 
	execute_on = 'LINEAR' 
[]
[./MNR382]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2795.24915245 1268.48945204'
	block  = MNR382 
	execute_on = 'LINEAR' 
[]
[./MNR389]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1907.69219878  904.26355632'
	block  = MNR389 
	execute_on = 'LINEAR' 
[]
[./MNR394]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2115.9127172  1077.01291124'
	block  = MNR394 
	execute_on = 'LINEAR' 
[]
[./MNRC77]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2860.49179957 1581.43458041'
	block  = MNRC77 
	execute_on = 'LINEAR' 
[]
[./MNR377]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '4170.11004817 1665.4978508 '
	block  = MNR377 
	execute_on = 'LINEAR' 
[]
[./MNRC76]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '4095.00975798 2235.21589358'
	block  = MNRC76 
	execute_on = 'LINEAR' 
[]
[./MNR395]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '4879.76691163 1756.76981468'
	block  = MNR395 
	execute_on = 'LINEAR' 
[]
[./MNRC80]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3724.670722   2043.83979796'
	block  = MNRC80 
	execute_on = 'LINEAR' 
[]
[./MNR387]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2715.850743   1143.97947793'
	block  = MNR387 
	execute_on = 'LINEAR' 
[]
[./MNR392]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3909.55992787 1599.51471248'
	block  = MNR392 
	execute_on = 'LINEAR' 
[]
[./MNR381]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '4899.76250989 2180.64145876'
	block  = MNR381 
	execute_on = 'LINEAR' 
[]
[./MNR391]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '5619.861      2140.44236408'
	block  = MNR391 
	execute_on = 'LINEAR' 
[]
[./MNR388]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '5580.64066183 2063.76531818'
	block  = MNR388 
	execute_on = 'LINEAR' 
[]
[./MNR378]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '4380.27406399 1825.40423851'
	block  = MNR378 
	execute_on = 'LINEAR' 
[]
[./MNR390]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2930.14936266 1250.32989821'
	block  = MNR390 
	execute_on = 'LINEAR' 
[]
[./MNR379]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2684.85289383 1321.9309587 '
	block  = MNR379 
	execute_on = 'LINEAR' 
[]
[./MNR393]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3921.800224   1645.17755766'
	block  = MNR393 
	execute_on = 'LINEAR' 
[]
[./MNR384]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '5273.13826056 2217.28526131'
	block  = MNR384 
	execute_on = 'LINEAR' 
[]
[./MNR383]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '5107.14676379 2040.5134274 '
	block  = MNR383 
	execute_on = 'LINEAR' 
[]
[./MNRC74]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3441.85914709 2034.71563828'
	block  = MNRC74 
	execute_on = 'LINEAR' 
[]
[./MNR361]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2480.29512052 1296.66082062'
	block  = MNR361 
	execute_on = 'LINEAR' 
[]
[./MNR398]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2397.27601279 1046.21595242'
	block  = MNR398 
	execute_on = 'LINEAR' 
[]
[./MNRC79]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3047.69358047 1553.0366262 '
	block  = MNRC79 
	execute_on = 'LINEAR' 
[]
[./MNR385]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3976.22749496 1747.50082707'
	block  = MNR385 
	execute_on = 'LINEAR' 
[]
[./MNRC78]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3721.00330503 2101.63081442'
	block  = MNRC78 
	execute_on = 'LINEAR' 
[]
[./MNR358]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3995.84934372 1826.71936957'
	block  = MNR358 
	execute_on = 'LINEAR' 
[]
[./MNR373]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '3253.18572753 1552.71426725'
	block  = MNR373 
	execute_on = 'LINEAR' 
[]
[./MNR365]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2073.84020315 1076.23971696'
	block  = MNR365 
	execute_on = 'LINEAR' 
[]
[./MNR397]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2490.1060449  1109.43568038'
	block  = MNR397 
	execute_on = 'LINEAR' 
[]
[./MNR376]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2959.30182368 1362.05763941'
	block  = MNR376 
	execute_on = 'LINEAR' 
[]
[./MNR366]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2871.79772195 1535.55449333'
	block  = MNR366 
	execute_on = 'LINEAR' 
[]
[./MNR362]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '2692.91186743 1534.92379105'
	block  = MNR362 
	execute_on = 'LINEAR' 
[]
[./MNR369]
	type = SPHFactorsUserObject
	var_size = 2
	variable = flux 
	ref_fluxes = '1396.26506242  880.50243185'
	block  = MNR369 
	execute_on = 'LINEAR' 
[]
[./total]
	type = NormalizationFactorsUserObject
	SPH_user_objects = 'MNR396 MNR375 MNR374 MNR372 MNR382 MNR389 MNR394 MNRC77 MNR377 MNRC76 MNR395 MNRC80 MNR387 MNR392 MNR381 MNR391 MNR388 MNR378 MNR390 MNR379 MNR393 MNR384 MNR383 MNRC74 MNR361 MNR398 MNRC79 MNR385 MNRC78 MNR358 MNR373 MNR365 MNR397 MNR376 MNR366 MNR362 MNR369 '
	ref_integrals = '125491.78835539  57974.86851518'
	execute_on = 'LINEAR' 
[]
#[./output]
#	type = OutputUserObject
#	SPH_uo_names = 'MNR397 MNR358 MNR373'
#	ref_surface_integrals = '676.0205764   51.98476963'
#	normalization_uo_name = total
#	execute_on = LINEAR
#	surface_integrators = 'alb_0 alb_1'
#[]
[]


[Materials]
[./F9plug_u]
	block = 'F9plug_u'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.43117 0.15719'
	sigma_r = '0.0643042 0.0188188'
	chi = '0. 0.'
	sigma_s = '0.000e+00 5.282e-05; 0.0637091 0.       '
[]
[./F8graph_u]
	block = 'F8graph_u'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.3121   0.328083'
	sigma_r = '0.0224536  0.00820301'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 5.69281e-05; 0.0222062 0.       '
[]
[./F7rifl_u]
	block = 'F7rifl_u'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '2.30415  0.281225'
	sigma_r = '0.0303768 0.0116018'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 7.80648e-05; 0.0300786 0.       '
[]
[./MNR396]
	block = 'MNR396'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00406024 0.114381  '
	ref_diffusivity = '1.65288  0.254117'
	ref_sigma_r = '0.0296978 0.0734472'
	chi = '1. 0.'
	ref_k = 0.99939
	ref_sigma_s = '0.         0.00021001; 0.0253346 0.       '
	sph_factors_uo = MNR396
	normalization_factors_uo = total

[]
[./MNR375]
	block = 'MNR375'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00293471 0.0869679 '
	ref_diffusivity = '1.62484  0.254796'
	ref_sigma_r = '0.0305067 0.0617899'
	chi = '1. 0.'
	ref_k = 0.99939
	ref_sigma_s = '0.         0.00021409; 0.0262242 0.       '
	sph_factors_uo = MNR375
	normalization_factors_uo = total

[]
[./MNR374]
	block = 'MNR374'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00270264 0.081293  '
	ref_diffusivity = '1.6171   0.253914'
	ref_sigma_r = '0.031057  0.0595547'
	chi = '1. 0.'
	ref_k = 0.99939
	ref_sigma_s = '0.         0.00020552; 0.0267509 0.       '
	sph_factors_uo = MNR374
	normalization_factors_uo = total

[]
[./MNR372]
	block = 'MNR372'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00292121 0.0861829 '
	ref_diffusivity = '1.62081  0.253484'
	ref_sigma_r = '0.0306166 0.0613963'
	chi = '1. 0.'
	ref_k = 0.99939
	ref_sigma_s = '0.         0.00021682; 0.0263273 0.       '
	sph_factors_uo = MNR372
	normalization_factors_uo = total

[]
[./MNR382]
	block = 'MNR382'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00351264 0.101032  '
	ref_diffusivity = '1.63118  0.254955'
	ref_sigma_r = '0.0303675 0.0678707'
	chi = '1. 0.'
	ref_k = 0.99939
	ref_sigma_s = '0.         0.00022165; 0.0260312 0.       '
	sph_factors_uo = MNR382
	normalization_factors_uo = total

[]
[./MNR389]
	block = 'MNR389'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00362886 0.102645  '
	ref_diffusivity = '1.64681  0.251843'
	ref_sigma_r = '0.0298096 0.0684493'
	chi = '1. 0.'
	ref_k = 0.99939
	ref_sigma_s = '0.         0.00021032; 0.0255032 0.       '
	sph_factors_uo = MNR389
	normalization_factors_uo = total

[]
[./E9rifl_u]
	block = 'E9rifl_u'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '2.22025  0.274441'
	sigma_r = '0.0373689 0.0117325'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 3.34563e-05; 0.0370149 0.       '
[]
[./E8graph_u]
	block = 'E8graph_u'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.31521  0.330664'
	sigma_r = '0.020753   0.00816221'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 6.99679e-05; 0.0205297 0.       '
[]
[./MNR394]
	block = 'MNR394'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00397531 0.113168  '
	ref_diffusivity = '1.65265  0.251609'
	ref_sigma_r = '0.0298545 0.0732452'
	chi = '1. 0.'
	ref_k = 0.99939
	ref_sigma_s = '0.         0.00019646; 0.0255134 0.       '
	sph_factors_uo = MNR394
	normalization_factors_uo = total

[]
[./MNRC77]
	block = 'MNRC77'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00128452 0.0387081 '
	ref_diffusivity = '1.55729 0.23928'
	ref_sigma_r = '0.0344676 0.047758 '
	chi = '1. 0.'
	ref_k = 0.99939
	ref_sigma_s = '0.         0.00019802; 0.0286993 0.       '
	sph_factors_uo = MNRC77
	normalization_factors_uo = total

[]
[./MNR377]
	block = 'MNR377'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00322925 0.0945195 '
	ref_diffusivity = '1.61193  0.256364'
	ref_sigma_r = '0.0305444 0.0651913'
	chi = '1. 0.'
	ref_k = 0.99939
	ref_sigma_s = '0.         0.00025131; 0.0262038 0.       '
	sph_factors_uo = MNR377
	normalization_factors_uo = total

[]
[./MNRC76]
	block = 'MNRC76'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00123617 0.0368643 '
	ref_diffusivity = '1.54811 0.23915'
	ref_sigma_r = '0.0348962 0.0473507'
	chi = '1. 0.'
	ref_k = 0.99939
	ref_sigma_s = '0.         0.00020659; 0.02896 0.     '
	sph_factors_uo = MNRC76
	normalization_factors_uo = total

[]
[./MNR395]
	block = 'MNR395'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00408749 0.113069  '
	ref_diffusivity = '1.62471  0.256989'
	ref_sigma_r = '0.0301083 0.0729816'
	chi = '1. 0.'
	ref_k = 0.99939
	ref_sigma_s = '0.         0.00027647; 0.025672 0.      '
	sph_factors_uo = MNR395
	normalization_factors_uo = total

[]
[./MNRC80]
	block = 'MNRC80'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.0017507 0.0490902'
	ref_diffusivity = '1.54786  0.243417'
	ref_sigma_r = '0.0318711 0.046008 '
	chi = '1. 0.'
	ref_k = 0.99939
	ref_sigma_s = '0.         0.00021973; 0.0291992 0.       '
	sph_factors_uo = MNRC80
	normalization_factors_uo = total

[]
[./MNR387]
	block = 'MNR387'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.0035778 0.101103 '
	ref_diffusivity = '1.6318   0.252432'
	ref_sigma_r = '0.0299828 0.0676964'
	chi = '1. 0.'
	ref_k = 0.99939
	ref_sigma_s = '0.         0.00023423; 0.0256611 0.       '
	sph_factors_uo = MNR387
	normalization_factors_uo = total

[]
[./D9graph_u]
	block = 'D9graph_u'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.30748  0.326158'
	sigma_r = '0.0247897  0.00825212'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 3.88472e-05; 0.0245312 0.       '
[]
[./D8graph_u]
	block = 'D8graph_u'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.28796  0.328344'
	sigma_r = '0.022377   0.00822491'
	chi = '0. 0.'
	sigma_s = '0.0000e+00 6.9179e-05; 0.0221412 0.       '
[]
[./D7rifl_u]
	block = 'D7rifl_u'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '2.29162  0.283381'
	sigma_r = '0.0299395 0.0115673'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 9.94126e-05; 0.0296495 0.       '
[]
[./MNR392]
	block = 'MNR392'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00386691 0.109578  '
	ref_diffusivity = '1.63262  0.253569'
	ref_sigma_r = '0.0300159 0.0718186'
	chi = '1. 0.'
	ref_k = 0.99939
	ref_sigma_s = '0.         0.00024303; 0.0256448 0.       '
	sph_factors_uo = MNR392
	normalization_factors_uo = total

[]
[./MNR381]
	block = 'MNR381'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.003231  0.0964282'
	ref_diffusivity = '1.62341  0.255097'
	ref_sigma_r = '0.030425  0.0664317'
	chi = '1. 0.'
	ref_k = 0.99939
	ref_sigma_s = '0.         0.00022589; 0.0260984 0.       '
	sph_factors_uo = MNR381
	normalization_factors_uo = total

[]
[./MNR391]
	block = 'MNR391'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00371817 0.1062    '
	ref_diffusivity = '1.61945  0.256575'
	ref_sigma_r = '0.0302988 0.0705487'
	chi = '1. 0.'
	ref_k = 0.99939
	ref_sigma_s = '0.         0.00026338; 0.0258958 0.       '
	sph_factors_uo = MNR391
	normalization_factors_uo = total

[]
[./MNR388]
	block = 'MNR388'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00365605 0.103499  '
	ref_diffusivity = '1.61476 0.25583'
	ref_sigma_r = '0.0304044 0.0691421'
	chi = '1. 0.'
	ref_k = 0.99939
	ref_sigma_s = '0.         0.00026564; 0.0259899 0.       '
	sph_factors_uo = MNR388
	normalization_factors_uo = total

[]
[./MNR378]
	block = 'MNR378'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00320022 0.0948006 '
	ref_diffusivity = '1.60941  0.255652'
	ref_sigma_r = '0.030867  0.0654475'
	chi = '1. 0.'
	ref_k = 0.99939
	ref_sigma_s = '0.         0.00024399; 0.0265066 0.       '
	sph_factors_uo = MNR378
	normalization_factors_uo = total

[]
[./MNR390]
	block = 'MNR390'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00373399 0.103779  '
	ref_diffusivity = '1.63195  0.252439'
	ref_sigma_r = '0.0301111 0.0689237'
	chi = '1. 0.'
	ref_k = 0.99939
	ref_sigma_s = '0.         0.00022866; 0.0257534 0.       '
	sph_factors_uo = MNR390
	normalization_factors_uo = total

[]
[./C9rifl_u]
	block = 'C9rifl_u'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '2.19695  0.273724'
	sigma_r = '0.0377754 0.0117874'
	chi = '0. 0.'
	sigma_s = '0.0000e+00 3.7842e-05; 0.0374051 0.       '
[]
[./C8graph_u]
	block = 'C8graph_u'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.30237  0.331496'
	sigma_r = '0.0208852  0.00814522'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 7.44662e-05; 0.0206575 0.       '
[]
[./MNR379]
	block = 'MNR379'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00300618 0.0897828 '
	ref_diffusivity = '1.6184   0.250886'
	ref_sigma_r = '0.0306264 0.0631538'
	chi = '1. 0.'
	ref_k = 0.99939
	ref_sigma_s = '0.         0.00021217; 0.0263183 0.       '
	sph_factors_uo = MNR379
	normalization_factors_uo = total

[]
[./MNR393]
	block = 'MNR393'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00395569 0.113013  '
	ref_diffusivity = '1.63878  0.252024'
	ref_sigma_r = '0.0298107 0.0734792'
	chi = '1. 0.'
	ref_k = 0.99939
	ref_sigma_s = '0.         0.00023281; 0.0254357 0.       '
	sph_factors_uo = MNR393
	normalization_factors_uo = total

[]
[./MNR10400]
	block = 'MNR10400'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.42923  0.176443'
	sigma_r = '0.0503246 0.0179611'
	chi = '0. 0.'
	sigma_s = '0.         0.00013851; 0.0498504 0.       '
[]
[./MNR384]
	block = 'MNR384'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00364147 0.105638  '
	ref_diffusivity = '1.62753 0.25282'
	ref_sigma_r = '0.0302523 0.070494 '
	chi = '1. 0.'
	ref_k = 0.99939
	ref_sigma_s = '0.         0.00023998; 0.0258737 0.       '
	sph_factors_uo = MNR384
	normalization_factors_uo = total

[]
[./MNR383]
	block = 'MNR383'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.0032356 0.094331 '
	ref_diffusivity = '1.60928  0.255303'
	ref_sigma_r = '0.0307163 0.0652141'
	chi = '1. 0.'
	ref_k = 0.99939
	ref_sigma_s = '0.         0.00025795; 0.0263514 0.       '
	sph_factors_uo = MNR383
	normalization_factors_uo = total

[]
[./MNRC74]
	block = 'MNRC74'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00102511 0.0305059 '
	ref_diffusivity = '1.53936  0.238393'
	ref_sigma_r = '0.0355437 0.0446055'
	chi = '1. 0.'
	ref_k = 0.99939
	ref_sigma_s = '0.         0.00018863; 0.0294049 0.       '
	sph_factors_uo = MNRC74
	normalization_factors_uo = total

[]
[./MNR361]
	block = 'MNR361'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00241464 0.0724451 '
	ref_diffusivity = '1.61107  0.250062'
	ref_sigma_r = '0.0311485 0.0552988'
	chi = '1. 0.'
	ref_k = 0.99939
	ref_sigma_s = '0.         0.00020409; 0.0269128 0.       '
	sph_factors_uo = MNR361
	normalization_factors_uo = total

[]
[./B9plug_u]
	block = 'B9plug_u'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.37449  0.156558'
	sigma_r = '0.0663279 0.0188566'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 5.64986e-05; 0.0657485 0.       '
[]
[./B8graph_u]
	block = 'B8graph_u'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.30434 0.33197'
	sigma_r = '0.0206462  0.00811181'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 7.35707e-05; 0.0204217 0.       '
[]
[./MNR398]
	block = 'MNR398'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00408389 0.114178  '
	ref_diffusivity = '1.63632  0.253822'
	ref_sigma_r = '0.0298818 0.0733125'
	chi = '1. 0.'
	ref_k = 0.99939
	ref_sigma_s = '0.         0.00022488; 0.0254885 0.       '
	sph_factors_uo = MNR398
	normalization_factors_uo = total

[]
[./MNRC79]
	block = 'MNRC79'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00174708 0.051707  '
	ref_diffusivity = '1.57269  0.240557'
	ref_sigma_r = '0.0336922 0.0539404'
	chi = '1. 0.'
	ref_k = 0.99939
	ref_sigma_s = '0.         0.00020316; 0.0279661 0.       '
	sph_factors_uo = MNRC79
	normalization_factors_uo = total

[]
[./MNR385]
	block = 'MNR385'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00362035 0.106144  '
	ref_diffusivity = '1.63587  0.256935'
	ref_sigma_r = '0.0300351 0.0705332'
	chi = '1. 0.'
	ref_k = 0.99939
	ref_sigma_s = '0.         0.00022261; 0.0257051 0.       '
	sph_factors_uo = MNR385
	normalization_factors_uo = total

[]
[./MNRC78]
	block = 'MNRC78'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.0013624 0.0408241'
	ref_diffusivity = '1.55503  0.239457'
	ref_sigma_r = '0.0346912 0.0491797'
	chi = '1. 0.'
	ref_k = 0.99939
	ref_sigma_s = '0.         0.00019278; 0.0287746 0.       '
	sph_factors_uo = MNRC78
	normalization_factors_uo = total

[]
[./MNR358]
	block = 'MNR358'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00256254 0.0771136 '
	ref_diffusivity = '1.59373 0.25332'
	ref_sigma_r = '0.0313492 0.0575526'
	chi = '1. 0.'
	ref_k = 0.99939
	ref_sigma_s = '0.         0.00022773; 0.0270483 0.       '
	sph_factors_uo = MNR358
	normalization_factors_uo = total

[]
[./MNR373]
	block = 'MNR373'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00286285 0.085784  '
	ref_diffusivity = '1.58746  0.254326'
	ref_sigma_r = '0.0314953 0.0615151'
	chi = '1. 0.'
	ref_k = 0.99939
	ref_sigma_s = '0.         0.00022221; 0.0271102 0.       '
	sph_factors_uo = MNR373
	normalization_factors_uo = total

[]
[./MNR365]
	block = 'MNR365'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00269029 0.0794021 '
	ref_diffusivity = '1.61146  0.250233'
	ref_sigma_r = '0.0309595 0.0582919'
	chi = '1. 0.'
	ref_k = 0.99939
	ref_sigma_s = '0.         0.00019251; 0.0266971 0.       '
	sph_factors_uo = MNR365
	normalization_factors_uo = total

[]
[./A9plug_u]
	block = 'A9plug_u'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.37454  0.157156'
	sigma_r = '0.0662598 0.018857 '
	chi = '0. 0.'
	sigma_s = '0.00000e+00 5.66321e-05; 0.0656685 0.       '
[]
[./A8graph_u]
	block = 'A8graph_u'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '1.27728  0.327986'
	sigma_r = '0.0232213  0.00825278'
	chi = '0. 0.'
	sigma_s = '0.00000e+00 6.07797e-05; 0.0229796 0.       '
[]
[./A7rifl_u]
	block = 'A7rifl_u'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '2.24814  0.282544'
	sigma_r = '0.0313253 0.0116021'
	chi = '0. 0.'
	sigma_s = '0.0000e+00 8.4598e-05; 0.0310279 0.       '
[]
[./MNR397]
	block = 'MNR397'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00413444 0.11285   '
	ref_diffusivity = '1.62598  0.253268'
	ref_sigma_r = '0.030545 0.07256 '
	chi = '1. 0.'
	ref_k = 0.99939
	ref_sigma_s = '0.         0.00022833; 0.0260734 0.       '
	sph_factors_uo = MNR397
	normalization_factors_uo = total

[]
[./MNR376]
	block = 'MNR376'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00296593 0.0862987 '
	ref_diffusivity = '1.60207  0.253383'
	ref_sigma_r = '0.0312553 0.0613441'
	chi = '1. 0.'
	ref_k = 0.99939
	ref_sigma_s = '0.         0.00022357; 0.0268941 0.       '
	sph_factors_uo = MNR376
	normalization_factors_uo = total

[]
[./MNR366]
	block = 'MNR366'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00244784 0.0729825 '
	ref_diffusivity = '1.58737  0.251929'
	ref_sigma_r = '0.0321438 0.0556632'
	chi = '1. 0.'
	ref_k = 0.99939
	ref_sigma_s = '0.         0.00019903; 0.0278026 0.       '
	sph_factors_uo = MNR366
	normalization_factors_uo = total

[]
[./MNR362]
	block = 'MNR362'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00231919 0.0694342 '
	ref_diffusivity = '1.56966  0.249941'
	ref_sigma_r = '0.0326319 0.0541564'
	chi = '1. 0.'
	ref_k = 0.99939
	ref_sigma_s = '0.         0.00019351; 0.0282495 0.       '
	sph_factors_uo = MNR362
	normalization_factors_uo = total

[]
[./MNR10500]
	block = 'MNR10500'
	type = NuclearMaterial
	nu_sigma_f = '0. 0.'
	diffusivity = '0.895694 0.307918'
	sigma_r = '0.018002   0.00707681'
	chi = '0. 0.'
	sigma_s = '0.         0.00014166; 0.0169195 0.       '
[]
[./MNR369]
	block = 'MNR369'
	type = UOSphdfMaterial
	ref_nu_sigma_f = '0.00271425 0.0797654 '
	ref_diffusivity = '1.59806  0.247335'
	ref_sigma_r = '0.0316689 0.0585024'
	chi = '1. 0.'
	ref_k = 0.99939
	ref_sigma_s = '0.         0.00017073; 0.0273602 0.       '
	sph_factors_uo = MNR369
	normalization_factors_uo = total

[]
[]



[Postprocessors]
[./surf_0]
    type = SideIntegralArrayVariablePostprocessor
    variable = flux
    component = 0    
    execute_on = 'LINEAR'
    boundary = 'top'
[]
[./surf_1]
    type = SideIntegralArrayVariablePostprocessor
    variable = flux
    component = 1
    execute_on = 'LINEAR'
    boundary = 'top'    
[]
[./alb_0]
    type = AlbedoCorrectedArraySideIntegralPostprocessor
    variable = flux
    component = 0  
	albedo_matrix = '0.486012 0.0808863; 0.138912 0.744164'
    execute_on = 'LINEAR'
    boundary = 'north south west east bottom'
[]
[./alb_1]
    type = AlbedoCorrectedArraySideIntegralPostprocessor
    variable = flux
	albedo_matrix = '0.486012 0.0808863; 0.138912 0.744164'
    component = 1
    execute_on = 'LINEAR'
    boundary = 'north south west east bottom'
[]
[]




[BCs]
[./vacuum]
    type = UoDFArrayVacuumBC
    variable = flux
    boundary = top
    normalization_factors_uo = total
    surface_integrators = 'surf_0 surf_1' 
    ref_current_integral = '0.00015926 0.00042454'
[]
#[./albedo] 
#    variable = flux
#    type = ArrayAlbedoBC
#    diffusivity = diffusivity
#    albedo_matrix = '0.486012 0.0808863; 0.138912 0.744164'
#    boundary = 'north south west east bottom'
#[] 
#[./albedo] 
#    variable = flux
#    type = UoArrayAlbedoBC
#    diffusivity = diffusivity
#    surface_integrators = 'alb_0 alb_1'
#    ref_current_integral = '676.0205764   51.98476963'
#    albedo_matrix = '0.486012 0.0808863; 0.138912 0.744164'
#    boundary = 'north south west east bottom'
#    normalization_factors_uo = total
#[]
[./albedo] 
    variable = flux
    type = UoL2ArrayAlbedoBC
    surface_integrators = 'alb_0 alb_1'
    #ref_current_integral = '676.0205764   51.98476963'
	ref_current_integral = '1076.0205764   -41.98476963'
    albedo_matrix = '0.486012 0.0808863; 0.138912 0.744164'
    boundary = 'north south west east bottom'
    normalization_factors_uo = total
[]
[]

[Variables]
[./flux]
    type = ArrayMooseVariable
    components = 2
[../]
[]


[ICs]
[./ICF9plug_u]
	type = ArrayConstantIC
	variable = flux
	value = '0.01821180216391017 0.08330513793576437 '
	block = 'F9plug_u'
[]
[./ICF8graph_u]
	type = ArrayConstantIC
	variable = flux
	value = '0.07945241351217668 0.18883171296392512 '
	block = 'F8graph_u'
[]
[./ICF7rifl_u]
	type = ArrayConstantIC
	variable = flux
	value = '0.18788193679520165 0.2542382462601264 '
	block = 'F7rifl_u'
[]
[./ICMNR396]
	type = ArrayConstantIC
	variable = flux
	value = '0.3900724490092816 0.18075799204432566 '
	block = 'MNR396'
[]
[./ICMNR375]
	type = ArrayConstantIC
	variable = flux
	value = '0.4962195998886039 0.2365857105448016 '
	block = 'MNR375'
[]
[./ICMNR374]
	type = ArrayConstantIC
	variable = flux
	value = '0.531438214670197 0.27209029731942824 '
	block = 'MNR374'
[]
[./ICMNR372]
	type = ArrayConstantIC
	variable = flux
	value = '0.5613655162667354 0.2635165410689866 '
	block = 'MNR372'
[]
[./ICMNR382]
	type = ArrayConstantIC
	variable = flux
	value = '0.49738759596480214 0.22571503389682562 '
	block = 'MNR382'
[]
[./ICMNR389]
	type = ArrayConstantIC
	variable = flux
	value = '0.3394549905853697 0.16090455269075538 '
	block = 'MNR389'
[]
[./ICE9rifl_u]
	type = ArrayConstantIC
	variable = flux
	value = '0.03449649393348657 0.13282734025263632 '
	block = 'E9rifl_u'
[]
[./ICE8graph_u]
	type = ArrayConstantIC
	variable = flux
	value = '0.1371027878112751 0.23438896347622235 '
	block = 'E8graph_u'
[]
[./ICMNR394]
	type = ArrayConstantIC
	variable = flux
	value = '0.3765062369327841 0.1916440480000665 '
	block = 'MNR394'
[]
[./ICMNRC77]
	type = ArrayConstantIC
	variable = flux
	value = '0.5090010516121255 0.281400597714718 '
	block = 'MNRC77'
[]
[./ICMNR377]
	type = ArrayConstantIC
	variable = flux
	value = '0.7420308168075052 0.2963592606293878 '
	block = 'MNR377'
[]
[./ICMNRC76]
	type = ArrayConstantIC
	variable = flux
	value = '0.7286674453307175 0.39773508518889533 '
	block = 'MNRC76'
[]
[./ICMNR395]
	type = ArrayConstantIC
	variable = flux
	value = '0.8683074032662325 0.31259939397214265 '
	block = 'MNR395'
[]
[./ICMNRC80]
	type = ArrayConstantIC
	variable = flux
	value = '0.6627650332733401 0.36368114122776757 '
	block = 'MNRC80'
[]
[./ICMNR387]
	type = ArrayConstantIC
	variable = flux
	value = '0.4832594156694363 0.20356010191908822 '
	block = 'MNR387'
[]
[./ICD9graph_u]
	type = ArrayConstantIC
	variable = flux
	value = '0.04383144278689683 0.15889776085592083 '
	block = 'D9graph_u'
[]
[./ICD8graph_u]
	type = ArrayConstantIC
	variable = flux
	value = '0.1615866457729765 0.2996932451586355 '
	block = 'D8graph_u'
[]
[./ICD7rifl_u]
	type = ArrayConstantIC
	variable = flux
	value = '0.37134627134918097 0.39246122959643864 '
	block = 'D7rifl_u'
[]
[./ICMNR392]
	type = ArrayConstantIC
	variable = flux
	value = '0.6956684387508677 0.2846190296072457 '
	block = 'MNR392'
[]
[./ICMNR381]
	type = ArrayConstantIC
	variable = flux
	value = '0.8718612703308214 0.3880240914777852 '
	block = 'MNR381'
[]
[./ICMNR391]
	type = ArrayConstantIC
	variable = flux
	value = '1.0 0.3808706350822793 '
	block = 'MNR391'
[]
[./ICMNR388]
	type = ArrayConstantIC
	variable = flux
	value = '0.9930169629608077 0.3672266951530241 '
	block = 'MNR388'
[]
[./ICMNR378]
	type = ArrayConstantIC
	variable = flux
	value = '0.7794274740941796 0.3248122269653301 '
	block = 'MNR378'
[]
[./ICMNR390]
	type = ArrayConstantIC
	variable = flux
	value = '0.5213917857870257 0.22248454795226597 '
	block = 'MNR390'
[]
[./ICC9rifl_u]
	type = ArrayConstantIC
	variable = flux
	value = '0.0435400672532972 0.15838733410091319 '
	block = 'C9rifl_u'
[]
[./ICC8graph_u]
	type = ArrayConstantIC
	variable = flux
	value = '0.17756824048249462 0.27795812671718284 '
	block = 'C8graph_u'
[]
[./ICMNR379]
	type = ArrayConstantIC
	variable = flux
	value = '0.4777436477224076 0.23522484963609233 '
	block = 'MNR379'
[]
[./ICMNR393]
	type = ArrayConstantIC
	variable = flux
	value = '0.6978464812559491 0.2927430450198061 '
	block = 'MNR393'
[]
[./IC010400]
	type = ArrayConstantIC
	variable = flux
	value = '0.6251605475033565 0.8016360258206108 '
	block = 'MNR10400'
[]
[./ICMNR384]
	type = ArrayConstantIC
	variable = flux
	value = '0.9382998798751366 0.3945440866561644 '
	block = 'MNR384'
[]
[./ICMNR383]
	type = ArrayConstantIC
	variable = flux
	value = '0.9087674523968859 0.36308924570730267 '
	block = 'MNR383'
[]
[./ICMNRC74]
	type = ArrayConstantIC
	variable = flux
	value = '0.6124456008944938 0.3620575851161553 '
	block = 'MNRC74'
[]
[./ICMNR361]
	type = ArrayConstantIC
	variable = flux
	value = '0.4413445671556178 0.23072868822817905 '
	block = 'MNR361'
[]
[./ICB9plug_u]
	type = ArrayConstantIC
	variable = flux
	value = '0.031053898238861434 0.12866079481925158 '
	block = 'B9plug_u'
[]
[./ICB8graph_u]
	type = ArrayConstantIC
	variable = flux
	value = '0.1579242922401001 0.2474642846751433 '
	block = 'B8graph_u'
[]
[./ICMNR398]
	type = ArrayConstantIC
	variable = flux
	value = '0.4265721185619932 0.18616444220913364 '
	block = 'MNR398'
[]
[./ICMNRC79]
	type = ArrayConstantIC
	variable = flux
	value = '0.5423076443472731 0.27634787162850244 '
	block = 'MNRC79'
[]
[./ICMNR385]
	type = ArrayConstantIC
	variable = flux
	value = '0.7075312885781622 0.3109508984425333 '
	block = 'MNR385'
[]
[./ICMNRC78]
	type = ArrayConstantIC
	variable = flux
	value = '0.6621166084054152 0.37396449458191144 '
	block = 'MNRC78'
[]
[./ICMNR358]
	type = ArrayConstantIC
	variable = flux
	value = '0.7110228070977583 0.32504665749450296 '
	block = 'MNR358'
[]
[./ICMNR373]
	type = ArrayConstantIC
	variable = flux
	value = '0.5788729877007104 0.27629051096710905 '
	block = 'MNR373'
[]
[./ICMNR365]
	type = ArrayConstantIC
	variable = flux
	value = '0.3690198393070167 0.19150688120108236 '
	block = 'MNR365'
[]
[./ICA9plug_u]
	type = ArrayConstantIC
	variable = flux
	value = '0.022333789170473392 0.09665687101748668 '
	block = 'A9plug_u'
[]
[./ICA8graph_u]
	type = ArrayConstantIC
	variable = flux
	value = '0.1008653978044999 0.22130990136460182 '
	block = 'A8graph_u'
[]
[./ICA7rifl_u]
	type = ArrayConstantIC
	variable = flux
	value = '0.22845255067897566 0.29047771455173477 '
	block = 'A7rifl_u'
[]
[./ICMNR397]
	type = ArrayConstantIC
	variable = flux
	value = '0.4430903264154159 0.1974133666967325 '
	block = 'MNR397'
[]
[./ICMNR376]
	type = ArrayConstantIC
	variable = flux
	value = '0.5265791847304256 0.24236542066563307 '
	block = 'MNR376'
[]
[./ICMNR366]
	type = ArrayConstantIC
	variable = flux
	value = '0.5110086747608933 0.2732375105472955 '
	block = 'MNR366'
[]
[./ICMNR362]
	type = ArrayConstantIC
	variable = flux
	value = '0.4791776642572418 0.27312445185237527 '
	block = 'MNR362'
[]
[./IC010500]
	type = ArrayConstantIC
	variable = flux
	value = '0.3372856768765873 0.327149881745593 '
	block = 'MNR10500'
[]
[./ICMNR369]
	type = ArrayConstantIC
	variable = flux
	value = '0.24845188562782908 0.15667690568327772 '
	block = 'MNR369'
[]
[]

[Executioner]
type = Steady
solve_type = 'PJFNK'	
#slower updates to stabilize the nonlinear search
#line_search = 'basic'
#petsc_options_iname = '-snes_linesearch_damping'
#petsc_options_value = '0.5'


#automatic_scaling = true

#singular value decomposition to chech conditioning and well-posedness
#petsc_options = '-pc_svd_monitor'
#petsc_options_iname = '-pc_type'
#petsc_options_value = 'svd'
[]


#finite difference preconditioning to check the Jacobian

#[Preconditioning]
#[smp]
#    type = SMP
#    full = true
#    
#	petsc_options_iname = '-pc_type -pc_factor_mat_solver_package '
#    petsc_options_value = ' lu       mumps '
#[] 
#[]

#[Preconditioning]
#[./FDP]
# type = FDP
#[]
#[]


[Outputs]
exodus = true
[]

#[Debug]
#show_execution_order = 'INITIAL LINEAR NONLINEAR'
#[]