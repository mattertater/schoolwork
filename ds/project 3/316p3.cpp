#include "316p3.h"
#include <iostream>

// Matt McDade
// Data Structures Project 3
// Weighted graph topological sort given input text file

using namespace std;

int main() {

  string response;
  WeightedGraph g;

  while(1) {

  cout << "(1) Open Input File" << endl;
  cout << "(2) Run Topological Sort" << endl;
  cout << "(3) Quit" << endl;
  getline(cin, response);

  if (response == "1")
    g.buildWeightedGraph();
  else if (response == "2")
    g.topologicalSort();
  else if (response == "3")
    exit(0);
}
  return 0;
}
