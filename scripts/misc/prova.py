det_path = "/home/gburgio/Desktop/Base_det0.m"

with open (det_path, 'r') as det_file:
    for i, line in enumerate(det_file):
        if( i == 0):
            print(line[i+2])
