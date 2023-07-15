import numpy as np

tot_flux = np.array([2.35648E+15,8.79178E+14])
norm_flux = np.array([1.53593E+15,5.49117E+14])
control_flux = np.array([8.20548E+14,3.30061E+14])
current = np.array([1.51376E+13, 1.05699E+12])

Vtot = 3600
Vnorm = 1800
Vcontrol = 1800

constant = Vtot/tot_flux[0]

tot_flux*= constant
norm_flux*= constant
control_flux*= constant
current *= constant

norm_flux_loc = norm_flux/Vnorm
control_flux_loc = control_flux/Vcontrol


print(f"total flux = {tot_flux}")
print(f"external flux = {control_flux}")
print(f"internal flux = {norm_flux}")
print(f"pointwise internal flux = {norm_flux_loc}")
print(f"pointwise external flux = {control_flux_loc}")
print(f"current = {current}")
