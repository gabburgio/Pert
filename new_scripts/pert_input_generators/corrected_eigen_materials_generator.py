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
    'gcu_A9plug': np.array([0.721788, 1.09434, 1.21485, 0.585928]),
    'gcu_B9plug': np.array([0.53731, 0.754168, 0.875009, 0.561291]),
    'gcu_C9rifl': np.array([0.598849, 0.800418, 0.910729, 0.530578]),
    'gcu_D9graph': np.array([0.619003, 0.850074, 0.937025, 0.514286]),
    'gcu_E9rifl': np.array([0.618062, 0.83449, 0.940459, 0.521102]),
    'gcu_F9plug': np.array([0.591576, 0.832358, 0.987982, 0.531354]),
    'gcu_A8graph': np.array([0.616223, 0.910224, 1.0785, 0.709512]),
    'gcu_B8graph': np.array([0.654545, 0.891599, 1.01607, 0.696999]),
    'gcu_C8graph': np.array([0.657656, 0.897766, 1.00289, 0.65693]),
    'gcu_D8graph': np.array([0.620424, 0.885722, 1.01763, 0.659291]),
    'gcu_E8graph': np.array([0.652632, 0.903515, 1.01333, 0.636278]),
    'gcu_F8graph': np.array([0.595785, 0.869433, 1.0347, 0.652988]),
    'gcu_A7rifl': np.array([0.647357, 0.822178, 0.981462, 0.92395]),
    'gcu_MNR398': np.array([1.05581, 1.07425, 1.04076, 0.600795]),
    'gcu_MNR379': np.array([1.02924, 1.05982, 1.04081, 0.600213]),
    'gcu_D7rifl': np.array([0.734875, 0.872378, 0.995623, 0.816502]),
    'gcu_MNR394': np.array([1.0479, 1.06912, 1.00668, 0.542122]),
    'gcu_F7rifl': np.array([0.630736, 0.792952, 0.943937, 0.86235]),
    'gcu_MNR397': np.array([1.02711, 1.02346, 1.00435, 0.989058]),
    'gcu_MNRC79': np.array([0.961743, 0.987057, 1.03707, 1.02202]),
    'gcu_MNR393': np.array([1.16874, 1.11053, 1.04539, 0.722341]),
    'gcu_MNR392': np.array([1.14846, 1.08659, 1.02859, 0.715033]),
    'gcu_MNRC77': np.array([0.903114, 0.933225, 0.993223, 1.02199]),
    'gcu_MNR396': np.array([0.99901, 0.987115, 0.957515, 0.888542]),
    'gcu_MNR376': np.array([1.01821, 1.02248, 1.02422, 1.29503]),
    'gcu_MNR385': np.array([1.17572, 1.12164, 1.04857, 0.856693]),
    'gcu_010400': np.array([0.764342, 0.842961, 0.982252, 1.42196]),
    'gcu_MNR381': np.array([1.18971, 1.10809, 1.04288, 0.84215]),
    'gcu_MNR377': np.array([1.12369, 1.05595, 1.01229, 0.93835]),
    'gcu_MNR375': np.array([0.992706, 0.9835, 0.971341, 1.15676]),
    'gcu_MNR366': np.array([0.974418, 0.992943, 1.00693, 1.45759]),
    'gcu_MNRC78': np.array([0.960597, 0.974631, 1.02467, 1.3571]),
    'gcu_MNR384': np.array([1.21867, 1.11364, 1.0431, 0.968183]),
    'gcu_MNR391': np.array([1.23259, 1.11747, 1.04491, 0.960484]),
    'gcu_MNRC76': np.array([0.952006, 0.94425, 0.993007, 1.43211]),
    'gcu_MNR374': np.array([0.977032, 0.965819, 0.957833, 1.34885]),
    'gcu_MNR362': np.array([0.958735, 0.990642, 1.00623, 1.42113]),
    'gcu_MNR358': np.array([1.08188, 1.04714, 1.0266, 1.1945]),
    'gcu_MNR383': np.array([1.17721, 1.08666, 1.03563, 1.10581]),
    'gcu_MNR388': np.array([1.20457, 1.09124, 1.03155, 1.11079]),
    'gcu_MNR395': np.array([1.17055, 1.06604, 1.00404, 1.1668]),
    'gcu_MNR372': np.array([0.977617, 0.959459, 0.949409, 1.50805]),
    'gcu_010500': np.array([0.682673, 0.909841, 0.997187, 1.82879]),
    'gcu_MNR373': np.array([1.04778, 1.02989, 1.0185, 1.3469]),
    'gcu_MNRC74': np.array([0.892444, 0.915778, 0.982928, 1.69122]),
    'gcu_MNR378': np.array([1.09795, 1.02726, 0.995487, 1.36703]),
    'gcu_MNRC80': np.array([0.919843, 0.91407, 0.962245, 1.85999]),
    'gcu_MNR382': np.array([0.956559, 0.937258, 0.928549, 1.83446]),
    'gcu_MNR369': np.array([0.872526, 0.896193, 0.927226, 1.67376]),
    'gcu_MNR365': np.array([0.92071, 0.93159, 0.946618, 1.54554]),
    'gcu_MNR361': np.array([0.922657, 0.933473, 0.940188, 1.54575]),
    'gcu_MNR390': np.array([0.996579, 0.969942, 0.947646, 1.5374]),
    'gcu_MNR387': np.array([0.95945, 0.939002, 0.926455, 1.7962]),
    'gcu_MNR389': np.array([0.888883, 0.901979, 0.898108, 2.26508]),
}



gamma_factors = np.array([0.661269, 0.0990846])



res_path = 'MNR_63V_ARO_4g.inp_res.m'
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

