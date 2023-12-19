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
    'gcu_A9plug': np.array([0.756423, 1.14882, 1.28176, 0.593165]),
    'gcu_B9plug': np.array([0.557125, 0.792202, 0.920181, 0.569979]),
    'gcu_C9rifl': np.array([0.621194, 0.839182, 0.951139, 0.534411]),
    'gcu_D9graph': np.array([0.642959, 0.898579, 0.986314, 0.519635]),
    'gcu_E9rifl': np.array([0.647095, 0.880471, 0.999279, 0.530955]),
    'gcu_F9plug': np.array([0.619464, 0.88015, 1.0391, 0.542706]),
    'gcu_A8graph': np.array([0.640186, 0.94762, 1.13329, 0.716396]),
    'gcu_B8graph': np.array([0.680822, 0.932762, 1.06837, 0.703797]),
    'gcu_C8graph': np.array([0.683753, 0.93413, 1.04832, 0.659911]),
    'gcu_D8graph': np.array([0.642392, 0.92322, 1.05876, 0.663509]),
    'gcu_E8graph': np.array([0.682904, 0.953718, 1.06966, 0.64839]),
    'gcu_F8graph': np.array([0.62386, 0.919452, 1.09128, 0.667419]),
    'gcu_A7rifl': np.array([0.670852, 0.858266, 1.03221, 0.954591]),
    'gcu_MNR398': np.array([1.0994, 1.12106, 1.09544, 0.613064]),
    'gcu_MNR379': np.array([1.07915, 1.1107, 1.08965, 0.604923]),
    'gcu_D7rifl': np.array([0.757629, 0.90701, 1.03931, 0.834423]),
    'gcu_MNR394': np.array([1.09097, 1.12067, 1.06056, 0.557604]),
    'gcu_F7rifl': np.array([0.652887, 0.832969, 1.0005, 0.904478]),
    'gcu_MNR397': np.array([1.06579, 1.06884, 1.05599, 1.0446]),
    'gcu_MNRC79': np.array([0.966568, 1.01818, 1.05063, 0.919017]),
    'gcu_MNR393': np.array([1.21378, 1.15866, 1.08889, 0.728304]),
    'gcu_MNR392': np.array([1.19065, 1.13354, 1.0731, 0.724826]),
    'gcu_MNRC77': np.array([0.90953, 0.96336, 1.00861, 0.934514]),
    'gcu_MNR396': np.array([1.03807, 1.03513, 1.00991, 0.953988]),
    'gcu_MNR376': np.array([1.06639, 1.07379, 1.08024, 1.41666]),
    'gcu_MNR385': np.array([1.21509, 1.16359, 1.09824, 0.909173]),
    'gcu_010400': np.array([0.793911, 0.877683, 1.02474, 1.48025]),
    'gcu_MNR381': np.array([1.2476, 1.15954, 1.09, 0.882164]),
    'gcu_MNR377': np.array([1.16229, 1.09508, 1.0604, 1.01825]),
    'gcu_MNR375': np.array([1.04372, 1.03538, 1.02782, 1.28227]),
    'gcu_MNR366': np.array([1.00891, 1.03493, 1.05629, 1.59006]),
    'gcu_MNRC78': np.array([0.966148, 1.00494, 1.03882, 1.25962]),
    'gcu_MNR384': np.array([1.26671, 1.16042, 1.08907, 1.00762]),
    'gcu_MNR391': np.array([1.2835, 1.16334, 1.08949, 1.00677]),
    'gcu_MNRC76': np.array([0.963803, 0.973453, 1.0046, 1.34259]),
    'gcu_MNR374': np.array([1.01549, 1.00899, 1.00775, 1.48602]),
    'gcu_MNR362': np.array([1.00577, 1.03952, 1.0588, 1.56417]),
    'gcu_MNR358': np.array([1.12351, 1.08699, 1.07396, 1.32408]),
    'gcu_MNR383': np.array([1.22774, 1.1293, 1.08128, 1.20668]),
    'gcu_MNR388': np.array([1.27234, 1.14145, 1.07829, 1.21463]),
    'gcu_MNR395': np.array([1.23929, 1.11703, 1.05445, 1.31099]),
    'gcu_MNR372': np.array([1.04207, 1.0115, 1.00428, 1.70543]),
    'gcu_010500': np.array([0.706748, 0.951696, 1.04482, 1.99854]),
    'gcu_MNR373': np.array([1.08174, 1.06836, 1.06562, 1.48692]),
    'gcu_MNRC74': np.array([0.902293, 0.94213, 0.994493, 1.62448]),
    'gcu_MNR378': np.array([1.15185, 1.0708, 1.04029, 1.51665]),
    'gcu_MNRC80': np.array([0.982934, 0.961908, 1.01329, 2.11178]),
    'gcu_MNR382': np.array([1.03045, 0.992631, 0.982777, 2.08205]),
    'gcu_MNR369': np.array([0.918803, 0.943904, 0.976023, 1.86181]),
    'gcu_MNR365': np.array([0.970201, 0.981157, 1.00019, 1.77648]),
    'gcu_MNR361': np.array([0.965647, 0.974086, 0.991749, 1.81236]),
    'gcu_MNR390': np.array([1.06161, 1.02103, 0.999278, 1.77079]),
    'gcu_MNR387': np.array([1.03383, 0.995861, 0.980708, 2.03583]),
    'gcu_MNR389': np.array([0.959328, 0.95787, 0.952722, 2.59557]),
}


gamma_factors = np.array([0.661269, 0.0990846])



res_path = 'MNR_63V_ARM_4g.inp_res.m'
output_path = "corrected_eigen_materials.txt"
group_number = 4


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

