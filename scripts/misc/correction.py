import numpy as np

ref_control = np.array([1253.55, 504.234])
ref_norm = np.array([2346.4, 838.887])
ref_tot = np.array([3600, 1343.122])
ref_current = np.array([23.12, 1.614])

control = np.array([1.479247e+03, 5.256767e+02])
norm = np.array([2.118850e+03, 8.167314e+02])
tot = np.array([3.598097e+03, 1.342408e+03])
current = np.array([6.384802e+01, 1.593543e+01])

eta = tot/ref_tot

mu_control = ref_control/control
mu_norm = ref_norm/norm

'''
nu_sigma_f = np.array([-1.43370E-02, -3.32368E-02])
diffusivity = np.array([1.39517E+00, 1.56417E-01])
sigma_t = np.array([2.74755E-02, 4.04116E-02])
sigma_s = np.array([-1.62221E-02, -1.41390E-04])

print(nu_sigma_f*mu_norm*eta)
print(diffusivity*mu_norm*eta)
print(sigma_t*mu_norm*eta)
print(sigma_s*mu_norm*eta)
'''
nu_sigma_f = np.array([-1.66881E-02, -5.03533E-02])
diffusivity = np.array([1.59260E+00, 1.58740E-01])
sigma_t = np.array([2.53214E-02, 4.27537E-02])
sigma_s = np.array([-1.59909E-02, -1.55568E-04])

print((2*ref_current)/current)