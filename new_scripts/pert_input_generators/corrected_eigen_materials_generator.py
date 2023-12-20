import serpentTools
import numpy as np


univ_names = ["gcu_F9plug",  "gcu_F8graph",   "gcu_F7rifl",   "gcu_MNR396", "gcu_MNR375", "gcu_MNR374", "gcu_MNR372", "gcu_MNR382", "gcu_MNR389",
"gcu_E9rifl",   "gcu_E8graph",   "gcu_MNR394",     "gcu_MNRC77", "gcu_MNR377", "gcu_MNRC76", "gcu_MNR395", "gcu_MNRC80", "gcu_MNR387", 
"gcu_D9graph",  "gcu_D8graph",   "gcu_D7rifl",   "gcu_MNR392", "gcu_MNR381", "gcu_MNR391", "gcu_MNR388", "gcu_MNR378", "gcu_MNR390",  
"gcu_C9rifl",   "gcu_C8graph",   "gcu_MNR379",     "gcu_MNR393", "gcu_010400", "gcu_MNR384", "gcu_MNR383", "gcu_MNRC74", "gcu_MNR361", 
"gcu_B9plug",   "gcu_B8graph",   "gcu_MNR398",     "gcu_MNRC79", "gcu_MNR385", "gcu_MNRC78", "gcu_MNR358", "gcu_MNR373", "gcu_MNR365", 
"gcu_A9plug",   "gcu_A8graph",   "gcu_A7rifl",   "gcu_MNR397", "gcu_MNR376", "gcu_MNR366", "gcu_MNR362", "gcu_010500", "gcu_MNR369" 	
]


sph_factors = {
    'gcu_A9plug': np.array([0.967211, 0.540666]),
    'gcu_B9plug': np.array([0.7103, 0.531154]),
    'gcu_C9rifl': np.array([0.765964, 0.505073]),
    'gcu_D9graph': np.array([0.805456, 0.492178]),
    'gcu_E9rifl': np.array([0.79871, 0.496229]),
    'gcu_F9plug': np.array([0.779297, 0.494318]),
    'gcu_A8graph': np.array([0.847713, 0.670169]),
    'gcu_B8graph': np.array([0.854117, 0.667043]),
    'gcu_C8graph': np.array([0.857178, 0.632162]),
    'gcu_D8graph': np.array([0.840037, 0.635953]),
    'gcu_E8graph': np.array([0.856493, 0.613369]),
    'gcu_F8graph': np.array([0.819561, 0.621177]),
    'gcu_A7rifl': np.array([0.810184, 0.896251]),
    'gcu_MNR398': np.array([1.08227, 0.584702]),
    'gcu_MNR379': np.array([1.07661, 0.587425]),
    'gcu_D7rifl': np.array([0.881274, 0.812458]),
    'gcu_MNR394': np.array([1.06467, 0.53546]),
    'gcu_F7rifl': np.array([0.785029, 0.848481]),
    'gcu_MNR397': np.array([1.04371, 1.0076]),
    'gcu_MNRC79': np.array([1.00583, 0.915485]),
    'gcu_MNR393': np.array([1.15501, 0.736309]),
    'gcu_MNR392': np.array([1.13621, 0.735057]),
    'gcu_MNRC77': np.array([0.958414, 0.939329]),
    'gcu_MNR396': np.array([1.01034, 0.929419]),
    'gcu_MNR376': np.array([1.05988, 1.40222]),
    'gcu_MNR385': np.array([1.15994, 0.927524]),
    'gcu_010400': np.array([0.904243, 1.53454]),
    'gcu_MNR381': np.array([1.1815, 0.922122]),
    'gcu_MNR377': np.array([1.11915, 1.05754]),
    'gcu_MNR375': np.array([1.02596, 1.29277]),
    'gcu_MNR366': np.array([1.01734, 1.59666]),
    'gcu_MNRC78': np.array([1.00726, 1.30474]),
    'gcu_MNR384': np.array([1.18941, 1.06225]),
    'gcu_MNR391': np.array([1.20384, 1.07301]),
    'gcu_MNRC76': np.array([0.997745, 1.42155]),
    'gcu_MNR374': np.array([1.00274, 1.52443]),
    'gcu_MNR362': np.array([1.02113, 1.59671]),
    'gcu_MNR358': np.array([1.10341, 1.38686]),
    'gcu_MNR383': np.array([1.16723, 1.2863]),
    'gcu_MNR388': np.array([1.19179, 1.30748]),
    'gcu_MNR395': np.array([1.15828, 1.40299]),
    'gcu_MNR372': np.array([1.01537, 1.77044]),
    'gcu_010500': np.array([0.899684, 2.06289]),
    'gcu_MNR373': np.array([1.07719, 1.55381]),
    'gcu_MNRC74': np.array([0.955994, 1.71934]),
    'gcu_MNR378': np.array([1.10522, 1.62074]),
    'gcu_MNRC80': np.array([1.00032, 2.25119]),
    'gcu_MNR382': np.array([0.99716, 2.16673]),
    'gcu_MNR369': np.array([0.92654, 1.88207]),
    'gcu_MNR365': np.array([0.971615, 1.81529]),
    'gcu_MNR361': np.array([0.967584, 1.86733]),
    'gcu_MNR390': np.array([1.02348, 1.83949]),
    'gcu_MNR387': np.array([1.0008, 2.11651]),
    'gcu_MNR389': np.array([0.941556, 2.64564]),
}


gamma_factors = np.array([0.661269, 0.0990846])



res_path = 'MNR_63V_ARM.inp_res.m'
output_path = "corrected_eigen_materials.txt"
group_number = 2


corrected = True


def writematerial(uni, path):
    if(corrected):
        mat_type = "CorrectedNuclearMaterial"
    else:
        mat_type = "NuclearMaterial"
    with open(path, 'a') as out_file:
        out_file.write("[./" + uni.name + "]\n\t" + "block = '" + uni.name[4:] + "'\n\t")
        out_file.write("type = " + mat_type + "\n")

        if(corrected):
            out_file.write("\t"  + "sph_factors = " + "'" + str(sph_factors[uni.name])[1:-1] + "'\n "  )
        
        out_file.write("\t"  + "nu_sigma_f = " + "'" + str(uni.infExp['infNsf'])[1:-1] + "'\n"  )
        out_file.write("\t"  + "diffusivity = " + "'" + str(uni.infExp['infDiffcoef'])[1:-1] + "'\n"  )
        out_file.write("\t"  + "sigma_r = " + "'" + str(uni.infExp['infRemxs'])[1:-1] + "'\n"  )
        out_file.write("\tchi = " + "'" + str(uni.infExp['infChit'])[1:-1] + "'\n"  )

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

        out_file.write("\tsigma_s = '")
        for i in range(group_number):
            out_file.write(str(scatt_mult_matrix[i][:])[1:-1])
            if (i < group_number-1):
                out_file.write("; ")
        out_file.write("'\n[]\n")



r = serpentTools.read(res_path)


universes = []
for name in univ_names:
    universes.append(r.getUniv(name, 0,0))


with open(output_path, 'w') as f:
    f.write("[Materials]\n")
for universe in universes:
    writematerial(universe, output_path)
with open(output_path, 'a') as f:
    f.write("[]\n")

