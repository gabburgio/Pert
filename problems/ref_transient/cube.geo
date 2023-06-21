SetFactory("OpenCASCADE");
//+
Box(1) = {0, 0, 0, 100, 100, 100};

//+

//+
//+
Physical Volume("domain", 13) = {1};
//+
Physical Surface("boundary", 14) = {6, 1, 4, 2, 3, 5};
