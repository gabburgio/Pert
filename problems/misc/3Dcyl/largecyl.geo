// Gmsh project created on Fri May 12 12:47:05 2023
SetFactory("OpenCASCADE");
//+

//+
Cylinder(1) = {0, 0, 0, 0, 0, 100, 10, 2*Pi};

Cylinder(2) = {0, 0, 0, 0, 0, 100, 32, 2*Pi};

Physical Surface("boundary", 9) = {4, 2, 5, 3, 6};

Physical Volume("internal_u", 11) = {1};

Physical Volume("external_u", 10) = {2};

BooleanFragments{ Volume{1,2}; Delete; }{}

//+

//Hide {:}
//Recursive Show { Volume{2}; }
//Mesh.MeshOnlyVisible=1;
//+
