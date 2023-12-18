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

    #check the difference with including the upper surface

    shape = (surface_number, group_number, surface_number, group_number)
    surface_list = [0,1,2,3,4, 5]
    tensor_aoc = np.empty(shape)
    incoming_currents = np.zeros((group_number,group_number))
    outgoing_currents = np.zeros(group_number)
    albedos = np.zeros((group_number,group_number))


    incurr_shape = (surface_number, group_number)
    for j in range(len(ALB_IN_CURR)):
        index = np.unravel_index(j, incurr_shape)
        for l in range(group_number):
            if(index[1] == l and (index[0] in surface_list)):
                outgoing_currents[l] += ALB_IN_CURR[j]

    for i in range(len(ALB_OUT_CURR)):
        tensor_index = np.unravel_index(i, shape) 
        tensor_aoc[tensor_index] = ALB_OUT_CURR[i]
        for j in range(group_number):
            for k in range(group_number):
                if(tensor_index[1]==j and tensor_index[3]==k and (tensor_index[0] in surface_list) and (tensor_index[2] in surface_list)):
                    incoming_currents[j][k] += tensor_aoc[tensor_index]
            
                albedos[j][k] = incoming_currents[j][k]/outgoing_currents[j]
    
    overall_incoming = np.zeros(group_number)

    for i in range(group_number):
        for j in range(group_number):
            overall_incoming[i] += incoming_currents[j][i]
    
    print("incoming = " + str(incoming_currents))
    print("outgoing = " + str(outgoing_currents))
    print("overall incoming = " + str(overall_incoming))
    print("total current balance = " + str(outgoing_currents - overall_incoming))
    print("calculated albedo matrix = " + str(albedos))



    """with open(path, 'a') as p:
        p.write("\n[BCs]\n" + "[./albedo]\n" + "\ttype = ArrayAlbedoBC \n" )"""


res_path = 'MNR_63V_ARM_4g.inp_res.m'
output_path = "mnr_sphdf.i"

writealbedo(res_path, output_path, 4)