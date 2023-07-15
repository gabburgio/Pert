import numpy as np

def writealbedo(res_path, path, group_number):
    ALB_IN_CURR = []
    ALB_OUT_CURR = []
    ALB_TOT_ALB = []
    lines = []
    surface_number = 5
    
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
    ALB_TOT_ALB = list(map(float, ALB_TOT_ALB))

    denom = np.zeros(group_number)
    numer = np.zeros(group_number*group_number)
    totalb = np.zeros(group_number)
    check = []


    #check that surface 6 is the top (nothing comes back from it)
    '''
    for j in range(6):
        check.append(sum(ALB_OUT_CURR[24*j:24*(j+1)]))
    print(check)'''

    #check that caclulated albedo for the total surface corresponds to the one given by serpent by switching to 6
    #surface_number = 6
    

    for i in range(group_number*surface_number):
        if (i%2 == 0):
            denom[0] += ALB_IN_CURR[i]
        if (i%2 == 1):
            denom[1] += ALB_IN_CURR[i]

    for i in range(group_number**2 * 6**2):
        if(i%group_number==0):
            if((i//(group_number*6))%group_number == 0):
                numer[0]+= ALB_OUT_CURR[i]
            if((i//(group_number*6))%group_number == 1):
                numer[1]+= ALB_OUT_CURR[i]
        if(i%group_number==1):
            if((i//(group_number*6))%group_number == 0):
                numer[2]+= ALB_OUT_CURR[i]
            if((i//(group_number*6))%group_number == 1):
                numer[3]+= ALB_OUT_CURR[i]
                
    for i in range(len(ALB_TOT_ALB)):
        numer[i] = numer[i]/denom[i%2]
    print(ALB_TOT_ALB)
    print(numer)

    with open(path, 'a') as p:
        p.write("\n[BCs]\n" + "[./albedo]\n" + "\ttype = ArrayAlbedoBC \n" )