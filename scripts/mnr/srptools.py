import serpentTools
import numpy as np
#import albedo

univ_names = ["F9plug_u",  "F8graph_u",   "F7rifl_u",   "MNR396", "MNR375", "MNR374", "MNR372", "MNR382", "MNR389",
"E9rifl_u",   "E8graph_u",   "MNR394",     "MNRC77", "MNR377", "MNRC76", "MNR395", "MNRC80", "MNR387", 
"D9graph_u",  "D8graph_u",   "D7rifl_u",   "MNR392", "MNR381", "MNR391", "MNR388", "MNR378", "MNR390",  
"C9rifl_u",   "C8graph_u",   "MNR379",     "MNR393", "010400", "MNR384", "MNR383", "MNRC74", "MNR361", 
"B9plug_u",   "B8graph_u",   "MNR398",     "MNRC79", "MNR385", "MNRC78", "MNR358", "MNR373", "MNR365", 
"A9plug_u",   "A8graph_u",   "A7rifl_u",   "MNR397", "MNR376", "MNR366", "MNR362", "010500", "MNR369" 	
]

res_path = 'MNR_63V.inp_res.m'
mat_type = "NuclearMaterial"
output_path = "mnr_sphdf.i"
ref = ""
group_number = 2


def writematerial(uni, path):
    with open(path, 'a') as out_file:
        out_file.write("[./" + uni.name + "]\n\t" + "block = '" + uni.name + "'\n\t")
        out_file.write("type = " + mat_type + "\n")

        out_file.write("\t" + ref + "nu_sigma_f = " + "'" + str(uni.infExp['infNsf'])[1:-1] + "'\n"  )
        out_file.write("\t" + ref + "diffusivity = " + "'" + str(uni.infExp['infDiffcoef'])[1:-1] + "'\n"  )
        out_file.write("\t" + ref + "sigma_r = " + "'" + str(uni.infExp['infRemxs'])[1:-1] + "'\n"  )
        out_file.write("\tchi = " + "'" + str(uni.infExp['infChit'])[1:-1] + "'\n"  )

        scatt_shape = (group_number, group_number)
        scatt_matrix = np.zeros(scatt_shape)

        for j in range(len(uni.infExp['infSp0'])):
            index = np.unravel_index(j, scatt_shape)
            scatt_matrix[index] = uni.infExp['infSp0'][j]
        
        scatt_matrix = np.transpose(scatt_matrix)

        out_file.write("\tsigma_s = '")
        for i in range(group_number):
            out_file.write(str(scatt_matrix[i][:])[1:-1])
            if (i < group_number-1):
                out_file.write("; ")
        out_file.write("'\n[]\n")



r = serpentTools.read(res_path)


universes = []
for name in univ_names:
    universes.append(r.getUniv(name, 0,0))


#write materials

with open(output_path, 'w') as f:
    f.write("[Materials]\n")
for universe in universes:
    writematerial(universe, output_path)
with open(output_path, 'a') as f:
    f.write("[]\n")

#write albedo bc

ALB_TOT_ALB = []


lines = []
surface_number = 6

with open(res_path, 'r') as r:
    lines = r.readlines()

#isolate actual entries

for i,line in enumerate(lines):
    if line.startswith("ALB_TOT_ALB"):
        intermediate = ((line.split("=")[1]).split("  ")[1:])
        for string in intermediate: 
            ALB_TOT_ALB.append(string.split(" ")[0])

ALB_TOT_ALB = list(map(float, ALB_TOT_ALB))

albedo_shape = (group_number,group_number)
albedo_matrix = np.empty(albedo_shape)

for i in range(len(ALB_TOT_ALB)):
    alb_index = np.unravel_index(i, albedo_shape)
    albedo_matrix[alb_index] = ALB_TOT_ALB[i]


with open(output_path, 'a') as f:
    f.write("\n[BCs] \n[./albedo] \n\ttype = ArrayAlbedoBC\n\tdiffusivity = diffusivity\n\talbedo_matrix = '")
    for i in range(group_number):
        f.write(str(albedo_matrix[i][:])[1:-1])
        if (i < group_number-1):
                f.write("; ")
    f.write("'\n[]\n")

