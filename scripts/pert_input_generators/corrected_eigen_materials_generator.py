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
    'gcu_A9plug': np.array([0.921599, 0.53383]),
    'gcu_B9plug': np.array([0.680754, 0.523048]),
    'gcu_C9rifl': np.array([0.735992, 0.50139]),
    'gcu_D9graph': np.array([0.769478, 0.488001]),
    'gcu_E9rifl': np.array([0.756566, 0.48918]),
    'gcu_F9plug': np.array([0.742396, 0.485726]),
    'gcu_A8graph': np.array([0.814319, 0.663918]),
    'gcu_B8graph': np.array([0.818226, 0.660929]),
    'gcu_C8graph': np.array([0.823577, 0.629425]),
    'gcu_D8graph': np.array([0.810517, 0.63285]),
    'gcu_E8graph': np.array([0.816094, 0.604105]),
    'gcu_F8graph': np.array([0.779796, 0.609715]),
    'gcu_A7rifl': np.array([0.778012, 0.869473]),
    'gcu_MNR398': np.array([1.0368, 0.574882]),
    'gcu_MNR379': np.array([1.0287, 0.582947]),
    'gcu_D7rifl': np.array([0.850348, 0.795691]),
    'gcu_MNR394': np.array([1.01927, 0.522102]),
    'gcu_F7rifl': np.array([0.750684, 0.811861]),
    'gcu_MNR397': np.array([1.00045, 0.957473]),
    'gcu_MNRC79': np.array([0.99129, 1.01853]),
    'gcu_MNR393': np.array([1.11075, 0.728871]),
    'gcu_MNR392': np.array([1.09336, 0.723513]),
    'gcu_MNRC77': np.array([0.944019, 1.02645]),
    'gcu_MNR396': np.array([0.966511, 0.867521]),
    'gcu_MNR376': np.array([1.00927, 1.28546]),
    'gcu_MNR385': np.array([1.11767, 0.874191]),
    'gcu_010400': np.array([0.86941, 1.46976]),
    'gcu_MNR381': np.array([1.12935, 0.87679]),
    'gcu_MNR377': np.array([1.07854, 0.972575]),
    'gcu_MNR375': np.array([0.975792, 1.16661]),
    'gcu_MNR366': np.array([0.976031, 1.46457]),
    'gcu_MNRC78': np.array([0.990337, 1.40213]),
    'gcu_MNR384': np.array([1.14132, 1.01583]),
    'gcu_MNR391': np.array([1.15515, 1.01793]),
    'gcu_MNRC76': np.array([0.98003, 1.50999]),
    'gcu_MNR374': np.array([0.960888, 1.38235]),
    'gcu_MNR362': np.array([0.969221, 1.44484]),
    'gcu_MNR358': np.array([1.05817, 1.24598]),
    'gcu_MNR383': np.array([1.11891, 1.17189]),
    'gcu_MNR388': np.array([1.13445, 1.18783]),
    'gcu_MNR395': np.array([1.09977, 1.24021]),
    'gcu_MNR372': np.array([0.958472, 1.55764]),
    'gcu_010500': np.array([0.856595, 1.87325]),
    'gcu_MNR373': np.array([1.03283, 1.39912]),
    'gcu_MNRC74': np.array([0.937489, 1.77776]),
    'gcu_MNR378': np.array([1.05468, 1.44948]),
    'gcu_MNRC80': np.array([0.943897, 1.96762]),
    'gcu_MNR382': np.array([0.93517, 1.89303]),
    'gcu_MNR369': np.array([0.874338, 1.67841]),
    'gcu_MNR365': np.array([0.917301, 1.57026]),
    'gcu_MNR361': np.array([0.920748, 1.58394]),
    'gcu_MNR390': np.array([0.965399, 1.58563]),
    'gcu_MNR387': np.array([0.93664, 1.8529]),
    'gcu_MNR389': np.array([0.880328, 2.29083]),
}





res_path = '/home/gburgio/projects/pert/scripts/pert_input_generators/storage_serpent/2g_ARO_mid/MNR_63V_ARO.inp_res.m'
output_path = "corrected_eigen_materials.txt"
group_number = 2



def writematerial(uni, path, type):
    match type:
        case "corrected":
            mat_type = "CorrectedNuclearMaterial"
        case "uncorrected":
            mat_type = "NuclearMaterial"
        case "transient":
            mat_type = "TransientNuclearMaterial"

    with open(path, 'a') as out_file:


        out_file.write("[./" + uni.name + "]\n\t" + "block = '" + uni.name[4:] + "'\n\t")
        out_file.write("type = " + mat_type + "\n")

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

        match type:
            case "corrected":
                out_file.write("\t"  + "sph_factors = " + "'" + str(sph_factors[uni.name])[1:-1] + "'\n "  )
            case "transient":
                out_file.write("\n\t"  + "sph_factors = " + "'" + str(sph_factors[uni.name])[1:-1] + "'\n "  )
                out_file.write("\t" + "inverse_v = '" +  str(uni.infExp['infInvv'])[1:-1] + "'\n")
                out_file.write("\t" + "decay_constants = '" +  str(uni.gc['lambda'])[1:-1] + "'\n")
                out_file.write("\t" + "delayed_spectrum = '" +  str(uni.infExp['infChid'])[1:-1] + "'\n")
                out_file.write("\t" + "delayed_fraction = '" +  str(uni.gc['betaEff'][1:])[1:-1] + "'")


        out_file.write("\n[]\n")



r = serpentTools.read(res_path)


universes = []
for name in univ_names:
    #for key in r.getUniv(name, 0,0).gc:
    #    print(key)
    universes.append(r.getUniv(name, 0,0))


material_type = "transient"

with open(output_path, 'w') as f:
    f.write("[Materials]\n")
for universe in universes:
    writematerial(universe, output_path, material_type)
with open(output_path, 'a') as f:
    f.write("[]\n")

