import serpentTools
import numpy as np

univ_names = ["F9plug",  "F8graph",   "F7rifl",   "MNR396", "MNR375", "MNR374", "MNR372", "MNR382", "MNR389",
"E9rifl",   "E8graph",   "MNR394",     "MNRC77", "MNR377", "MNRC76", "MNR395", "MNRC80", "MNR387", 
"D9graph",  "D8graph",   "D7rifl",   "MNR392", "MNR381", "MNR391", "MNR388", "MNR378", "MNR390",  
"C9rifl",   "C8graph",   "MNR379",     "MNR393", "010400", "MNR384", "MNR383", "MNRC74", "MNR361", 
"B9plug",   "B8graph",   "MNR398",     "MNRC79", "MNR385", "MNRC78", "MNR358", "MNR373", "MNR365", 
"A9plug",   "A8graph",   "A7rifl",   "MNR397", "MNR376", "MNR366", "MNR362", "010500", "MNR369" 	
]

det_path = "MNR_63V_ARO_4g.inp_det0.m"
res_path = 'MNR_63V_ARO_4g.inp_res.m'
output = "userobj.txt"

group_number = 4

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



with open(output, 'w') as out:

    # user object writing

    out.write("[UserObjects]\n")
    for i, flux in enumerate(fluxes):
        out.write("[./uo_gcu_" + univ_names[i] + "]\n")
        out.write("\ttype = SPHFactorsUserObject\n")
        out.write("\tvar_size = " + str(group_number) + "\n")
        out.write("\tvariable = flux \n")
        out.write("\tref_fluxes = '" + str(flux).strip("[]") + "'\n")
        out.write("\tblock  = " + univ_names[i]   + " \n")
        out.write("\texecute_on = 'LINEAR' \n[]\n")
    out.write("[./total]\n")
    out.write("\ttype = NormalizationFactorsUserObject\n")
    out.write("\tSPH_user_objects = '")
    for universe in univ_names:
        out.write("uo_gcu_" + universe + " ")
    out.write("'\n\tref_integrals = '" + str(total_flux)[1:-1])
    out.write("'\n\texecute_on = 'LINEAR' \n[]\n[]\n\n\n")

    # IC writing
    local_normalization = 1/module_volume
    out.write("[ICs]\n")
    for i, flux in enumerate(fluxes):
        out.write("[./IC_gcu_" + univ_names[i] + "]\n")
        out.write("\ttype = ArrayConstantIC\n")
        out.write("\tvariable = flux \n")
        out.write("\tvalue = '" + str(flux*local_normalization).strip("[]") + "'\n")
        out.write("\tblock  = " + univ_names[i]   + " \n[]\n")
    out.write("[]\n\n\n")

    # BC writing
    net_current_reversed = -net_current[::-1]
    out.write("[BCs]\n")
    out.write("[./albedo]\n\tvariable = flux\n")
    out.write("\ttype = UoL2ArrayAlbedoBC\n")
    out.write("\tsurface_integrators = 'alb_0 alb_1'\n")
    out.write("\tboundary = 'north south west east bottom top'\n")
    out.write("\tnormalization_factors_uo = total\n")
    out.write("\talbedo_matrix = \n")
    out.write("\tref_current_integral = " + str(net_current_reversed)[1:-1] + " \n")
    out.write("[]\n")



