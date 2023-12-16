import serpentTools
import numpy as np

univ_names = ["F9plug",  "F8graph",   "F7rifl",   "MNR396", "MNR375", "MNR374", "MNR372", "MNR382", "MNR389",
"E9rifl",   "E8graph",   "MNR394",     "MNRC77", "MNR377", "MNRC76", "MNR395", "MNRC80", "MNR387", 
"D9graph",  "D8graph",   "D7rifl",   "MNR392", "MNR381", "MNR391", "MNR388", "MNR378", "MNR390",  
"C9rifl",   "C8graph",   "MNR379",     "MNR393", "010400", "MNR384", "MNR383", "MNRC74", "MNR361", 
"B9plug",   "B8graph",   "MNR398",     "MNRC79", "MNR385", "MNRC78", "MNR358", "MNR373", "MNR365", 
"A9plug",   "A8graph",   "A7rifl",   "MNR397", "MNR376", "MNR366", "MNR362", "010500", "MNR369" 	
]

gcu_univ_names = ["gcu_F9plug",  "gcu_F8graph",   "gcu_F7rifl",   "gcu_MNR396", "gcu_MNR375", "gcu_MNR374", "gcu_MNR372", "gcu_MNR382", "gcu_MNR389",
"gcu_E9rifl",   "gcu_E8graph",   "gcu_MNR394",     "gcu_MNRC77", "gcu_MNR377", "gcu_MNRC76", "gcu_MNR395", "gcu_MNRC80", "gcu_MNR387", 
"gcu_D9graph",  "gcu_D8graph",   "gcu_D7rifl",   "gcu_MNR392", "gcu_MNR381", "gcu_MNR391", "gcu_MNR388", "gcu_MNR378", "gcu_MNR390",  
"gcu_C9rifl",   "gcu_C8graph",   "gcu_MNR379",     "gcu_MNR393", "gcu_010400", "gcu_MNR384", "gcu_MNR383", "gcu_MNRC74", "gcu_MNR361", 
"gcu_B9plug",   "gcu_B8graph",   "gcu_MNR398",     "gcu_MNRC79", "gcu_MNR385", "gcu_MNRC78", "gcu_MNR358", "gcu_MNR373", "gcu_MNR365", 
"gcu_A9plug",   "gcu_A8graph",   "gcu_A7rifl",   "gcu_MNR397", "gcu_MNR376", "gcu_MNR366", "gcu_MNR362", "gcu_010500", "gcu_MNR369" 	
]



det_path = "MNR_63V_ARO.inp_det0.m"
res_path = 'MNR_63V_ARO.inp_res.m'
output = "userobj.txt"

group_number = 2

d = serpentTools.read(det_path)
r = serpentTools.read(res_path)


# Extraction of detector fluxes and current

fluxes = []
for name in univ_names:
    fluxes.append(((d.__getitem__("flux_" + name)).tallies)[::-1] )

total_flux = np.zeros(group_number)
for flux in fluxes:
    total_flux += flux

net_current = (d.__getitem__("net_current_active")).tallies

total_absorption = d.__getitem__("absorption_check_1").tallies


# Normalization and core dimensions

x_pitch = 8.1
y_pitch = 7.709 
z_pitch = 72.085

module_volume = x_pitch*y_pitch*z_pitch
active_core_volume = 54*module_volume
active_core_surface = 2*x_pitch*y_pitch*54 + 2*x_pitch*z_pitch*9 + 2*y_pitch*z_pitch*6

normalization = module_volume/np.amax(fluxes)

total_flux *= normalization
for flux in fluxes:
    flux*= normalization
net_current*=normalization

total_absorption *= normalization

# k check

corrente_totale = 0
for current in net_current:
    corrente_totale += -current
print(corrente_totale)


flusso_totale = 0
for componente in total_flux:
    flusso_totale += componente

assorbimento_totale = 0
for componente in total_absorption:
    assorbimento_totale += componente

#print(corrente_totale)
#print(flusso_totale)
#print(assorbimento_totale)

universes = []
for name in gcu_univ_names:
    universes.append(r.getUniv(name, 0,0))


nsf = []
abs = []
for universe in universes:
    nsf.append(universe.infExp['infNsf'])
    abs.append(universe.infExp['infAbs'])

assorbimenti_totali = 0
fissioni_totali =0
for i, flux in enumerate(fluxes):
    fissioni_totali += nsf[i].dot( np.flip(flux))
    assorbimenti_totali += abs[i].dot(np.flip(flux))

print(fissioni_totali)
print(assorbimenti_totali)
print(assorbimento_totale)


#print(fissioni_totali)

k = (fissioni_totali)/(corrente_totale + assorbimenti_totali)
print(k)