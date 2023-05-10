// Gmsh project created on Sun May  7 11:46:00 2023
SetFactory("OpenCASCADE");
//+
Sphere(1) = {-0.1, -0.1, 0, 8.7407, -Pi/2, Pi/2, 2*Pi};
//+
Physical Surface("boundary", 4) = {1};
//+
Physical Volume("domain", 5) = {1};
