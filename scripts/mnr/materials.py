import serpentTools
import numpy as np

univ_names = ["F9plug_u",  "F8graph_u",   "F7rifl_u",   "MNR396", "MNR375", "MNR374", "MNR372", "MNR382", "MNR389",
"E9rifl_u",   "E8graph_u",   "MNR394",     "MNRC77", "MNR377", "MNRC76", "MNR395", "MNRC80", "MNR387", 
"D9graph_u",  "D8graph_u",   "D7rifl_u",   "MNR392", "MNR381", "MNR391", "MNR388", "MNR378", "MNR390",  
"C9rifl_u",   "C8graph_u",   "MNR379",     "MNR393", "MNR10400", "MNR384", "MNR383", "MNRC74", "MNR361", 
"B9plug_u",   "B8graph_u",   "MNR398",     "MNRC79", "MNR385", "MNRC78", "MNR358", "MNR373", "MNR365", 
"A9plug_u",   "A8graph_u",   "A7rifl_u",   "MNR397", "MNR376", "MNR366", "MNR362", "MNR10500", "MNR369" 	
]

fuel_names = []

for name in univ_names:
    if("MNR" in name and name != "MNR10400" and name!= "MNR10500"):
        fuel_names.append(name)

res_path = 'MNR_63V.inp_res.m'
output_path = "materials.txt"
group_number = 2


def writematerial(uni, path):
    mat_type = "NuclearMaterial"
    with open(path, 'a') as out_file:
        out_file.write("[./" + uni.name + "]\n\t" + "block = '" + uni.name + "'\n\t")
        out_file.write("type = " + mat_type + "\n")

        out_file.write("\t"  + "nu_sigma_f = " + "'" + str(uni.infExp['infNsf'])[1:-1] + "'\n"  )
        out_file.write("\t"  + "diffusivity = " + "'" + str(uni.infExp['infDiffcoef'])[1:-1] + "'\n"  )
        out_file.write("\t"  + "sigma_r = " + "'" + str(uni.infExp['infRemxs'])[1:-1] + "'\n"  )
        out_file.write("\tchi = " + "'" + str(uni.infExp['infChit'])[1:-1] + "'\n"  )

        scatt_shape = (group_number, group_number)
        scatt_matrix = np.zeros(scatt_shape)

        for j in range(len(uni.infExp['infSp0'])):
            index = np.unravel_index(j, scatt_shape)
            scatt_matrix[index] = uni.infExp['infSp0'][j]
        
        scatt_matrix = np.transpose(scatt_matrix)

        for i in range(group_number):
            scatt_matrix[i][i] = 0

        out_file.write("\tsigma_s = '")
        for i in range(group_number):
            out_file.write(str(scatt_matrix[i][:])[1:-1])
            if (i < group_number-1):
                out_file.write("; ")
        out_file.write("'\n[]\n")



def write_sphdf_material(uni, path):
    mat_type = "UOSphdfMaterial"
    ref_k = "0.99939"
    norm_uo = "total"
    with open(path, 'a') as out_file:
        out_file.write("[./" + uni.name + "]\n\t" + "block = '" + uni.name + "'\n\t")
        out_file.write("type = " + mat_type + "\n")

        out_file.write("\t"  + "ref_nu_sigma_f = " + "'" + str(uni.infExp['infNsf'])[1:-1] + "'\n"  )
        out_file.write("\t"  + "ref_diffusivity = " + "'" + str(uni.infExp['infDiffcoef'])[1:-1] + "'\n"  )
        out_file.write("\t"  + "ref_sigma_r = " + "'" + str(uni.infExp['infRemxs'])[1:-1] + "'\n"  )
        out_file.write("\tchi = " + "'" + str(uni.infExp['infChit'])[1:-1] + "'\n"  )
        out_file.write("\tref_k = " + ref_k + "\n"  )


        scatt_shape = (group_number, group_number)
        scatt_matrix = np.zeros(scatt_shape)

        for j in range(len(uni.infExp['infSp0'])):
            index = np.unravel_index(j, scatt_shape)
            scatt_matrix[index] = uni.infExp['infSp0'][j]
        
        scatt_matrix = np.transpose(scatt_matrix)

        for i in range(group_number):
            scatt_matrix[i][i] = 0

        out_file.write("\tref_sigma_s = '")
        for i in range(group_number):
            out_file.write(str(scatt_matrix[i][:])[1:-1])
            if (i < group_number-1):
                out_file.write("; ")

        out_file.write("'\n\tsph_factors_uo = " + uni.name + "\n"  )
        out_file.write("\tnormalization_factors_uo = " + norm_uo + "\n"  )

        out_file.write("\n[]\n")




r = serpentTools.read(res_path)


universes = []
for name in univ_names:
    normal = True
    if(name == "MNR10400"):
        universes.append(r.getUniv("010400", 0,0))   
        normal = False
    if(name == "MNR10500"):
        universes.append(r.getUniv("010500", 0,0))        
        normal = False
    if(normal):
        universes.append(r.getUniv(name, 0,0))

fuel_names = []
for name in univ_names:
    if("MNR" in name and name != "MNR10400" and name!= "MNR10500"):
        fuel_names.append(name)



#write materials

with open(output_path, 'w') as f:
    f.write("[Materials]\n")
for universe in universes:
    if(universe.name in fuel_names):
        write_sphdf_material(universe, output_path)
    else:
        writematerial(universe, output_path)
with open(output_path, 'a') as f:
    f.write("[]\n")

