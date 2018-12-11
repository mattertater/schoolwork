Matt McDade
Algorithms Project 3 README

My program can be given either the .pgm file specified in the project requirements, or a similar .ppm file format, which is a colored image.

The program sees what operations to perform based on the p_value at the top, which tells the program what kind of file (pgm or ppm) it's dealing with. 

RUNNING THE COMPILED PROGRAM
"a.exe [file (ASCII pgm or ppm)] [vertical seams] [horizontal seams]"
EX- "a.exe snail.ppm 30 50"

The program outputs a file with the same name of the input file with "_processed". It keeps the same file extension. So if you give it a .ppm, it will export a .ppm. 
EX- 	input: "myImage.ppm"
	output: "myImage_processed.ppm"

The output will always be smaller than the input. I did not do the bonus where it adds seams to the images, so it only ever removes data and makes the image smaller.

The p_type header data is transferred directly over to the output without being changed.
A comment is added to the output as well stating how many vertical and horizontal seams were removed, and from what file. 
The new width and height are inserted, as well as the same max value from the input file.

To make the program work with colored .ppm files, I created a "Pixel" object that held R, G, and B values instead of just one grayscale value. I overloaded the necessary functions to allow the program to pass the 2D vector of these Pixels along the same path it would pass the 2D vector of ints. The energy matrix calculations for these ppm implementation took the sum of the differences of the R, G, and B values between on cell and its neighbors. This can be seen in the calculateEnergyMatrix function that takes the 2D vector of Pixels. 

Beyond the calculation of this energy matrix, no other data functions had to be overloaded, since the energy matrix output of both the greyscale and colored variants is the same data type.

All functions that could pass by reference, did. This is because with larger input files, very large 2D vectors are made. Instead of making a copy of these for each function run, I passed them by reference so the changes were made directly to the one 2D vector. This saved a lot of memory and a ton of time when the program runs for larger input files.

I've included screenshots of my program producing correct outputs. In all the twoBalls examples, the left-most image is the original twoBalls.pgm, the middle image is the provided reference correct solution, and the one on the right is what my program produced when called with the same dimension arguments. You can see a slight discrepency in the file size between the provided solution and my own, and I think that difference comes from the comments at the top, and maybe newline characters. 

I've also included examples of my program working with colored ppm files. I selected some images from my recent Alaska trip (converted to ppm using Irfanview), as well as one "blackbuck" ppm example I found online. The seams cut from them are represented in the file name, but you can also verify this by looking at the bottom left of each image within the screenshot, where the dimensions of the image can be seen. 

If you want me to include the raw ppm or pgm files for any of these screenshot examples, please let me know. 