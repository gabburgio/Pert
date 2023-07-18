import numpy as np


def writealbedo(res_path, path, group_number):
    ALB_IN_CURR = []
    ALB_OUT_CURR = []
    ALB_TOT_ALB = []
    lines = []
    surface_number = 6
    
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

    ALB_IN_CURR = list(map(float, ALB_IN_CURR))
    ALB_OUT_CURR = list(map(float, ALB_OUT_CURR))
    ALB_TOT_ALB = list(map(float, ALB_TOT_ALB))

    shape = (surface_number, group_number, surface_number, group_number)

    tensor_aoc = np.empty(shape)

    for i in range(len(ALB_OUT_CURR)):
        tensor_aoc[np.unravel_index(i, shape)] = ALB_OUT_CURR[i]
    
    print(tensor_aoc)

    with open(path, 'a') as p:
        p.write("\n[BCs]\n" + "[./albedo]\n" + "\ttype = ArrayAlbedoBC \n" )


res_path = 'MNR_63V.inp_res.m'
output_path = "mnr_sphdf.i"

writealbedo(res_path, output_path, 2)