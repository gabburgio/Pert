// Gmsh project created on Sat May 20 18:19:28 2023
SetFactory("OpenCASCADE");
//+
Rectangle(1) = {0, 0, 0, 30, 30, 0};
//+
Rectangle(2) = {-30, 0, 0, 30, 30, 0};
//+
Rectangle(3) = {-30, -30, 0, 30, 30, 0};
//+
Rectangle(4) = {0, -30, 0, 30, 30, 0};
//+
Physical Surface("control_ul", 17) = {2};
//+
Physical Surface("control_lr", 18) = {4};
//+
Physical Surface("norm_ur", 19) = {1};
//+
Physical Surface("norm_ll", 20) = {3};

BooleanFragments{ Surface{1,2,3,4}; Delete; }{}

//Hide {:}
//Recursive Show { Volume{2}; }
//Mesh.MeshOnlyVisible=1;
//+
//+
Physical Curve("boundary", 21) = {11, 8, 10, 7, 6, 3, 2, 12};
