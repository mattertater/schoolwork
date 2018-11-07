// Matt McDade
// Algorithms Project 2
// Convex hull algorihtms

// Graham scan algorithm adapted from https://www.geeksforgeeks.org/convex-hull-set-2-graham-scan/
// Jarvis march algorithm adapted from https://www.geeksforgeeks.org/convex-hull-set-1-jarviss-algorithm-or-wrapping/
// Quick hull algorithm adapted from https://www.geeksforgeeks.org/quickhull-algorithm-convex-hull/

// Standard libraries
#include <iostream>
#include <fstream>
#include <stdlib.h>
#include <stack>
#include <string>
#include <vector>
#include <set>
#include <ctime>

#define iPair std::pair<int, int>

struct Point {
  int x, y;
};

Point p0;

// Vector used for jarvis's march and quickhull
std::vector<Point> jarvis_hull;

// Set used for quickhull
std::set<iPair> quick_hull;

// -----------------
// UTILITY FUNCTIONS
// -----------------

// Returns the point under the top point in the stack S
Point nextToTop(std::stack<Point> &S) {
  Point p = S.top();
  S.pop();
  Point res = S.top();
  S.push(p);
  return res;
}

// Swaps two points
int swap(Point &p1, Point &p2) {
  Point temp = p1;
  p1 = p2;
  p2 = temp;
}

// Returns distance^2 between 2 points
int distSq(Point p1, Point p2) {
  return (p1.x - p2.x) * (p1.x - p2.x) + (p1.y - p2.y) * (p1.y - p2.y);
}

// 
int orientation(Point p, Point q, Point r) {
  int val = (q.y - p.y) * (r.x - q.x) - (q.x - p.x) * (r.y - q.y); 
  if (val == 0) return 0;
  return (val > 0) ? 1 : 2;
}

// Helps sort with respect to first point
int compare(const void *vp1, const void *vp2) {
  Point *p1 = (Point *)vp1;
  Point *p2 = (Point *)vp2;

  int o = orientation(p0, *p1, *p2);
  if (o == 0)
    return (distSq(p0, *p2) >= distSq(p0, *p1)) ? -1 : 1;
  return (o == 2) ? -1 : 1;
}

// Returns side of a point that joins p1 and p2
int findSide(iPair p1, iPair p2, iPair p) {
  int val = (p.second - p1.second) * (p2.first - p1.first) - (p2.second - p1.second) * (p.first - p1.first);
  if (val > 0) return 1;
  if (val < 0) return -1;
  return 0;
}

// Return value proportional to distance between p and the line 
// connecting p1 and p2
int lineDist(iPair p1, iPair p2, iPair p) {
  return abs((p.second - p1.second) * (p2.first - p1.first) - (p2.second - p1.second) * (p.first - p1.first));
}


// ----------------------
// CONVEX HULL ALGORITHMS
// ----------------------

// Find a convex hull using Graham scan
void grahamScan(std::vector<Point> points, int n, std::string outputFile) {
  int ymin = points[0].y, min = 0;

  // Go through all points and find one with least y value
  for (int i = 1; i < n; i++) {
    int y = points[i].y;

    if ((y < ymin) || (ymin == y && points[i].x < points[min].x))
      ymin = points[i].y, min = i;
  }

  // Set p0 to the lowest point we just found, then sort the rest of them
  swap(points[0], points[min]);
  p0 = points[0];
  
  qsort(&points[1], n-1, sizeof(Point), compare);

  int m = 1;
  for (int i = 1; i < n; i++) {
    while (i < n-1 && orientation(p0, points[i], points[i+1]) == 0)
      i++;
    points[m] = points[i];
    m++;
  }

  if (m < 3) return;

  std::stack<Point> S;
  S.push(points[0]);
  S.push(points[1]);
  S.push(points[2]);

  for (int i = 3; i < m; i++) {
    while(orientation(nextToTop(S), S.top(), points[i]) != 2)
      S.pop();
    S.push(points[i]);
  }

  // export points to dataFile
  std::ofstream file;
  file.open(outputFile.c_str(), std::ofstream::out | std::ofstream::trunc);
  while (!S.empty()) {
    Point p = S.top();
    file << p.x << "\t" << p.y << "\n";
    S.pop();
  }
  file.close();
}


// Find a convex hull using Jarvis's March
void jarvisMarch(std::vector<Point> points, int n, std::string outputFile) {
  if (n < 3) {
    std::cout << "Must be more than 3 points" << std::endl;
    return;
  }

  int left = 0;
  for (int i = 1; i < n; i++)
    if (points[i].x < points[left].x)
      left = i;

  int p = left, q;
  do {
    jarvis_hull.push_back(points[p]);
    q = (p + 1) % n;

    for (int i = 0; i < n; i++)
      if (orientation(points[p], points[i], points[q]) == 2)
        q = i;

    p = q;

  } while (p != left);

  // export points to dataFile
  std::ofstream file;
  file.open(outputFile.c_str(), std::ofstream::out | std::ofstream::trunc);
  for (int i = 0; i < jarvis_hull.size(); i++) {
    file << jarvis_hull[i].x << "\t" << jarvis_hull[i].y << "\n";
  }
  file.close();
}


// Recursive helper for Quickhull function
void hullHelper(std::vector<iPair> points, int n, iPair p1, iPair p2, int side) {
  int index = -1;
  int max_dist = 0;

  for (int i = 0; i < n; i++) {
    int temp = lineDist(p1, p2, points[i]);
    if (findSide(p1, p2, points[i]) == side && temp > max_dist) {
      index = i;
      max_dist = temp;
    }
  }

  if (index == -1) {
    quick_hull.insert(p1);
    quick_hull.insert(p2);
    return;
  }

  hullHelper(points, n, points[index], p1, -findSide(points[index], p1, p2));
  hullHelper(points, n, points[index], p2, -findSide(points[index], p2, p1));
}

// Find a convex hull using Quickhull
void quickHull(std::vector<iPair> points, int n, std::string outputFile) {
  if (n < 3) {
    std::cout << "Must be more than 3 points" << std::endl;
    return;
  }

  int minX = 0, maxX = 0;
  for (int i = 1; i < n; i++) {
    if (points[i].first < points[minX].first)
      minX = i;
    if (points[i].first > points[maxX].first)
      maxX = i;
  }

  

  hullHelper(points, n, points[minX], points[maxX], 1);
  hullHelper(points, n, points[minX], points[maxX], -1);
  

  std::ofstream file;
  file.open(outputFile.c_str(), std::ofstream::out | std::ofstream::trunc);
  while (!quick_hull.empty()) { 
    file << ( *quick_hull.begin()).first << "\t" << (*quick_hull.begin()).second << "\n";
    quick_hull.erase(quick_hull.begin()); 
  } 
  file.close();
}



int main(int argc, char *argv[]) {
  if (argc < 3)
    std::cout << "Incorrect format: should be \"a.exe [algType] [dataFile]\"";
  else {
    std::string algType = argv[1];
    std::string dataFilename = argv[2];
    std::string outputFile = "";

    std::ifstream file;
    file.open(dataFilename.c_str());
    std::vector<Point> points;
    std::vector<iPair> quick_points;

    // Read datapoints from dataFile
    if (file.is_open()) {
      int x, y;
      while(file >> x >> y) {
        Point myPoint;
        myPoint.x = x;
        myPoint.y = y;
        points.push_back(myPoint);
        quick_points.push_back(*new iPair(x, y));
      }
    }

    if (tolower(algType[0]) == 'g') {
      std::clock_t start = std::clock();
      grahamScan(points, points.size(), "hull_G.txt");
      double duration = (std::clock() - start) / (double)CLOCKS_PER_SEC;
      std::cout << "Graham scan took " << duration <<  " seconds" << std::endl;
    } else if (tolower(algType[0]) == 'j') {
      std::clock_t start = std::clock();
      jarvisMarch(points, points.size(), "hull_J.txt");
      double duration = (std::clock() - start) / (double)CLOCKS_PER_SEC;
      std::cout << "Jarvis's March took " << duration <<  " seconds" << std::endl;
    } else { 
      std::clock_t start = std::clock();
      quickHull(quick_points, points.size(), "hull_Q.txt");
      double duration = (std::clock() - start) / (double)CLOCKS_PER_SEC;
      std::cout << "Quickhull took " << duration <<  " seconds" << std::endl;
    }
  }
  return 0;
}