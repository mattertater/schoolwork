// Matt McDade
// Algorithms Project 3
// Seam carving

#include <iostream>
#include <fstream>
#include <stdlib.h>

int main(int argc, char*argv[]) {
    if (argc < 4) {
        std::cout << "Incorrect format: should be \"a.exe [image.pgm] [vertical seams] [horizontal seams]\"" << std::endl;
    }
    else {
        std::string imageFilename = argv[1];
        std::string vertical = argv[2];
        std::string horizontal = argv[3];

        std::ifstream file;
        file.open(imageFilename.c_str());
        if (file.is_open()) {
            std::cout << "file opened, printing out contents" << std::endl;
            std::string chunk;
            while (file >> chunk)
                std::cout << chunk << std::endl;
        }
    }
}