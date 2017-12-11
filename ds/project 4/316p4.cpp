#include <iostream>
#include <stdlib.h>

// Matt McDade
// Data Structures Project 4
// Compare different hashing styles by computing number of collisions
// required in a long random sequence for insertions.

// Table size is 10001
// consider 10 random sequences of integers with incemental size of 1000 (1000, 2000, ... 10000)
// for each random sequence, insert integer into hash table and count # of collisions for each probing method

using namespace std;

int getLinearCollisions(int list[], int size){
  int collisions = 0, index;
  int table[10001] = {0};

  for (int i = 0; i < size; i++){
    index = list[i] % 10001;
    if (table[index] == 0){
      table[index] = list[i];
    }
    else {
      bool inserted = false;
      while(!inserted) {
        index++; collisions++;
        if (index > 10000) index = 0;
        if (table[index] == 0){
          table[index] = list[i];
          inserted = true;
        }
      }
    }
  }
  return collisions;
}

std::pair<int, int> getQuadraticCollisions(int list[], int size){
  int collisions = 0, failures = 0, index;
  int table[10001] = {0};

  for (int i = 0; i < size; i++){
    index = list[i] % 10001;
    if (table[index] == 0){
      table[index] = list[i];
    }

    else {
      bool inserted = false;
      int val = 0, offset, newIndex;
      while(!inserted) {
        val++; collisions++;
        offset = val * val;
        newIndex = index + offset;
        if (offset > 10000) {failures++; inserted = true;}
        if (newIndex > 10000) newIndex -= 10000;
        if (table[newIndex] == 0){
          table[newIndex] = list[i];
          inserted = true;
        }
      }
    }
  }
  return {collisions, failures};
}

std::pair<int, int> getDoubleCollisions(int list[], int size){
  int collisions = 0, failures = 0, index;
  int table[10001] = {0};

  for (int i = 0; i < size; i++){
    index = list[i] % 10001;
    if (table[index] == 0){
      table[index] = list[i];
    }

    else {
      bool inserted = false;
      int val = 0, offset, newIndex;
      int newHash = 7 - (list[i] % 7);
      while(!inserted) {
        val++; collisions++;
        offset = val * newHash;
        newIndex = index + offset;
        if (offset > 10000) {failures++; inserted = true;}
        if (newIndex > 10000) newIndex -= 10000;
        if (table[newIndex] == 0){
          table[newIndex] = list[i];
          inserted = true;
        }
      }
    }
  }
  return {collisions, failures};
}




int main() {

  // creating common lists

  // initializing all the different sized lists
  int list1[1000], list2[2000], list3[3000], list4[4000], list5[5000];
  int list6[6000], list7[7000], list8[8000], list9[9000], list10[10000];

  // generating each random list
  for (int i = 0; i < 1000; i++){list1[i] = rand();}
  for (int i = 0; i < 2000; i++){list2[i] = rand();}
  for (int i = 0; i < 3000; i++){list3[i] = rand();}
  for (int i = 0; i < 4000; i++){list4[i] = rand();}
  for (int i = 0; i < 5000; i++){list5[i] = rand();}
  for (int i = 0; i < 6000; i++){list6[i] = rand();}
  for (int i = 0; i < 7000; i++){list7[i] = rand();}
  for (int i = 0; i < 8000; i++){list8[i] = rand();}
  for (int i = 0; i < 9000; i++){list9[i] = rand();}
  for (int i = 0; i < 10000; i++){list10[i] = rand();}

  // linear probing
  int n11=0, n12=0, n13=0, n14=0, n15=0, n16=0, n17=0, n18=0, n19=0, n10=0;
  n11 = getLinearCollisions(list1, 1000);
  n12 = getLinearCollisions(list2, 2000);
  n13 = getLinearCollisions(list3, 3000);
  n14 = getLinearCollisions(list4, 4000);
  n15 = getLinearCollisions(list5, 5000);
  n16 = getLinearCollisions(list6, 6000);
  n17 = getLinearCollisions(list7, 7000);
  n18 = getLinearCollisions(list8, 8000);
  n19 = getLinearCollisions(list9, 9000);
  n10 = getLinearCollisions(list10, 10000);


  // quadratic probing
  int n21=0, n22=0, n23=0, n24=0, n25=0, n26=0, n27=0, n28=0, n29=0, n20=0;
  int f21=0, f22=0, f23=0, f24=0, f25=0, f26=0, f27=0, f28=0, f29=0, f20=0;
  n21 = getQuadraticCollisions(list1, 1000).first;
  n22 = getQuadraticCollisions(list2, 2000).first;
  n23 = getQuadraticCollisions(list3, 3000).first;
  n24 = getQuadraticCollisions(list4, 4000).first;
  n25 = getQuadraticCollisions(list5, 5000).first;
  n26 = getQuadraticCollisions(list6, 6000).first;
  n27 = getQuadraticCollisions(list7, 7000).first;
  n28 = getQuadraticCollisions(list8, 8000).first;
  n29 = getQuadraticCollisions(list9, 9000).first;
  n20 = getQuadraticCollisions(list10, 10000).first;

  f21 = getQuadraticCollisions(list1, 1000).second;
  f22 = getQuadraticCollisions(list2, 2000).second;
  f23 = getQuadraticCollisions(list3, 3000).second;
  f24 = getQuadraticCollisions(list4, 4000).second;
  f25 = getQuadraticCollisions(list5, 5000).second;
  f26 = getQuadraticCollisions(list6, 6000).second;
  f27 = getQuadraticCollisions(list7, 7000).second;
  f28 = getQuadraticCollisions(list8, 8000).second;
  f29 = getQuadraticCollisions(list9, 9000).second;
  f20 = getQuadraticCollisions(list10, 10000).second;


  // double hashing
  int n31=0, n32=0, n33=0, n34=0, n35=0, n36=0, n37=0, n38=0, n39=0, n30=0;
  int f31=0, f32=0, f33=0, f34=0, f35=0, f36=0, f37=0, f38=0, f39=0, f30=0;

  n31 = getDoubleCollisions(list1, 1000).first;
  n32 = getDoubleCollisions(list2, 2000).first;
  n33 = getDoubleCollisions(list3, 3000).first;
  n34 = getDoubleCollisions(list4, 4000).first;
  n35 = getDoubleCollisions(list5, 5000).first;
  n36 = getDoubleCollisions(list6, 6000).first;
  n37 = getDoubleCollisions(list7, 7000).first;
  n38 = getDoubleCollisions(list8, 8000).first;
  n39 = getDoubleCollisions(list9, 9000).first;
  n30 = getDoubleCollisions(list10, 10000).first;

  f31 = getDoubleCollisions(list1, 1000).second;
  f32 = getDoubleCollisions(list2, 2000).second;
  f33 = getDoubleCollisions(list3, 3000).second;
  f34 = getDoubleCollisions(list4, 4000).second;
  f35 = getDoubleCollisions(list5, 5000).second;
  f36 = getDoubleCollisions(list6, 6000).second;
  f37 = getDoubleCollisions(list7, 7000).second;
  f38 = getDoubleCollisions(list8, 8000).second;
  f39 = getDoubleCollisions(list9, 9000).second;
  f30 = getDoubleCollisions(list10, 10000).second;

// insert values of each list into the table

  cout << "Size\t\t1000\t2000\t3000\t4000\t5000\t6000\t7000\t8000\t9000\t10000"<< endl;
  cout << "Linear\t\t" << n11 << "\t" << n12 << "\t" << n13 << "\t" << n14 << "\t" << n15 << "\t" << n16 << "\t" << n17 << "\t" << n18 << "\t" << n19 << "\t" << n10 << endl;
  cout << "Quadratic\t" << n21 << "\t" << n22 << "\t" << n23 << "\t" << n24 << "\t" << n25 << "\t" << n26 << "\t" << n27 << "\t" << n28 << "\t" << n29 << "\t" << n20 << endl;
  cout << "Failures\t"  << f21 << "\t" << f22 << "\t" << f23 << "\t" << f24 << "\t" << f25 << "\t" << f26 << "\t" << f27 << "\t" << f28 << "\t" << f29 << "\t" << f20 << endl << endl;
  cout << "Double\t\t" << n31 << "\t" << n32 << "\t" << n33 << "\t" << n34 << "\t" << n35 << "\t" << n36 << "\t" << n37 << "\t" << n38 << "\t" << n39 << "\t" << n30 << endl;
  cout << "Failures\t"  << f31 << "\t" << f32 << "\t" << f33 << "\t" << f34 << "\t" << f35 << "\t" << f36 << "\t" << f37 << "\t" << f38 << "\t" << f39 << "\t" << f30 << endl;


  return 0;
}
