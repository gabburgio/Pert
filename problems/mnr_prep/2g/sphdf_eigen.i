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
    extra_matrix_tags = 'eigen'
[]
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
	type = CorrectedNuclearMaterial
	sph_factors = '1.07058 0.94131'
 	normalization_factors = '0.944859 0.976196'
	nu_sigma_f = '0.00406024 0.114381  '
	diffusivity = '1.65288  0.254117'
	sigma_r = '0.0296978 0.0734472'
	chi = '1. 0.'
	sigma_s = '0.         0.00021001; 0.0253346 0.       '
[]
[./MNR375]
	block = 'MNR375'
	type = CorrectedNuclearMaterial
	sph_factors = '1.03343 1.02431'
 	normalization_factors = '0.944859 0.976196'
	nu_sigma_f = '0.00293471 0.0869679 '
	diffusivity = '1.62484  0.254796'
	sigma_r = '0.0305067 0.0617899'
	chi = '1. 0.'
	sigma_s = '0.         0.00021409; 0.0262242 0.       '
[]
[./MNR374]
	block = 'MNR374'
	type = CorrectedNuclearMaterial
	sph_factors = '1.00817 1.07464'
 	normalization_factors = '0.944859 0.976196'
	nu_sigma_f = '0.00270264 0.081293  '
	diffusivity = '1.6171   0.253914'
	sigma_r = '0.031057  0.0595547'
	chi = '1. 0.'
	sigma_s = '0.         0.00020552; 0.0267509 0.       '
[]
[./MNR372]
	block = 'MNR372'
	type = CorrectedNuclearMaterial
	sph_factors = '1.01527 1.0456 '
 	normalization_factors = '0.944859 0.976196'
	nu_sigma_f = '0.00292121 0.0861829 '
	diffusivity = '1.62081  0.253484'
	sigma_r = '0.0306166 0.0613963'
	chi = '1. 0.'
	sigma_s = '0.         0.00021682; 0.0263273 0.       '
[]
[./MNR382]
	block = 'MNR382'
	type = CorrectedNuclearMaterial
	sph_factors = '1.0212  1.00731'
 	normalization_factors = '0.944859 0.976196'
	nu_sigma_f = '0.00351264 0.101032  '
	diffusivity = '1.63118  0.254955'
	sigma_r = '0.0303675 0.0678707'
	chi = '1. 0.'
	sigma_s = '0.         0.00022165; 0.0260312 0.       '
[]
[./MNR389]
	block = 'MNR389'
	type = CorrectedNuclearMaterial
	sph_factors = '1.03379  0.957198'
 	normalization_factors = '0.944859 0.976196'
	nu_sigma_f = '0.00362886 0.102645  '
	diffusivity = '1.64681  0.251843'
	sigma_r = '0.0298096 0.0684493'
	chi = '1. 0.'
	sigma_s = '0.         0.00021032; 0.0255032 0.       '
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
	type = CorrectedNuclearMaterial
	sph_factors = '1.11592  0.704263'
 	normalization_factors = '0.944859 0.976196'
	nu_sigma_f = '0.00397531 0.113168  '
	diffusivity = '1.65265  0.251609'
	sigma_r = '0.0298545 0.0732452'
	chi = '1. 0.'
	sigma_s = '0.         0.00019646; 0.0255134 0.       '
[]
[./MNRC77]
	block = 'MNRC77'
	type = CorrectedNuclearMaterial
	sph_factors = '0.949543 1.06259 '
 	normalization_factors = '0.944859 0.976196'
	nu_sigma_f = '0.00128452 0.0387081 '
	diffusivity = '1.55729 0.23928'
	sigma_r = '0.0344676 0.047758 '
	chi = '1. 0.'
	sigma_s = '0.         0.00019802; 0.0286993 0.       '
[]
[./MNR377]
	block = 'MNR377'
	type = CorrectedNuclearMaterial
	sph_factors = '1.04304 1.02051'
 	normalization_factors = '0.944859 0.976196'
	nu_sigma_f = '0.00322925 0.0945195 '
	diffusivity = '1.61193  0.256364'
	sigma_r = '0.0305444 0.0651913'
	chi = '1. 0.'
	sigma_s = '0.         0.00025131; 0.0262038 0.       '
[]
[./MNRC76]
	block = 'MNRC76'
	type = CorrectedNuclearMaterial
	sph_factors = '0.923051 1.32485 '
 	normalization_factors = '0.944859 0.976196'
	nu_sigma_f = '0.00123617 0.0368643 '
	diffusivity = '1.54811 0.23915'
	sigma_r = '0.0348962 0.0473507'
	chi = '1. 0.'
	sigma_s = '0.         0.00020659; 0.02896 0.     '
[]
[./MNR395]
	block = 'MNR395'
	type = CorrectedNuclearMaterial
	sph_factors = '1.05851 1.13825'
 	normalization_factors = '0.944859 0.976196'
	nu_sigma_f = '0.00408749 0.113069  '
	diffusivity = '1.62471  0.256989'
	sigma_r = '0.0301083 0.0729816'
	chi = '1. 0.'
	sigma_s = '0.         0.00027647; 0.025672 0.      '
[]
[./MNRC80]
	block = 'MNRC80'
	type = CorrectedNuclearMaterial
	sph_factors = '0.955279 1.50266 '
 	normalization_factors = '0.944859 0.976196'
	nu_sigma_f = '0.0017507 0.0490902'
	diffusivity = '1.54786  0.243417'
	sigma_r = '0.0318711 0.046008 '
	chi = '1. 0.'
	sigma_s = '0.         0.00021973; 0.0291992 0.       '
[]
[./MNR387]
	block = 'MNR387'
	type = CorrectedNuclearMaterial
	sph_factors = '1.02609 1.0017 '
 	normalization_factors = '0.944859 0.976196'
	nu_sigma_f = '0.0035778 0.101103 '
	diffusivity = '1.6318   0.252432'
	sigma_r = '0.0299828 0.0676964'
	chi = '1. 0.'
	sigma_s = '0.         0.00023423; 0.0256611 0.       '
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
	type = CorrectedNuclearMaterial
	sph_factors = '1.08058 0.74728'
 	normalization_factors = '0.944859 0.976196'
	nu_sigma_f = '0.00386691 0.109578  '
	diffusivity = '1.63262  0.253569'
	sigma_r = '0.0300159 0.0718186'
	chi = '1. 0.'
	sigma_s = '0.         0.00024303; 0.0256448 0.       '
[]
[./MNR381]
	block = 'MNR381'
	type = CorrectedNuclearMaterial
	sph_factors = '1.07347  0.783501'
 	normalization_factors = '0.944859 0.976196'
	nu_sigma_f = '0.003231  0.0964282'
	diffusivity = '1.62341  0.255097'
	sigma_r = '0.030425  0.0664317'
	chi = '1. 0.'
	sigma_s = '0.         0.00022589; 0.0260984 0.       '
[]
[./MNR391]
	block = 'MNR391'
	type = CorrectedNuclearMaterial
	sph_factors = '1.06941  0.979807'
 	normalization_factors = '0.944859 0.976196'
	nu_sigma_f = '0.00371817 0.1062    '
	diffusivity = '1.61945  0.256575'
	sigma_r = '0.0302988 0.0705487'
	chi = '1. 0.'
	sigma_s = '0.         0.00026338; 0.0258958 0.       '
[]
[./MNR388]
	block = 'MNR388'
	type = CorrectedNuclearMaterial
	sph_factors = '1.06283 1.18845'
 	normalization_factors = '0.944859 0.976196'
	nu_sigma_f = '0.00365605 0.103499  '
	diffusivity = '1.61476 0.25583'
	sigma_r = '0.0304044 0.0691421'
	chi = '1. 0.'
	sigma_s = '0.         0.00026564; 0.0259899 0.       '
[]
[./MNR378]
	block = 'MNR378'
	type = CorrectedNuclearMaterial
	sph_factors = '1.02929 1.27105'
 	normalization_factors = '0.944859 0.976196'
	nu_sigma_f = '0.00320022 0.0948006 '
	diffusivity = '1.60941  0.255652'
	sigma_r = '0.030867  0.0654475'
	chi = '1. 0.'
	sigma_s = '0.         0.00024399; 0.0265066 0.       '
[]
[./MNR390]
	block = 'MNR390'
	type = CorrectedNuclearMaterial
	sph_factors = '1.03376 1.02829'
 	normalization_factors = '0.944859 0.976196'
	nu_sigma_f = '0.00373399 0.103779  '
	diffusivity = '1.63195  0.252439'
	sigma_r = '0.0301111 0.0689237'
	chi = '1. 0.'
	sigma_s = '0.         0.00022866; 0.0257534 0.       '
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
	type = CorrectedNuclearMaterial
	sph_factors = '1.10212  0.746209'
 	normalization_factors = '0.944859 0.976196'
	nu_sigma_f = '0.00300618 0.0897828 '
	diffusivity = '1.6184   0.250886'
	sigma_r = '0.0306264 0.0631538'
	chi = '1. 0.'
	sigma_s = '0.         0.00021217; 0.0263183 0.       '
[]
[./MNR393]
	block = 'MNR393'
	type = CorrectedNuclearMaterial
	sph_factors = '1.10788 0.6886 '
 	normalization_factors = '0.944859 0.976196'
	nu_sigma_f = '0.00395569 0.113013  '
	diffusivity = '1.63878  0.252024'
	sigma_r = '0.0298107 0.0734792'
	chi = '1. 0.'
	sigma_s = '0.         0.00023281; 0.0254357 0.       '
[]
[./010400]
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
	type = CorrectedNuclearMaterial
	sph_factors = '1.08276  0.891535'
 	normalization_factors = '0.944859 0.976196'
	nu_sigma_f = '0.00364147 0.105638  '
	diffusivity = '1.62753 0.25282'
	sigma_r = '0.0302523 0.070494 '
	chi = '1. 0.'
	sigma_s = '0.         0.00023998; 0.0258737 0.       '
[]
[./MNR383]
	block = 'MNR383'
	type = CorrectedNuclearMaterial
	sph_factors = '1.06539 1.19219'
 	normalization_factors = '0.944859 0.976196'
	nu_sigma_f = '0.0032356 0.094331 '
	diffusivity = '1.60928  0.255303'
	sigma_r = '0.0307163 0.0652141'
	chi = '1. 0.'
	sigma_s = '0.         0.00025795; 0.0263514 0.       '
[]
[./MNRC74]
	block = 'MNRC74'
	type = CorrectedNuclearMaterial
	sph_factors = '0.922442 1.50607 '
 	normalization_factors = '0.944859 0.976196'
	nu_sigma_f = '0.00102511 0.0305059 '
	diffusivity = '1.53936  0.238393'
	sigma_r = '0.0355437 0.0446055'
	chi = '1. 0.'
	sigma_s = '0.         0.00018863; 0.0294049 0.       '
[]
[./MNR361]
	block = 'MNR361'
	type = CorrectedNuclearMaterial
	sph_factors = '1.00555 1.18148'
 	normalization_factors = '0.944859 0.976196'
	nu_sigma_f = '0.00241464 0.0724451 '
	diffusivity = '1.61107  0.250062'
	sigma_r = '0.0311485 0.0552988'
	chi = '1. 0.'
	sigma_s = '0.         0.00020409; 0.0269128 0.       '
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
	type = CorrectedNuclearMaterial
	sph_factors = '1.16559  0.794821'
 	normalization_factors = '0.944859 0.976196'
	nu_sigma_f = '0.00408389 0.114178  '
	diffusivity = '1.63632  0.253822'
	sigma_r = '0.0298818 0.0733125'
	chi = '1. 0.'
	sigma_s = '0.         0.00022488; 0.0254885 0.       '
[]
[./MNRC79]
	block = 'MNRC79'
	type = CorrectedNuclearMaterial
	sph_factors = '1.03892  0.926908'
 	normalization_factors = '0.944859 0.976196'
	nu_sigma_f = '0.00174708 0.051707  '
	diffusivity = '1.57269  0.240557'
	sigma_r = '0.0336922 0.0539404'
	chi = '1. 0.'
	sigma_s = '0.         0.00020316; 0.0279661 0.       '
[]
[./MNR385]
	block = 'MNR385'
	type = CorrectedNuclearMaterial
	sph_factors = '1.16124  0.706845'
 	normalization_factors = '0.944859 0.976196'
	nu_sigma_f = '0.00362035 0.106144  '
	diffusivity = '1.63587  0.256935'
	sigma_r = '0.0300351 0.0705332'
	chi = '1. 0.'
	sigma_s = '0.         0.00022261; 0.0257051 0.       '
[]
[./MNRC78]
	block = 'MNRC78'
	type = CorrectedNuclearMaterial
	sph_factors = '0.999279 1.08912 '
 	normalization_factors = '0.944859 0.976196'
	nu_sigma_f = '0.0013624 0.0408241'
	diffusivity = '1.55503  0.239457'
	sigma_r = '0.0346912 0.0491797'
	chi = '1. 0.'
	sigma_s = '0.         0.00019278; 0.0287746 0.       '
[]
[./MNR358]
	block = 'MNR358'
	type = CorrectedNuclearMaterial
	sph_factors = '1.08851 1.24018'
 	normalization_factors = '0.944859 0.976196'
	nu_sigma_f = '0.00256254 0.0771136 '
	diffusivity = '1.59373 0.25332'
	sigma_r = '0.0313492 0.0575526'
	chi = '1. 0.'
	sigma_s = '0.         0.00022773; 0.0270483 0.       '
[]
[./MNR373]
	block = 'MNR373'
	type = CorrectedNuclearMaterial
	sph_factors = '1.1055  1.31852'
 	normalization_factors = '0.944859 0.976196'
	nu_sigma_f = '0.00286285 0.085784  '
	diffusivity = '1.58746  0.254326'
	sigma_r = '0.0314953 0.0615151'
	chi = '1. 0.'
	sigma_s = '0.         0.00022221; 0.0271102 0.       '
[]
[./MNR365]
	block = 'MNR365'
	type = CorrectedNuclearMaterial
	sph_factors = '1.07083 1.22356'
 	normalization_factors = '0.944859 0.976196'
	nu_sigma_f = '0.00269029 0.0794021 '
	diffusivity = '1.61146  0.250233'
	sigma_r = '0.0309595 0.0582919'
	chi = '1. 0.'
	sigma_s = '0.         0.00019251; 0.0266971 0.       '
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
	type = CorrectedNuclearMaterial
	sph_factors = '1.2339   0.976528'
 	normalization_factors = '0.944859 0.976196'
	nu_sigma_f = '0.00413444 0.11285   '
	diffusivity = '1.62598  0.253268'
	sigma_r = '0.030545 0.07256 '
	chi = '1. 0.'
	sigma_s = '0.         0.00022833; 0.0260734 0.       '
[]
[./MNR376]
	block = 'MNR376'
	type = CorrectedNuclearMaterial
	sph_factors = '1.21388 1.03729'
 	normalization_factors = '0.944859 0.976196'
	nu_sigma_f = '0.00296593 0.0862987 '
	diffusivity = '1.60207  0.253383'
	sigma_r = '0.0312553 0.0613441'
	chi = '1. 0.'
	sigma_s = '0.         0.00022357; 0.0268941 0.       '
[]
[./MNR366]
	block = 'MNR366'
	type = CorrectedNuclearMaterial
	sph_factors = '1.17108 1.1739 '
 	normalization_factors = '0.944859 0.976196'
	nu_sigma_f = '0.00244784 0.0729825 '
	diffusivity = '1.58737  0.251929'
	sigma_r = '0.0321438 0.0556632'
	chi = '1. 0.'
	sigma_s = '0.         0.00019903; 0.0278026 0.       '
[]
[./MNR362]
	block = 'MNR362'
	type = CorrectedNuclearMaterial
	sph_factors = '1.1832 1.3111'
 	normalization_factors = '0.944859 0.976196'
	nu_sigma_f = '0.00231919 0.0694342 '
	diffusivity = '1.56966  0.249941'
	sigma_r = '0.0326319 0.0541564'
	chi = '1. 0.'
	sigma_s = '0.         0.00019351; 0.0282495 0.       '
[]
[./010500]
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
	type = CorrectedNuclearMaterial
	sph_factors = '1.17705 1.38534'
 	normalization_factors = '0.944859 0.976196'
	nu_sigma_f = '0.00271425 0.0797654 '
	diffusivity = '1.59806  0.247335'
	sigma_r = '0.0316689 0.0585024'
	chi = '1. 0.'
	sigma_s = '0.         0.00017073; 0.0273602 0.       '
[]
[]


[BCs] 
[./albedo] 
    variable = flux
    type = L2ArrayAlbedoBC
	gamma_factors = '1.68111912 17.58705839'
    albedo_matrix = '0.486012 0.0808863; 0.138912 0.744164'
    boundary = 'north south west east bottom'
[]
#[./vacuum]
#    type = ArrayVacuumBC
#    variable = flux
#    boundary = top
#    alpha = 
#[]
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
	albedo_matrix = '0.486012 0.0808863; 0.138912 0.744164'
    execute_on = 'TIMESTEP_END'
    boundary = 'north south west east bottom'
[]
[./alb_1]
    type = AlbedoCorrectedArraySideIntegralPostprocessor
    variable = flux
	albedo_matrix = '0.486012 0.0808863; 0.138912 0.744164'
    component = 1
    execute_on = 'TIMESTEP_END'
    boundary = 'north south west east bottom'
[]
[]


[Executioner]
type = Eigenvalue
[]

[Outputs]
exodus = true
[]