import numpy as np


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
        out_file.write("Box(" + str(k+1) + ") = { "  )
        for i in range(len(start)-1):
            out_file.write(str(round((cuboids[k])[i], 8))+ ", " )
        out_file.write(str((cuboids[k])[len(start)-1]) + "}; \n")

    '''
    '''