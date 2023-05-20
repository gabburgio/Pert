import numpy as np
import re

resm_path = "/home/gburgio/Desktop/4zone_latt/lattice_res.m"
output_path = "/home/gburgio/Desktop/output.txt"

property_mapping = {
    "ref_diffusivity" : "INF_DIFFCOEF",
    "ref_sigma_r" : "INF_REMXS",
    "ref_nu_sigma_f" : "INF_NSF",
    "chi" : "INF_CHIT",
    "ref_sigma_s" : "INF_SP0"
}

class Material:
    def __init__(self, universe_name="", nsf_vals=None):
        self.universe_name = universe_name
        self.properties = []

materials = []
material_counter = -1
refk = True
Volume = 1
Surface = 1

with open(resm_path, 'r') as resm_file:
    for i, line in enumerate(resm_file):
        if line.startswith("MACRO_NG"):
            number_groups = int(line.split("=")[1].strip().rstrip(';'))
        if line.startswith("GC_UNIVERSE_NAME"):
            materials.append(Material(universe_name = line.split('=')[1].strip().rstrip("'; ").lstrip("'")))
            material_counter += 1    

        for prop_name, prop_key in property_mapping.items():
            if(line.startswith(prop_key)):  
                valori = (line.split('= [')[1].strip().rstrip('];')).split('  ')
                for i in range(len(valori)):
                    valori[i] = valori[i].split(' ')[0]
                valori.insert(0,prop_name)
                materials[material_counter].properties.append(valori)

                
with open(output_path, 'w') as out_file:
    for material in materials:
        out_file.write(f"[./{material.universe_name}]\n")
        out_file.write("\ttype = SPHDFMaterial\n")
        out_file.write(f"\tblock = {material.universe_name}\n")
        for property in material.properties:
            out_file.write(f"\t{property[0]} = '")
            for i in range(int((len(property)-1)/number_groups)):
                out_file.write(' '.join(property[i*number_groups + 1:(i+1)*number_groups + 1]))
                if(property[0]=="ref_sigma_s" and i < (number_groups-1)):
                    out_file.write('; ')
            out_file.write("'\n")
