import numpy as np


univ_names = ["F9plug_u",  "F8graph_u",   "F7rifl_u",   "MNR396", "MNR375", "MNR374", "MNR372", "MNR382", "MNR389",
"E9rifl_u",   "E8graph_u",   "MNR394",     "MNRC77", "MNR377", "MNRC76", "MNR395", "MNRC80", "MNR387", 
"D9graph_u",  "D8graph_u",   "D7rifl_u",   "MNR392", "MNR381", "MNR391", "MNR388", "MNR378", "MNR390",  
"C9rifl_u",   "C8graph_u",   "MNR379",     "MNR393", "010400", "MNR384", "MNR383", "MNRC74", "MNR361", 
"B9plug_u",   "B8graph_u",   "MNR398",     "MNRC79", "MNR385", "MNRC78", "MNR358", "MNR373", "MNR365", 
"A9plug_u",   "A8graph_u",   "A7rifl_u",   "MNR397", "MNR376", "MNR366", "MNR362", "010500", "MNR369" 	
]


output_path = "MNRgeo.txt"

start = np.array([0, 0, 0, 8.1, 7.709, 90])
xshift = np.array([8.1, 0, 0, 0, 0, 0])
yshift = np.array([0, 7.709, 0, 0, 0, 0])
cuboids = []



                
with open(output_path, 'w') as out_file:
    
    for nx in range(9):
        for ny in range(6):
            cuboids.append(start + nx*xshift + ny*yshift  )
    
    
    for k in range(len(cuboids)):
        out_file.write("surf\t" + univ_names[k] + "\tcuboid\t"  )
        for i in range(len(start)-1):
            out_file.write(str(round((cuboids[k])[i], 8))+ ", " )
        out_file.write(str((cuboids[k])[len(start)-1]) + "}; \n")

    '''
    '''