import serpentTools
import numpy as np


univ_names = ["gcu_F9plug",  "gcu_F8graph",   "gcu_F7rifl",   "gcu_MNR396", "gcu_MNR375", "gcu_MNR374", "gcu_MNR372", "gcu_MNR382", "gcu_MNR389",
"gcu_E9rifl",   "gcu_E8graph",   "gcu_MNR394",     "gcu_MNRC77", "gcu_MNR377", "gcu_MNRC76", "gcu_MNR395", "gcu_MNRC80", "gcu_MNR387", 
"gcu_D9graph",  "gcu_D8graph",   "gcu_D7rifl",   "gcu_MNR392", "gcu_MNR381", "gcu_MNR391", "gcu_MNR388", "gcu_MNR378", "gcu_MNR390",  
"gcu_C9rifl",   "gcu_C8graph",   "gcu_MNR379",     "gcu_MNR393", "gcu_010400", "gcu_MNR384", "gcu_MNR383", "gcu_MNRC74", "gcu_MNR361", 
"gcu_B9plug",   "gcu_B8graph",   "gcu_MNR398",     "gcu_MNRC79", "gcu_MNR385", "gcu_MNRC78", "gcu_MNR358", "gcu_MNR373", "gcu_MNR365", 
"gcu_A9plug",   "gcu_A8graph",   "gcu_A7rifl",   "gcu_MNR397", "gcu_MNR376", "gcu_MNR366", "gcu_MNR362", "gcu_010500", "gcu_MNR369" 	
]



sublists = [univ_names[i:i+9] for i in range(0, len(univ_names), 9)]
transposed_lists = [list(row[::-1]) for row in zip(*sublists)]
flattened_list = [item for sublist in transposed_lists for item in sublist]




sph_factors = {
    'gcu_A9plug': np.array([0.923296, 0.542133]),
    'gcu_B9plug': np.array([0.680563, 0.533118]),
    'gcu_C9rifl': np.array([0.738896, 0.508377]),
    'gcu_D9graph': np.array([0.772523, 0.493988]),
    'gcu_E9rifl': np.array([0.7579, 0.494282]),
    'gcu_F9plug': np.array([0.744059, 0.493153]),
    'gcu_A8graph': np.array([0.814202, 0.672189]),
    'gcu_B8graph': np.array([0.820667, 0.669805]),
    'gcu_C8graph': np.array([0.824791, 0.635249]),
    'gcu_D8graph': np.array([0.809874, 0.638548]),
    'gcu_E8graph': np.array([0.816182, 0.609775]),
    'gcu_F8graph': np.array([0.781951, 0.61712]),
    'gcu_A7rifl': np.array([0.778182, 0.878819]),
    'gcu_MNR398': np.array([1.0402, 0.580017]),
    'gcu_MNR379': np.array([1.0294, 0.586798]),
    'gcu_D7rifl': np.array([0.850582, 0.80184]),
    'gcu_MNR394': np.array([1.01828, 0.526054]),
    'gcu_F7rifl': np.array([0.750433, 0.820524]),
    'gcu_MNR397': np.array([1.00103, 0.958109]),
    'gcu_MNRC79': np.array([0.990273, 1.0125]),
    'gcu_MNR393': np.array([1.11102, 0.730914]),
    'gcu_MNR392': np.array([1.09214, 0.726387]),
    'gcu_MNRC77': np.array([0.941757, 1.02511]),
    'gcu_MNR396': np.array([0.965939, 0.873051]),
    'gcu_MNR376': np.array([1.00965, 1.28412]),
    'gcu_MNR385': np.array([1.11725, 0.872222]),
    'gcu_010400': np.array([0.870049, 1.47212]),
    'gcu_MNR381': np.array([1.13046, 0.879407]),
    'gcu_MNR377': np.array([1.07797, 0.975483]),
    'gcu_MNR375': np.array([0.975131, 1.16998]),
    'gcu_MNR366': np.array([0.978949, 1.46174]),
    'gcu_MNRC78': np.array([0.992006, 1.38884]),
    'gcu_MNR384': np.array([1.14438, 1.01248]),
    'gcu_MNR391': np.array([1.1572, 1.01662]),
    'gcu_MNRC76': np.array([0.978655, 1.49588]),
    'gcu_MNR374': np.array([0.960875, 1.3791]),
    'gcu_MNR362': np.array([0.981208, 1.44865]),
    'gcu_MNR358': np.array([1.06587, 1.2489]),
    'gcu_MNR383': np.array([1.12342, 1.17241]),
    'gcu_MNR388': np.array([1.13667, 1.1853]),
    'gcu_MNR395': np.array([1.10115, 1.23525]),
    'gcu_MNR372': np.array([0.959193, 1.5447]),
    'gcu_010500': np.array([0.875823, 1.8795]),
    'gcu_MNR373': np.array([1.04584, 1.40208]),
    'gcu_MNRC74': np.array([0.940459, 1.75963]),
    'gcu_MNR378': np.array([1.05774, 1.44172]),
    'gcu_MNRC80': np.array([0.946438, 1.95403]),
    'gcu_MNR382': np.array([0.936108, 1.86836]),
    'gcu_MNR369': np.array([0.887517, 1.67263]),
    'gcu_MNR365': np.array([0.927531, 1.5708]),
    'gcu_MNR361': np.array([0.924137, 1.57628]),
    'gcu_MNR390': np.array([0.967729, 1.5713]),
    'gcu_MNR387': np.array([0.939258, 1.82325]),
    'gcu_MNR389': np.array([0.881291, 2.24366])
}


gamma_factors = np.array([0.661269, 0.0990846])



res_path = 'MNR_63V.inp_res.m'
output_path = "materials.txt"
group_number = 2


corrected = True


def writematerial(uni, path):
    if(corrected):
        mat_type = "CorrectedNuclearMaterial"
    else:
        mat_type = "NuclearMaterial"
    with open(path, 'a') as out_file:
        out_file.write("[./" + flattened_list[univ_names.index(uni.name)] + "]\n\t" + "block = '" + flattened_list[univ_names.index(uni.name)][4:] + "'\n\t")
        out_file.write("type = " + mat_type + "\n")

        if(corrected):
            out_file.write("\t"  + "sph_factors = " + "'" + str(sph_factors[flattened_list[univ_names.index(uni.name)]])[1:-1] + "'\n "  )
        
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
