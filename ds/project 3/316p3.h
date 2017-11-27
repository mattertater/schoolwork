#include <iostream>
#include <fstream>
#include <list>
#include <stack>
#include <vector>

using namespace std;

struct Node {
  Node(int _vj, int _wij) { vj = _vj; wij = _wij; }
  int vj;   // line pointing to
  int wij;  // weight of line
};

class WeightedGraph {
  list<Node> *adj;   // pointer to adjacent lists
  void findUnvisitedNeighbors(int v, bool visited[], stack<int> &Stack);
  void addEdge(int vi, int vj, int wij);

public:
  int v;  // number of nodes
  WeightedGraph();
  void buildWeightedGraph();  // asks for text file, builds graph
  void topologicalSort();     // prints a Topological Sort of the complete graph
};

WeightedGraph::WeightedGraph() {}

void WeightedGraph::buildWeightedGraph(){

  bool found = false;
  string filename, line;
  int lines = 0;

  cout << "Enter file name: " << endl;
  getline(cin, filename);
  ifstream file(filename.c_str());

  while (getline(file, line))   // get number of elements in the file for the array size
    lines++;

  file.clear();             // go back to beginning of file
  file.seekg(0, file.beg);

  adj = new list<Node>[lines]; // initialize node list with correct number of nodes
  int vi, vj, wij;
  while (file >> vi >> vj >> wij)
    addEdge(vi, vj, wij);
  v = lines;
}

void WeightedGraph::addEdge(int vi, int vj, int wij) {
  Node node(vj, wij);
  adj[vi].push_back(node);
}

// A recursive function used by topologicalSort
void WeightedGraph::findUnvisitedNeighbors(int v, bool visited[], stack<int> &Stack) {
  visited[v] = true; // mark node visited
  list<Node>::iterator i;
  for (i = adj[v].begin(); i != adj[v].end(); ++i) { // find all adjacent unvisited nodes
    Node node = *i;
    if (!visited[node.vj]) // keep looking for more neighbors if unvisited
      findUnvisitedNeighbors(node.vj, visited, Stack);  // recursive function call
  }
  Stack.push(v); // push vertex to stack, no more unvisited neighbors. Returns back to parent node
  cout << "added " << v << " to stack" << endl;
}

void WeightedGraph::topologicalSort() {
  stack<int> Stack; // output stack
  bool *visited = new bool[v]; // mark all nodes unvisited
  for (int i = 0; i < v; i++)
    visited[i] = false;
  for (int i = 0; i < v; i++)
    if (visited[i] == false)
      findUnvisitedNeighbors(i, visited, Stack);

  while (Stack.empty() == false) {  // print contents of stack
      cout << Stack.top() << " ";
      Stack.pop();
  }
}
