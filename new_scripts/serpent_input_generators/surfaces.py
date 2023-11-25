import numpy as np


univ_names = ["F9plug",  "F8graph",   "F7rifl",   "MNR396", "MNR375", "MNR374", "MNR372", "MNR382", "MNR389",
"E9rifl",   "E8graph",   "MNR394",     "MNRC77", "MNR377", "MNRC76", "MNR395", "MNRC80", "MNR387", 
"D9graph",  "D8graph",   "D7rifl",   "MNR392", "MNR381", "MNR391", "MNR388", "MNR378", "MNR390",  
"C9rifl",   "C8graph",   "MNR379",     "MNR393", "010400", "MNR384", "MNR383", "MNRC74", "MNR361", 
"B9plug",   "B8graph",   "MNR398",     "MNRC79", "MNR385", "MNRC78", "MNR358", "MNR373", "MNR365", 
"A9plug",   "A8graph",   "A7rifl",   "MNR397", "MNR376", "MNR366", "MNR362", "010500", "MNR369" 	
]


output_path = "MNR_gcu_input.txt"

start = np.array([-36.45, -28.35, 19.2725, 26.9815, -35.7300, 36.3550])
xshift = np.array([8.1, 8.1, 0, 0, 0, 0])
yshift = np.array([0, 0, -7.709, -7.709, 0, 0])
cuboids = []


                
with open(output_path, 'w') as out_file:
    
    for nx in range(9):
        for ny in range(6):
            cuboids.append(start + nx*xshift + ny*yshift  )
    
    
    # define surfaces

    for k in range(len(cuboids)):
        out_file.write("surf\timposed_" + univ_names[k] + "\tcuboid\t"  )
        for i in range(len(start)-1):
            out_file.write(str(round((cuboids[k])[i], 8))+ " " )
        out_file.write(str((cuboids[k])[len(start)-1]) + " \n")


    out_file.write("\n\n")

    # define cells

    for k in range(len(cuboids)):
        out_file.write("cell gcc_" + univ_names[k] + " gcu_" + univ_names[k] + " void -imposed_" + univ_names[k] + "\n" )
    
    # write gcu command for all lattice entries

    out_file.write("\nset gcu ")
    for k in range(len(cuboids)):
        out_file.write(" gcu_" + univ_names[k] + " ")
    out_file.write("\n\n")

    # define flux detectors for all lattice entries

    for k in range(len(cuboids)):
        out_file.write("det flux_" + univ_names[k] + " de decgrid du gcu_" + univ_names[k] + "\n" )

