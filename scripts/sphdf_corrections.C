#include<stdio.h>
#include <iostream>
#include <Eigen/Dense>
using Eigen::MatrixXd;
using Eigen::VectorXd;

int main(void)
{


 VectorXd chi(4);
 chi<< 7.61834E-01, 2.37991E-01, 1.74836E-04, 0.00000E+00;
 VectorXd nsf(4);
 nsf<< -7.78186E-03, -8.08563E-03, -4.42492E-02, -4.77073E-02; 
std::cout << chi*(nsf.transpose())  << std::endl;


 return 0;
}
