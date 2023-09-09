import numpy as np
import serpentTools


det_path = "MNR_63V.inp_det0.m"
output_path = "ICs.txt"
univ_names = ["F9plug_u",  "F8graph_u",   "F7rifl_u",   "MNR396", "MNR375", "MNR374", "MNR372", "MNR382", "MNR389",
"E9rifl_u",   "E8graph_u",   "MNR394",     "MNRC77", "MNR377", "MNRC76", "MNR395", "MNRC80", "MNR387", 
"D9graph_u",  "D8graph_u",   "D7rifl_u",   "MNR392", "MNR381", "MNR391", "MNR388", "MNR378", "MNR390",  
"C9rifl_u",   "C8graph_u",   "MNR379",     "MNR393", "010400", "MNR384", "MNR383", "MNRC74", "MNR361", 
"B9plug_u",   "B8graph_u",   "MNR398",     "MNRC79", "MNR385", "MNRC78", "MNR358", "MNR373", "MNR365", 
"A9plug_u",   "A8graph_u",   "A7rifl_u",   "MNR397", "MNR376", "MNR366", "MNR362", "010500", "MNR369" 	
]

d = serpentTools.read(det_path)

num_groups = 2
lattice_detector = d.__getitem__("latt")

fluxes = lattice_detector.tallies

#print(fluxes)
#
tp_fluxes = np.transpose(fluxes)
module_volume = 5619.861

normalization = np.amax(fluxes)


fluxes /= normalization

print(fluxes*module_volume)

with open (output_path, 'w') as out:
    out.write("\n[ICs]\n")
    for i,name in enumerate(univ_names):
        out.write("[./IC" + name + "]\n\t" + "type = ArrayConstantIC\n\t" + "variable = flux\n\tvalue = '")
        for j in reversed(range(num_groups)):
            out.write(str(fluxes[j][i]) + " ")
        out.write("'\n\tblock = '" + name + "'\n[]\n")
    out.write("[]")
    