import numpy as np

sph_control = np.array([0.847424, 0.959209])
sph_normal = np.array([1.10739, 1.02713])



nu_sigma_f = np.array([-1.43370E-02, -3.32368E-02])
diffusivity = np.array([1.39517E+00, 1.56417E-01])
sigma_t = np.array([2.74755E-02, 4.04116E-02])
sigma_s = np.array([-1.62221E-02, -1.41390E-04])

'''
print(nu_sigma_f*mu_norm*eta)
print(diffusivity*mu_norm*eta)
print(sigma_t*mu_norm*eta)
print(sigma_s*mu_norm*eta)

nu_sigma_f = np.array([-1.66881E-02, -5.03533E-02])
diffusivity = np.array([1.59260E+00, 1.58740E-01])
sigma_t = np.array([2.53214E-02, 4.27537E-02])
sigma_s = np.array([-1.59909E-02, -1.55568E-04])
'''

#print(np.dot(nu_sigma_f,sph_normal))

sph = sph_control

print("nu_sigma_f =" + str(np.multiply(-nu_sigma_f, sph )) )
print("diffusivity =" + str(np.multiply(diffusivity, sph )) )
print("sigma_r =" + str(np.multiply(sigma_t, sph )) )
print("sigma_s =" + str(np.multiply(-sigma_s, sph )) )


#print((2*ref_current)/current)