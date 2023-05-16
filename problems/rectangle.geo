// Gmsh project created on Fri May 12 17:21:04 2023
SetFactory("OpenCASCADE");
//+
Rectangle(1) = {-1, -1, 0, 40, 40, 0};
//+
Physical Surface("domain", 5) = {1};
//+
Physical Curve("boundary", 6) = {3, 4, 1, 2};
