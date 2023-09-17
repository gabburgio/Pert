import serpentTools
import numpy as np

univ_names = ["F9plug_u",  "F8graph_u",   "F7rifl_u",   "MNR396", "MNR375", "MNR374", "MNR372", "MNR382", "MNR389",
"E9rifl_u",   "E8graph_u",   "MNR394",     "MNRC77", "MNR377", "MNRC76", "MNR395", "MNRC80", "MNR387", 
"D9graph_u",  "D8graph_u",   "D7rifl_u",   "MNR392", "MNR381", "MNR391", "MNR388", "MNR378", "MNR390",  
"C9rifl_u",   "C8graph_u",   "MNR379",     "MNR393", "MNR10400", "MNR384", "MNR383", "MNRC74", "MNR361", 
"B9plug_u",   "B8graph_u",   "MNR398",     "MNRC79", "MNR385", "MNRC78", "MNR358", "MNR373", "MNR365", 
"A9plug_u",   "A8graph_u",   "A7rifl_u",   "MNR397", "MNR376", "MNR366", "MNR362", "MNR10500", "MNR369" 	
]


normalization_factors  = np.array([0.944859, 0.976196])
vacuum_integrals  = np.array([2130.88, 1208.64])
albedo_integrals = np.array([645.435, -2.99332])
ref_albedo_integrals = np.array([1148.37570643 , -53.92738101])
gammas = np.divide(ref_albedo_integrals, albedo_integrals)

print(str(np.multiply(gammas, normalization_factors)))

sph_factors = {
    "MNR396": np.array([1.07058, 0.94131]),
    "MNR375": np.array([1.03343, 1.02431]),
    "MNR374": np.array([1.00817, 1.07464]),
    "MNR372": np.array([1.01527, 1.0456]),
    "MNR382": np.array([1.0212, 1.00731]),
    "MNR389": np.array([1.03379, 0.957198]),
    "MNR394": np.array([1.11592, 0.704263]),
    "MNRC77": np.array([0.949543, 1.06259]),
    "MNR377": np.array([1.04304, 1.02051]),
    "MNRC76": np.array([0.923051, 1.32485]),
    "MNR395": np.array([1.05851, 1.13825]),
    "MNRC80": np.array([0.955279, 1.50266]),
    "MNR387": np.array([1.02609, 1.0017]),
    "MNR392": np.array([1.08058, 0.74728]),
    "MNR381": np.array([1.07347, 0.783501]),
    "MNR391": np.array([1.06941, 0.979807]),
    "MNR388": np.array([1.06283, 1.18845]),
    "MNR378": np.array([1.02929, 1.27105]),
    "MNR390": np.array([1.03376, 1.02829]),
    "MNR379": np.array([1.10212, 0.746209]),
    "MNR393": np.array([1.10788, 0.6886]),
    "MNR384": np.array([1.08276, 0.891535]),
    "MNR383": np.array([1.06539, 1.19219]),
    "MNRC74": np.array([0.922442, 1.50607]),
    "MNR361": np.array([1.00555, 1.18148]),
    "MNR398": np.array([1.16559, 0.794821]),
    "MNRC79": np.array([1.03892, 0.926908]),
    "MNR385": np.array([1.16124, 0.706845]),
    "MNRC78": np.array([0.999279, 1.08912]),
    "MNR358": np.array([1.08851, 1.24018]),
    "MNR373": np.array([1.1055, 1.31852]),
    "MNR365": np.array([1.07083, 1.22356]),
    "MNR397": np.array([1.2339, 0.976528]),
    "MNR376": np.array([1.21388, 1.03729]),
    "MNR366": np.array([1.17108, 1.1739]),
    "MNR362": np.array([1.1832, 1.3111]),
    "MNR369": np.array([1.17705, 1.38534]),
}


tilde_factors = sph_factors



#for k,value in tilde_factors.items():
#    value *= normalization_factors

#print(str(tilde_factors["MNR384"]))

res_path = 'MNR_63V.inp_res.m'
output_path = "materials.txt"
group_number = 2


def writematerial(uni, path):
    if(uni.name in fuel_names):
        mat_type = "CorrectedNuclearMaterial"
    else:
        mat_type = "NuclearMaterial"
    with open(path, 'a') as out_file:
        out_file.write("[./" + uni.name + "]\n\t" + "block = '" + uni.name + "'\n\t")
        out_file.write("type = " + mat_type + "\n")

        if(uni.name in fuel_names):
            out_file.write("\t"  + "sph_factors = " + "'" + str(sph_factors[uni.name])[1:-1] + "'\n "  )
            out_file.write("\t"  + "normalization_factors = " + "'" + str((normalization_factors) )[1:-1] + "'\n"  )
        #    out_file.write("\t"  + "sigma_r = " + "'" + str(np.multiply(uni.infExp['infRemxs'], tilde_factors[uni.name]))[1:-1] + "'\n"  )
        #    out_file.write("\tchi = " + "'" + str(uni.infExp['infChit'])[1:-1] + "'\n"  )
        #    #print("written fuel material " + uni.name)
        #else:
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

        #if(uni.name in fuel_names):
        #    scatt_matrix =  scatt_matrix * tilde_factors[uni.name][np.newaxis,:]
        #    #print(sph_factors[uni.name][np.newaxis,:])

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
    #if(universe.name in fuel_names):
    #    write_sphdf_material(universe, output_path)
    #else:
    #    writematerial(universe, output_path)
    writematerial(universe, output_path)
with open(output_path, 'a') as f:
    f.write("[]\n")

