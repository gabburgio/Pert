import serpentTools
import numpy as np

univ_names = ["F9plug_u",  "F8graph_u",   "F7rifl_u",   "MNR396", "MNR375", "MNR374", "MNR372", "MNR382", "MNR389",
"E9rifl_u",   "E8graph_u",   "MNR394",     "MNRC77", "MNR377", "MNRC76", "MNR395", "MNRC80", "MNR387", 
"D9graph_u",  "D8graph_u",   "D7rifl_u",   "MNR392", "MNR381", "MNR391", "MNR388", "MNR378", "MNR390",  
"C9rifl_u",   "C8graph_u",   "MNR379",     "MNR393", "10400", "MNR384", "MNR383", "MNRC74", "MNR361", 
"B9plug_u",   "B8graph_u",   "MNR398",     "MNRC79", "MNR385", "MNRC78", "MNR358", "MNR373", "MNR365", 
"A9plug_u",   "A8graph_u",   "A7rifl_u",   "MNR397", "MNR376", "MNR366", "MNR362", "10500", "MNR369" 	
]

det_path = "MNR_63V.inp_det0.m"
res_path = 'MNR_63V.inp_res.m'
output = "userobj.txt"

group_number = 2

d = serpentTools.read(det_path)
r = serpentTools.read(res_path)

lattice_detector = d.__getitem__("latt")
fluxes = lattice_detector.tallies
module_volume = 5619.861
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








