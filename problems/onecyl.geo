// Gmsh project created on Thu May  4 18:26:09 2023
SetFactory("OpenCASCADE");
//+
Cylinder(1) = {-0, 0, 0, 0, 0, 100, 11, 2*Pi};
//+
Physical Surface("boundary", 4) = {2, 1, 3};
//+
Physical Volume("domain", 5) = {1};
