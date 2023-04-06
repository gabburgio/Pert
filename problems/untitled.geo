//+
SetFactory("OpenCASCADE");
Rectangle(1) = {-0.5, -0, 0, 1, 0.5, 0};
//+
Physical Surface("domain", 5) = {1};
//+
Physical Curve("boundary", 6) = {4, 3, 2, 1};
