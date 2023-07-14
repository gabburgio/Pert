import serpentTools
import numpy as np

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
    ALB_IN_CURR = []
    ALB_OUT_CURR = []
    ALB_TOT_ALB = []
    lines = []
    
    with open(res_path, 'r') as r:
        lines = r.readlines()

    #isolate actual entries

    for i,line in enumerate(lines):
        if line.startswith("ALB_IN_CURR"):
            intermediate = ((line.split("=")[1]).split("  ")[1:])
            for string in intermediate: 
                ALB_IN_CURR.append(string.split(" ")[0])
            intermediate = ((lines[i+1].split("=")[1]).split("  ")[1:])    
            for string in intermediate: 
                ALB_OUT_CURR.append(string.split(" ")[0])
            intermediate = ((lines[i+2].split("=")[1]).split("  ")[1:])
            for string in intermediate: 
                ALB_TOT_ALB.append(string.split(" ")[0])


    #compute albedo matrix for NT surface

    ALB_IN_CURR = list(map(float, ALB_IN_CURR))
    ALB_OUT_CURR = list(map(float, ALB_OUT_CURR))
    ALB_TOT_CURR = list(map(float, ALB_TOT_CURR))

    denom = np.zeros(group_number)
    numer = np.zeros(group_number*group_number)
    totalb = np.zeros(group_number)
    check = []


    #check that surface 6 is the top (nothing comes back from it)
    for j in range(6):
        check.append(sum(ALB_OUT_CURR[24*j:24*(j+1)]))
    #print(check)

    for i in range(group_number):
        denom[i] = sum(ALB_IN_CURR[6*i:6*(i+1)])
        totalb[i] = sum(ALB_TOT_ALB[6*i:6*(i+1)])

    
    for i in range(group_number*group_number*36):
        if(i%group_number==0):
            if(i%(group_number*6) == 0):
                numer[0]+= ALB_OUT_CURR[i]
            if(i%(group_number*6) == 1):
                numer[1]+= ALB_OUT_CURR[i]
        if(i%group_number==1):
            if(i%(group_number*6) == 0):
                numer[2]+= ALB_OUT_CURR[i]
            if(i%(group_number*6) == 1):
                numer[3]+= ALB_OUT_CURR[i]



    with open(path, 'a') as p:
        p.write("\n[BCs]\n" + "[./albedo]\n" + "\ttype = ArrayAlbedoBC \n" )


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

