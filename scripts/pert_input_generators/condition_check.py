import serpentTools
import numpy as np

univ_names = ["gcu_F9plug",  "gcu_F8graph",   "gcu_F7rifl",   "gcu_MNR396", "gcu_MNR375", "gcu_MNR374", "gcu_MNR372", "gcu_MNR382", "gcu_MNR389",
"gcu_E9rifl",   "gcu_E8graph",   "gcu_MNR394",     "gcu_MNRC77", "gcu_MNR377", "gcu_MNRC76", "gcu_MNR395", "gcu_MNRC80", "gcu_MNR387", 
"gcu_D9graph",  "gcu_D8graph",   "gcu_D7rifl",   "gcu_MNR392", "gcu_MNR381", "gcu_MNR391", "gcu_MNR388", "gcu_MNR378", "gcu_MNR390",  
"gcu_C9rifl",   "gcu_C8graph",   "gcu_MNR379",     "gcu_MNR393", "gcu_010400", "gcu_MNR384", "gcu_MNR383", "gcu_MNRC74", "gcu_MNR361", 
"gcu_B9plug",   "gcu_B8graph",   "gcu_MNR398",     "gcu_MNRC79", "gcu_MNR385", "gcu_MNRC78", "gcu_MNR358", "gcu_MNR373", "gcu_MNR365", 
"gcu_A9plug",   "gcu_A8graph",   "gcu_A7rifl",   "gcu_MNR397", "gcu_MNR376", "gcu_MNR366", "gcu_MNR362", "gcu_010500", "gcu_MNR369" 	
]


group_number = 8
det_path = "storage_serpent/8g_ARO/MNR_63V_ARO_8g.inp_det0.m"
res_path = 'storage_serpent/8g_ARO/MNR_63V_ARO_8g.inp_res.m'

#det_path = "storage_serpent/2g_ARO_mid/MNR_63V_ARO.inp_det0.m"
#res_path = 'storage_serpent/2g_ARO_mid/MNR_63V_ARO.inp_res.m'

#det_path = "storage_serpent/4g_ARM/MNR_63V_ARM_4g.inp_det0.m"
#res_path = 'storage_serpent/4g_ARM/MNR_63V_ARM_4g.inp_res.m'


r = serpentTools.read(res_path)
d = serpentTools.read(det_path)


universes = []
for name in univ_names:
    universes.append(r.getUniv(name, 0,0))

#Print the keys of the available group constants
print(universes[0].infExp.keys())

#Calculate absorption and scattering multiplication rates

total_absorption = np.zeros(group_number)
total_multiplication = np.zeros(group_number)
total_fission_production = np.zeros(group_number)

for universe in universes:     
    uni_flx = universe.infExp['infFlx']

    #absorption
    uni_abs =  universe.infExp['infAbs']
    total_absorption += np.multiply(uni_flx, uni_abs)

    #fission
    uni_nsf =  universe.infExp['infNsf']
    uni_chi =  universe.infExp['infChit']
    uni_chinsf = np.outer(uni_chi,uni_nsf)
    total_fission_production += uni_chinsf.dot(uni_flx)
    
    #multiplication
    scatt_shape = (group_number, group_number)    
    scatt_mult_matrix = np.zeros(scatt_shape)
    scatt_matrix = np.zeros(scatt_shape)
    
    for j in range(len(universe.infExp['infSp0'])):
        index = np.unravel_index(j, scatt_shape)
        scatt_mult_matrix[index] = universe.infExp['infSp0'][j]
        scatt_matrix[index] = universe.infExp['infS0'][j]
    
    scatt_mult_matrix = np.transpose(scatt_mult_matrix)
    scatt_matrix = np.transpose(scatt_matrix)
    net_matrix = scatt_mult_matrix -scatt_matrix
    total_multiplication += net_matrix.dot(uni_flx)


    #print("fission = "+ str(total_fission_production))
    #print("absorption = "+ str(total_absorption))
    #print("multiplication = "+ str(total_multiplication))



net_current = (d.__getitem__("net_current_active")).tallies


og_absorption = 0
og_multiplication = 0
og_net_current = 0
og_fission_production = 0

for g in range(group_number):
    og_absorption += total_absorption[g]
    og_multiplication += total_multiplication[g] 
    og_net_current += net_current[g]
    og_fission_production += total_fission_production[g] 


#Print implicit Keff:

k = (og_fission_production)/(og_absorption - og_net_current - og_multiplication)
print("KEFF = " + str(k))

#Check normalization factors condition:
#print("total absorption - total summed multiplication - net current = " + str(total_absorption - total_multiplication - np.flip(net_current)))









