// Gmsh project created on Fri May 12 12:47:05 2023
SetFactory("OpenCASCADE");
//+
Cylinder(1) = {-0, -0.1, 0, 0, 0, 100, 32, 2*Pi};
//+
Physical Surface("boundary", 4) = {2, 1, 3};
//+
Surface Loop(2) = {3, 1, 2};
//+
Physical Volume("domain", 5) = {1};
