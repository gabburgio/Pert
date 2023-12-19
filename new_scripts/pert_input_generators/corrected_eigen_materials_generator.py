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
    'gcu_A9plug': np.array([0.721731, 1.09384, 1.21468, 0.585689]),
    'gcu_B9plug': np.array([0.537655, 0.754058, 0.875044, 0.561113]),
    'gcu_C9rifl': np.array([0.59934, 0.80037, 0.910813, 0.530424]),
    'gcu_D9graph': np.array([0.619509, 0.850026, 0.937119, 0.514143]),
    'gcu_E9rifl': np.array([0.618469, 0.834405, 0.940539, 0.520955]),
    'gcu_F9plug': np.array([0.59167, 0.832128, 0.987951, 0.531167]),
    'gcu_A8graph': np.array([0.616619, 0.91017, 1.07854, 0.709305]),
    'gcu_B8graph': np.array([0.655391, 0.891693, 1.01617, 0.696833]),
    'gcu_C8graph': np.array([0.658658, 0.897915, 1.00303, 0.656797]),
    'gcu_D8graph': np.array([0.621384, 0.885874, 1.01779, 0.659172]),
    'gcu_E8graph': np.array([0.653538, 0.903641, 1.01348, 0.636169]),
    'gcu_F8graph': np.array([0.59626, 0.869445, 1.03481, 0.652855]),
    'gcu_A7rifl': np.array([0.64786, 0.822215, 0.98152, 0.923754]),
    'gcu_MNR398': np.array([1.05725, 1.07444, 1.04086, 0.600685]),
    'gcu_MNR379': np.array([1.03095, 1.06009, 1.04096, 0.600128]),
    'gcu_D7rifl': np.array([0.736137, 0.872617, 0.995794, 0.816414]),
    'gcu_MNR394': np.array([1.04956, 1.06938, 1.00687, 0.542085]),
    'gcu_F7rifl': np.array([0.631407, 0.793069, 0.944104, 0.862301]),
    'gcu_MNR397': np.array([1.02768, 1.02345, 1.00433, 0.988872]),
    'gcu_MNRC79': np.array([0.962778, 0.987162, 1.03708, 1.02181]),
    'gcu_MNR393': np.array([1.17045, 1.11076, 1.04547, 0.722235]),
    'gcu_MNR392': np.array([1.15033, 1.08688, 1.02873, 0.714982]),
    'gcu_MNRC77': np.array([0.90451, 0.933474, 0.99339, 1.02199]),
    'gcu_MNR396': np.array([1.00012, 0.987299, 0.95769, 0.888632]),
    'gcu_MNR376': np.array([1.01806, 1.02224, 1.02396, 1.29454]),
    'gcu_MNR385': np.array([1.17609, 1.1215, 1.04836, 0.856396]),
    'gcu_010400': np.array([0.765011, 0.842992, 0.982172, 1.42161]),
    'gcu_MNR381': np.array([1.19121, 1.10827, 1.04291, 0.842045]),
    'gcu_MNR377': np.array([1.12517, 1.05616, 1.01239, 0.93835]),
    'gcu_MNR375': np.array([0.993668, 0.983641, 0.97147, 1.15692]),
    'gcu_MNR366': np.array([0.972612, 0.992208, 1.00621, 1.45639]),
    'gcu_MNRC78': np.array([0.959514, 0.974103, 1.0241, 1.35626]),
    'gcu_MNR384': np.array([1.2186, 1.11338, 1.04278, 0.967791]),
    'gcu_MNR391': np.array([1.23339, 1.11745, 1.04477, 0.960279]),
    'gcu_MNRC76': np.array([0.952879, 0.944322, 0.992988, 1.43204]),
    'gcu_MNR374': np.array([0.977719, 0.965868, 0.957874, 1.349]),
    'gcu_MNR362': np.array([0.95273, 0.98867, 1.00452, 1.41884]),
    'gcu_MNR358': np.array([1.0778, 1.04583, 1.0255, 1.19326]),
    'gcu_MNR383': np.array([1.17569, 1.08602, 1.03502, 1.10511]),
    'gcu_MNR388': np.array([1.20455, 1.09099, 1.03124, 1.11041]),
    'gcu_MNR395': np.array([1.17112, 1.06598, 1.0039, 1.16667]),
    'gcu_MNR372': np.array([0.978017, 0.959413, 0.949359, 1.50817]),
    'gcu_010500': np.array([0.673594, 0.906583, 0.994321, 1.8245]),
    'gcu_MNR373': np.array([1.0406, 1.02779, 1.01686, 1.34492]),
    'gcu_MNRC74': np.array([0.890221, 0.914919, 0.982086, 1.68978]),
    'gcu_MNR378': np.array([1.09727, 1.02684, 0.995043, 1.36643]),
    'gcu_MNRC80': np.array([0.919912, 0.9139, 0.96202, 1.85969]),
    'gcu_MNR382': np.array([0.956666, 0.937126, 0.928423, 1.83456]),
    'gcu_MNR369': np.array([0.86369, 0.893233, 0.92449, 1.66916]),
    'gcu_MNR365': np.array([0.914923, 0.929645, 0.944918, 1.54292]),
    'gcu_MNR361': np.array([0.920198, 0.932531, 0.939305, 1.5443]),
    'gcu_MNR390': np.array([0.995654, 0.969474, 0.947192, 1.53671]),
    'gcu_MNR387': np.array([0.959188, 0.938755, 0.926212, 1.79598]),
    'gcu_MNR389': np.array([0.888678, 0.901773, 0.897935, 2.26531]),
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

