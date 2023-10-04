import serpentTools
import numpy as np

univ_names = ["a_F9plug_u",  "a_F8graph_u",   "a_F7rifl_u",   "a_MNR396", "a_MNR375", "a_MNR374", "a_MNR372", "a_MNR382", "a_MNR389",
"a_E9rifl_u",   "a_E8graph_u",   "a_MNR394",     "a_MNRC77", "a_MNR377", "a_MNRC76", "a_MNR395", "a_MNRC80", "a_MNR387", 
"a_D9graph_u",  "a_D8graph_u",   "a_D7rifl_u",   "a_MNR392", "a_MNR381", "a_MNR391", "a_MNR388", "a_MNR378", "a_MNR390",  
"a_C9rifl_u",   "a_C8graph_u",   "a_MNR379",     "a_MNR393", "a_10400", "a_MNR384", "a_MNR383", "a_MNRC74", "a_MNR361", 
"a_B9plug_u",   "a_B8graph_u",   "a_MNR398",     "a_MNRC79", "a_MNR385", "a_MNRC78", "a_MNR358", "a_MNR373", "a_MNR365", 
"a_A9plug_u",   "a_A8graph_u",   "a_A7rifl_u",   "a_MNR397", "a_MNR376", "a_MNR366", "a_MNR362", "a_10500", "a_MNR369" 	
]

det_path = "MNR_63V.inp_det0.m"
res_path = 'MNR_63V.inp_res.m'
output = "userobj.txt"

group_number = 2

d = serpentTools.read(det_path)
r = serpentTools.read(res_path)

lattice_detector = d.__getitem__("lattice_flux")
fluxes = lattice_detector.tallies
module_volume = 3905.803395
normalization = module_volume/np.amax(fluxes)
total_flux = np.zeros(group_number)



universes = []
for name in univ_names:
    if("MNR" in name):
        universes.append(r.getUniv(name, 0,0))
        total_flux += r.getUniv(name, 0,0).infExp['infFlx']


with open(output, 'w') as out:
    out.write("[UserObjects]\n")
    for universe in universes:
        out.write("[./" + universe.name + "]\n")
        out.write("\ttype = SPHFactorsUserObject\n")
        out.write("\tvar_size = " + str(group_number) + "\n")
        out.write("\tvariable = flux \n")
        out.write("\tref_fluxes = '" + str(universe.infExp['infFlx']*normalization)[1:-1] + "'\n")
        out.write("\tblock  = " + universe.name   + " \n")
        out.write("\texecute_on = 'LINEAR' \n[]\n")
    out.write("[./total]\n")
    out.write("\ttype = NormalizationFactorsUserObject\n")
    out.write("\tSPH_user_objects = '")
    for universe in universes:
        out.write(universe.name + " ")
    out.write("'\n\tref_integrals = '" + str(total_flux*normalization)[1:-1])
    out.write("'\n\texecute_on = 'LINEAR' \n[]\n")


vacuum_outflux = np.array([6818030000.0, 18174200000])
current_balance = np.array([2.89400500e+16, 2.22543793e+15])
det_current_balance = np.array([4.91613e+16, -2.3086e+15])


vacuum_surface = 3371.9166
albedo_surface = 24819.6366
albedo_flux_normalization = 1 /np.amax(fluxes)


print(det_current_balance*normalization)








