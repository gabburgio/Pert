//+
SetFactory("OpenCASCADE");
Box(1) = { 0.0, 0.0, 0.0, 8.1, 7.709, 90.0}; 
Box(2) = { 0.0, 7.709, 0.0, 8.1, 7.709, 90.0}; 
Box(3) = { 0.0, 15.418, 0.0, 8.1, 7.709, 90.0}; 



//+
Physical Volume("primo", 29) = {3};
//+
Physical Volume("secondo", 30) = {2};
//+
Physical Volume("terzo", 31) = {1};
//+
BooleanFragments{ Volume{1,2,3}; Delete; }{}
//+
Physical Surface("boundary", 32) = {7, 12, 1};
