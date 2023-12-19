import serpentTools
import numpy as np

univ_names = ["gcu_F9plug",  "gcu_F8graph",   "gcu_F7rifl",   "gcu_MNR396", "gcu_MNR375", "gcu_MNR374", "gcu_MNR372", "gcu_MNR382", "gcu_MNR389",
"gcu_E9rifl",   "gcu_E8graph",   "gcu_MNR394",     "gcu_MNRC77", "gcu_MNR377", "gcu_MNRC76", "gcu_MNR395", "gcu_MNRC80", "gcu_MNR387", 
"gcu_D9graph",  "gcu_D8graph",   "gcu_D7rifl",   "gcu_MNR392", "gcu_MNR381", "gcu_MNR391", "gcu_MNR388", "gcu_MNR378", "gcu_MNR390",  
"gcu_C9rifl",   "gcu_C8graph",   "gcu_MNR379",     "gcu_MNR393", "gcu_010400", "gcu_MNR384", "gcu_MNR383", "gcu_MNRC74", "gcu_MNR361", 
"gcu_B9plug",   "gcu_B8graph",   "gcu_MNR398",     "gcu_MNRC79", "gcu_MNR385", "gcu_MNRC78", "gcu_MNR358", "gcu_MNR373", "gcu_MNR365", 
"gcu_A9plug",   "gcu_A8graph",   "gcu_A7rifl",   "gcu_MNR397", "gcu_MNR376", "gcu_MNR366", "gcu_MNR362", "gcu_010500", "gcu_MNR369" 	
]


group_number = 4
res_path = 'MNR_63V_ARI_4g.inp_res.m' 
output_path = "sphdf_materials.txt"




def write_sphdf_material(uni, path):
    mat_type = "UOSphdfMaterial"
    ref_k = "1"
    norm_uo = "total"
    with open(path, 'a') as out_file:
        out_file.write("[./mat_" + uni.name + "]\n\t" + "block = '" + uni.name[4:] + "'\n\t")
        out_file.write("type = " + mat_type + "\n")

        out_file.write("\t"  + "ref_nu_sigma_f = " + "'" + str(uni.infExp['infNsf'])[1:-1] + "'\n"  )
        out_file.write("\t"  + "ref_diffusivity = " + "'" + str(uni.infExp['infDiffcoef'])[1:-1] + "'\n"  )
        out_file.write("\t"  + "ref_sigma_r = " + "'" + str(uni.infExp['infRemxs'])[1:-1] + "'\n"  )
        out_file.write("\tchi = " + "'" + str(uni.infExp['infChit'])[1:-1] + "'\n"  )
        out_file.write("\tref_k = " + ref_k + "\n"  )


        scatt_shape = (group_number, group_number)
        
        scatt_mult_matrix = np.zeros(scatt_shape)
        scatt_matrix = np.zeros(scatt_shape)

        for j in range(len(uni.infExp['infSp0'])):
            index = np.unravel_index(j, scatt_shape)
            scatt_mult_matrix[index] = uni.infExp['infSp0'][j]
            scatt_matrix[index] = uni.infExp['infS0'][j]
        
        scatt_mult_matrix = np.transpose(scatt_mult_matrix)

        for i in range(group_number):
            scatt_mult_matrix[i][i] -= scatt_matrix[i][i]

        out_file.write("\tref_sigma_s = '")
        for i in range(group_number):
            out_file.write(str(scatt_mult_matrix[i][:])[1:-1])
            if (i < group_number-1):
                out_file.write("; ")

        out_file.write("'\n\tsph_factors_uo = uo_" + uni.name + "\n"  )
        out_file.write("\tnormalization_factors_uo = " + norm_uo + "\n"  )

        out_file.write("\n[]\n")




r = serpentTools.read(res_path)


universes = []
for name in univ_names:
    universes.append(r.getUniv(name, 0,0))


print(len(universes))


#write materials

with open(output_path, 'w') as f:
    f.write("[Materials]\n")

for universe in universes:
    write_sphdf_material(universe, output_path)

with open(output_path, 'a') as f:
    f.write("[]\n")




# write albedo
    





data = [ 8.69676E-02, 1.37082E-01, 8.50043E-02, 1.01336E-01, 0.00000E+00, 1.70448E-01, 2.32033E-01, 1.70250E-01, 0.00000E+00, 0.00000E+00, 2.39851E-01, 3.85040E-01, 0.00000E+00, 0.00000E+00, 8.35499E-06, 7.78011E-01]

# Reshape the flat list into a 2D array with four columns
alb_array = np.array(data).reshape(-1, group_number)

transp_alb_array = alb_array.transpose()

with open(output_path, 'a') as f:
    f.write("\n\n\talbedo_matrix = '")
    for i in range(group_number):
        f.write(str(transp_alb_array[i, :])[1:-1])
        f.write("; ")
    f.write("'")




    