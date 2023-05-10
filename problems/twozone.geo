// Gmsh project created on Wed May  3 17:18:01 2023
SetFactory("OpenCASCADE");
//+
Rectangle(1) = {-1, 0, 0, 1, 0.5, 0};
//+
Rectangle(2) = {-1, 0.5, 0, 1, 0.5, 0};

BooleanFragments{ Surface{1,2}; Delete;}{}
//+
Physical Surface("sopra", 8) = {2};

Physical Surface("sotto", 10) = {1};
//+
Physical Curve("boundary", 9) = {7, 4, 1, 2, 5, 6};
