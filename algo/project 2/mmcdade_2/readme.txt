Matt McDade 2849637
Algorithms Project 2 README

RUNNING THE COMPILED PROGRAM
"a.exe [algType] [dataFile]"
EX- "a.exe G myPoints.txt"

The program outputs a file called hull_[algType].txt containing a list of all points on the hull. 

This program is run the same way the project 2 description describes. It's only source file is convexHull435.cc. This file contains all 3 algorithms, Graham scan, Jarvis's March, and Quickhull. From my testing, all three work on every dataset created using the provided ConvexHull_GUI.java. 

This code is adapted from programs found on geeksforgeeks.com, whose specific links can be found in the source code. 

The main function at the bottom is responsible for creating the vectors of points from the input file, and then running the correct function based on the algType specified. 

One thing about my implementation is that I did a good amount of data-massaging to get the Quickhull hull points into an order that the included java program drew them nicely. Before massaging, all the points are correct, but they in an order that does not look nice when drawing them. Because of this massaging, my Quickhull implementation takes longer on datasets that have many points on the hull, like onCircle. This can bee seen in the times specified on the report. 

Thanks!