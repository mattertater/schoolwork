#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include <algorithm>

/*
Matt McDade 2849637
Data Structures 3460 : 316
Project 2

Problem: Write a menu-driven C++ program to implement
         operations on a heap and binary file I/O
*/

using namespace std;

template <class T>
class Heap {
  vector<T> list;

  void sortUp();
  void sortDown();
  void swap(int child, int parent);
  int getLeftChild(int parent);
  int getRightChild(int parent);
  int getParent(int child);

public:
  Heap();
  void insert(T);
  int getSize();
  void remove(T);
  void print();
  void toBinaryFile();
  void printBinaryFile();
};

template <class T>
Heap<T>::Heap(){
}

template <class T>
int Heap<T>::getSize() {
  return list.size();
}

template <class T>
void Heap<T>::swap(int child, int parent){
  T temp;
  temp = list[child];
  list[child] = list[parent];
  list[parent] = temp;
}

template <class T>
int Heap<T>::getParent(int child){
  if (child == 0)
    return 0;
  else if (child % 2 == 0)
    return (child / 2) - 1;
  else
    return child/2;
}

template <class T>
int Heap<T>::getLeftChild(int parent){
  return 2 * parent + 1;
}

template <class T>
int Heap<T>::getRightChild(int parent){
  return 2 * parent + 2;
}

template <class T>
void Heap<T>::insert(T value){
  list.push_back(value);
    sortUp();
}

template <class T>
void Heap <T>::sortUp(){
  int child = list.size() - 1;
  int parent = getParent(child);

  while (list[child] > list[parent] && child >=0 && parent >= 0) {
    swap(child, parent);
    child = parent;
    parent = getParent(child);
  }
}


template <class T>
void Heap<T>::remove(T value){
  int child = list.size() - 1;
  int parent;
  for(int i = 0; i < list.size(); i++)
    if (value == list[i]){
      parent = i;
      cout << value << " found. Removing entry..." << endl;
      break;
    }

  swap(child, parent);

  list.pop_back();
  cout << "Removed." << endl;

  sortDown();
}

template <class T>
void Heap<T>::sortDown(){
  int parent = 0;

  while(1) {
    int left = getLeftChild(parent);
    int right = getRightChild(parent);
    int length = list.size();
    int largest = parent;

    if (left < length && list[left] > list[largest])
    largest = left;

    if (right < length && list[right] > list[largest])
    largest = right;

    if (largest != parent) {
      swap(largest, parent);
      parent = largest;
    }
    else
    break;
  }
}

template <class T>
void Heap<T>::print(){
  vector<T> sortedList = list;
  sort(sortedList.begin(), sortedList.end());
  for(int i = 0; i < sortedList.size(); i++)
    cout << sortedList[i] << ", ";
}

template <class T>
void Heap<T>::toBinaryFile(){
  vector<T> sortedList = list;
  sort(sortedList.begin(), sortedList.end());
  fstream ofile("316p2.rec", ios::out | ios::binary);
  ofile.write((char*)&sortedList, sizeof(sortedList));
  ofile.close();
  cout << "File written to \"316p2.rec\"" << endl;
}

template <class T>
void Heap<T>::printBinaryFile(){
  cout << "Couldn't get this part to work, look at the code comments to see how far I got if you want." << endl;
  // basic_ifstream<T> ifile("316p2.rec", ios::binary);
  //
  // vector<T> input(istreambuf_iterator<T>(ifile), istreambuf_iterator<T>());
  // for(int i = 0; i < input.size(); i++)
  //   cout << input[i] << ", ";
  // ifile.close();
}

struct Student{
  string firstName, lastName;
  int id;
  double gpa;
};

int main(){

  // create 2 empty heaps and the response string to start
  Heap<int> heapID;
  Heap<string> heapName;
  string response, filename = "";
  string firstName, lastName;
  double gpa;
  int id, count = 0;

  // infinite loop
  while(1){

    // user prompt questions
    cout << "\n(1) Read data from external file" << endl;
    if(filename != "") // only print this option if ifstream is associated with file
    cout << "(2) Build max heap" << endl;
    if(heapID.getSize() > 0 || heapName.getSize() > 0){ //only list options if a heap is populated
      cout << "(3) Add new record to max heap" << endl;
      cout << "(4) Delete a record from the max heap" << endl;
      cout << "(5) Print sorted list from max heap in ascending order" << endl;
      cout << "(6) Save sorted list to external binary file" << endl;
    }
    cout << "(7) Load saved binary file and print" << endl;
    cout << "(8) Quit" << endl;
    getline(cin, response);

    switch(stoi(response)){

      case 1:{
        // read data from external file
        cout << "Enter the file name, or press enter to use default file" << endl;
        getline(cin, response);

        // only setting filename here to avoid ifstream scoping issues later
        if(response == "")
          filename = "cs316p2.dat";
        else
          filename = response;

        cout << "\"" << filename << "\" has been loaded" << endl;
        break;
      }

      case 2:{ // build max heap based off text file input
        vector<Student> students; // not doing anything with this yet
        cout << "Build max heap with (1)IDs or (2)last names?" << endl;
        getline(cin, response);
        ifstream infile(filename);
        if(response == "1"){ // build max heap based on ids
          while(infile >> firstName >> lastName >> id >> gpa){
            heapID.insert(id);
          }
        }
        else{ // build max heap based on last names
          while(infile >> firstName >> lastName >> id >> gpa){
            heapName.insert(lastName);
          }
        }

        cout << "Heap built." << endl;
        break;
      }

      case 3:{ // Add element to existing heap (ID or name)
        cout << "Enter the first name: "<< endl;
        getline(cin, response);
        firstName = response;
        cout << "Enter the last name: "<< endl;
        getline(cin, response);
        lastName = response;
        cout << "Enter the ID: "<< endl;
        getline(cin, response);
        id = stoi(response);
        cout << "Enter the GPA: "<< endl;
        getline(cin, response);
        gpa = stod(response);

        heapID.insert(id);
        heapName.insert(lastName);

        cout << "Entry added" << endl;
        break;
      }

      case 4:{ // Remove element from existing heap (ID or name)
        // IMPLEMENT DELETE FUNCTION
        cout << "Remove by (1)ID or (2)last name?" << endl;
        getline(cin, response);
        if(response == "1"){
          cout << "Enter the ID to remove:" << endl;
          getline(cin, response);
          heapID.remove(stoi(response));
        }
        else{
          cout << "Enter the last name to remove:" << endl;
          getline(cin, response);
          heapName.remove(response);

        }
        break;
      }

      case 5:{ // Print sorted list from max heap (ID or name)
        cout << "Printed sorted list of (1)IDs or (2)last names?" << endl;
        getline(cin, response);
        if(response == "1")
          heapID.print();
        else
          heapName.print();
        cout << endl;
        break;
      }

      case 6:{ // Save existing heap to binary file (ID or name)
        cout << "Export sorted list of (1)IDs or (2)last names?" << endl;
        getline(cin, response);
        if(response == "1")
          heapID.toBinaryFile();
        else
          heapName.toBinaryFile();
        break;
      }

      case 7:{ // Load binary file. Check if it exists first?
        cout << "Print sorted binary file input by (1)IDs or (2)last names?" << endl;
        getline(cin, response);
        if(response == "1")
          heapID.printBinaryFile();
        else
          heapName.printBinaryFile();
        break;
      }

      case 8:{ // Exit program
        cout << "Exiting..." << endl;
        exit(0);
      }
      default: break;
    }
  }
}
