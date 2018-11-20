// Matt McDade
// Algorithms Project 3
// Seam carving

#include <iostream>
#include <fstream>
#include <stdlib.h>
#include <limits>
#include <sstream>
#include <vector>
#include <utility>
#include <algorithm>
#include <ctime>
#include <bits/stdc++.h>

std::vector<std::vector<int> > createVector(int width, int height) {
    std::vector<std::vector<int> > a;
    a.resize(height);
    for (int i = 0; i < height; i++) {
        a[i].resize(width);
    } 
    return a;
}

std::vector<std::vector<int> > transpose(std::vector<std::vector<int> > &matrix) {
    int width = matrix[0].size();
    int height = matrix.size();
    std::vector<std::vector<int> > transposedMatrix = createVector(height, width);
    for (int i = 0; i < height; i++)
        for (int j = 0; j < width; j++)
            transposedMatrix[j][i] = matrix[i][j];
    return transposedMatrix;
}

void printMatrix(std::vector<std::vector<int> > &matrix, std::string name) {
    int height = matrix.size();
    int width = matrix[0].size();
    std::cout << name << std::endl;
    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            std::cout << matrix[i][j] << " ";
        }
        std::cout << std::endl;
    }
    std::cout << std::endl;
}

// Returns the value of the cell with the least value of the 3 above the given i, j
int minFromAbove(std::vector<std::vector<int> > &cumulative, int i, int j) {
    int min = INT_MAX;

    if (j != 0)
        min = cumulative[i-1][j-1];
    if (cumulative[i-1][j] < min)
        min = cumulative[i-1][j];
    if (j != cumulative[i].size() - 1)
        if (cumulative[i-1][j+1] < min)
            min = cumulative[i-1][j+1];
    
    return min;
}

// Returns the coordinates in the cumulative energy matrix of the least of the 3 entries above the number at i, j
std::pair<int, int> minCoodsFromAbove(std::vector<std::vector<int> > &cumulative, int i, int j) {
    std::pair<int, int> min;
    min.first = i - 1;
    // There will always be an element above this one, so default min j to it just in case
    min.second = j;
    if (j != 0)
        min.second = j - 1;
    if (cumulative[i-1][j] < cumulative[min.first][min.second])
        min.second = j;
    if (j != cumulative[i].size() - 1)
        if (cumulative[i-1][j+1] < cumulative[min.first][min.second])
            min.second = j + 1;
        
    return min;
}

// Returns the coordinates in the cumulative energy matrix of the minimum value in one row
std::pair<int, int> minCoords(std::vector<std::vector<int> > &cumulative, int i) {
    std::pair<int, int> min;
    min.first = i;
    min.second = 0;
    for (int j = 1; j < cumulative[i].size(); j++)
        if (cumulative[i][j] < cumulative[i][min.second])
            min.second = j;

    return min;
}

// Calculate the energy matrix
std::vector<std::vector<int> > calculateEnergyMatrix(std::vector<std::vector<int> > &matrix) {
    int height = matrix.size();
    int width = matrix[0].size();
    std::vector<std::vector<int> > energyMatrix = createVector(width, height);
    int left, right, top, bottom;
    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            if (j == 0) left = 0; 
            else left = abs(matrix[i][j] - matrix[i][j-1]);;

            if (j == width - 1) right = 0;
            else right = abs(matrix[i][j] - matrix[i][j+1]);

            if (i == 0) top = 0;
            else top = abs(matrix[i][j] - matrix[i-1][j]);

            if (i == height - 1) bottom = 0;
            else bottom = abs(matrix[i][j] - matrix[i+1][j]);

            energyMatrix[i][j] = left + right + top + bottom;
        }
    }

    return energyMatrix;
}

// Calculate cumulative matrix
// TODO: investigate time sink, make it faster
std::vector<std::vector<int> > calculateCumulativeMatrix(std::vector<std::vector<int> > &energyMatrix) {

    int height = energyMatrix.size();
    int width = energyMatrix[0].size();
    std::vector<std::vector<int> > cumulativeMatrix = createVector(width, height);

    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            if (i == 0) {
                cumulativeMatrix[i][j] = energyMatrix[i][j];  
            }
            else {
                cumulativeMatrix[i][j] = energyMatrix[i][j] + minFromAbove(cumulativeMatrix, i, j);     
            }
        }
    }

    return cumulativeMatrix;
}

// Trace up from bottom and find the path of the lowest numbers
std::vector<std::pair<int, int> > findMinPath(std::vector<std::vector<int> > &cumulativeMatrix) {
    int height = cumulativeMatrix.size();
    std::vector<std::pair<int, int> > path;
    path.push_back(minCoords(cumulativeMatrix, height - 1));
    for (int i = height - 1; i > 0; i--)
        path.push_back(minCoodsFromAbove(cumulativeMatrix, path.back().first, path.back().second));

    return path;
}

// Removes the elements specified in the minPath
void removeMinPath(std::vector<std::vector<int> > &matrix, std::vector<std::pair<int, int> > &minPath) {
    for (int i = 0; i < minPath.size(); i++)
        matrix[minPath[i].first].erase(matrix[minPath[i].first].begin() + minPath[i].second);

}

std::vector<std::vector<int> > removeSeams(std::vector<std::vector<int> > &matrix, int seams) {
    std::vector<std::vector<int> > energyMatrix, cumulativeMatrix;
    std::vector<std::pair<int, int> > minPath;

    // remove "seams" amount of seams 
    for (int count = 0; count < seams; count++) {
        energyMatrix = calculateEnergyMatrix(matrix);
        cumulativeMatrix = calculateCumulativeMatrix(energyMatrix);
        minPath = findMinPath(cumulativeMatrix);
        removeMinPath(matrix, minPath);
    }

    return matrix;
}

int main(int argc, char*argv[]) {


    if (argc < 4) {
        std::cout << "Incorrect format: should be \"a.exe [image.pgm] [vertical seams] [horizontal seams]\"" << std::endl;
    }
    else {
        int width = 0, height = 0, maxVal = 0;
        std::vector<std::vector<int> > pgm;
        std::string p_value;

        // Store arguments in variables
        std::string imageFilename = argv[1];
        std::string verticalString = argv[2];
        std::string horizontalString = argv[3];

        // turn arg seam #s into ints
        std::stringstream verticalInt(verticalString);
        std::stringstream horizontalInt(horizontalString);
        int vertical, horizontal;
        verticalInt >> vertical;
        horizontalInt >> horizontal;

        std::string outputFilename = imageFilename.substr(0, imageFilename.size()-4) + "_processed.pgm";

        std::ifstream file;
        file.open(imageFilename.c_str());
        if (file.is_open()) {
            std::string chunk;
            int count = 0;
            // get first 3 lines, p-number, width/height, and max greyscale val
            while (maxVal == 0) {
                file >> chunk;
                // if encounter a '#', thn skip the rest of the line
                if (chunk[0] == '#') {
                    continue;
                    std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
                }

                std::stringstream myChunk(chunk);

                if (p_value.empty()) p_value = chunk;
                else if (width == 0) myChunk >> width;
                else if (height == 0) myChunk >> height;
                else myChunk >> maxVal;
            }

            // make 2d array of size gotten from top of pgm file
            pgm = createVector(width, height);
            // fill the array
            for (int i = 0; i < height; i++) {
                for (int j = 0; j < width; j++) {
                    file >> chunk;
                    std::stringstream myVal(chunk);
                    myVal >> pgm[i][j];
                }
            }


        } else {
            std::cout << "Failed to open file \"" << imageFilename << "\"" << std::endl;
        }

        if (maxVal != 0) {
            file.close();
            // set pgm to the output of removing all the vertical seams
            pgm = removeSeams(pgm, vertical);

            // transpose the matrix so we can use the same function to remove horizontal seams
            pgm = transpose(pgm);

            // set pgm to the output of removing all the horizontal seams
            pgm = removeSeams(pgm, horizontal);

            // transpose back to get the original orientation
            pgm = transpose(pgm);

            // pgm is now the trimmed image, output to file with new dimensions
            std::ofstream outfile;
            outfile.open(outputFilename.c_str(), std::ofstream::out | std::ofstream::trunc);

            // export 4 initial entries
            outfile << p_value << "\n";
            outfile << "# Output after removing " << vertical << " vertical and " << horizontal << " seams from " << imageFilename << "\n";
            outfile << pgm[0].size() << " " << pgm.size() << "\n";
            outfile << maxVal << "\n";

            // export the matrix
            for (int i = 0; i < pgm.size(); i++) {
                for (int j = 0; j < pgm[0].size(); j++) {
                    outfile << pgm[i][j] << " ";
                }
                outfile << "\n";
            }

            outfile.close();

            std::cout << "Output file exported to " << outputFilename << std::endl;
        }



    }
}