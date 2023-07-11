import serpentTools

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
#ref = "ref_"
group_number = 2


def writematerial(uni, path):
    with open(path, 'a') as out_file:
        out_file.write("[./" + uni.name + "]\n\t" + "block = '" + uni.name + "'\n\t")
        out_file.write("type = " + mat_type + "\n")

        out_file.write("\t" + ref + "nu_sigma_f = " + "'" + str(uni.infExp['infNsf'])[1:-1] + "'\n"  )
        out_file.write("\t" + ref + "diffusivity = " + "'" + str(uni.infExp['infDiffcoef'])[1:-1] + "'\n"  )
        out_file.write("\t" + ref + "sigma_r = " + "'" + str(uni.infExp['infRemxs'])[1:-1] + "'\n"  )
        out_file.write("\tchi = " + "'" + str(uni.infExp['infChit'])[1:-1] + "'\n"  )

        rows = []
        for i in range (group_number):
            row = []
            for j in range(group_number):
                row.append(str(uni.infExp['infSp0'])[1:-1].split(' ')[i+ group_number*j])
            rows.append(" ".join(row))
        out_file.write("\t" + ref + "sigma_s = " + "'" + "; ".join(rows) + "'\n"  )
        out_file.write("[]\n")


def writealbedo(res_path, path):
    ALB_PART_ALB = []
    lines = []
    
    with open(res_path, 'r') as r:
        lines = r.readlines()

    for i,line in enumerate(lines):
        if line.startswith("ALB_PART_ALB"):
            ALB_PART_ALB = line.split("=")[1]
            print(0)

    with open(path, 'a') as p:
        p.write("\n[BCs]\n" + "[./albedo]\n" + "\ttype = ArrayAlbedoBC \n" )
        p.write(ALB_PART_ALB + "\n")

'''    ALB_OUT_CURR =
    ALB_TOT_ALB  =
    ALB_PART_ALB =
'''


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
writealbedo(res_path, output_path)