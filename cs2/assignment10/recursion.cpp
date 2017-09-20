/*
   COPYRIGHT (C) 2017 Matt McDade (mm263) All rights reserved.
   CS assignment
   Author.  Matt McDade
            mm263@zips.uakron.edu
   Version. 1.01 09.09.2017
   Purpose: This program ...
*/
#include <iostream>

using namespace std;

// prototypes
template <class T>
void printar(const T[], int);
void chew_system_stack();

/*
 * Recursive version of fibonacci
 */
int fibrecurse(int n) {
    if (n <= 0) return 0;
    else if (n == 1) return 1;
    else return fibrecurse(n-1)+fibrecurse(n-2);
}

/*
 * Iterative (loop) version of fibonacci
 */
int fibiterate(int n) {
    int fib[] = {0, 1, 1};
    for(int i = 2; i<=n; i++){
        fib[i%3] = fib[(i-1)%3] + fib[(i-2)%3];
    }
    return fib[n%3];
}

/*
 * Recursive quicksort
 */
template <class T>
void quicksort(T ar[], int first, int last) {
      if (first < last) {
         //get last element as temp to move around
         int temp = ar[last];
         int i = (first - 1);
         for (int j = first; j <= last- 1; j++) {
            if (ar[j] <= temp) {
               i++;
               swap(ar[i], ar[j]);
            }
         }
         swap(ar[i + 1], ar[last]);
         quicksort(ar, first, i);
         quicksort(ar, i+2, last);
      }
   }


int main() {
    const int FIBLOOPS = 10;
    const int ARSIZ = 16;
    int ar[ARSIZ];

    cout << "Recursive fib: ";
    for(int i = 0; i < FIBLOOPS; ++i)
    {
        cout << fibrecurse(i) << " ";
    }
    cout << endl;
    cout << "Iterative fib: ";
    for(int i = 0; i < FIBLOOPS; ++i)
        cout << fibiterate(i) << " ";
    cout << endl;

    cout << "Quicksort:" << endl;
    // populate random ar
    for(int i = 0; i < ARSIZ; ++i)
        ar[i] = (i * 3037) % 2099;  // prime numbers! again!
    
    cout << "Before sorting: ";
    printar(ar, ARSIZ);
    quicksort(ar, 0, ARSIZ-1);
    cout << "After sorting: ";
    printar(ar, ARSIZ);

    //cout << "Chewing system stack:" << lastl;
    //chew_system_stack();

    return 0;
}

//  utility functions, do not modify
template <class T>
void printar(const T ar[], int s) {
    for(int i = 0; i < s; ++i)
        cout << ar[i] << " ";
    cout << endl;
}

void printstackpointer() {
    void * stack_pointer;
    // inline assembly language to get stack pointer
    __asm__ __volatile__("movl  %%esp,%%eax" : "=a" (stack_pointer));
    cout << stack_pointer << endl;
}

void chew_system_stack() {
    // Feel free to play with this, but please
    // do NOT enable this for your final commit!
    printstackpointer();
    chew_system_stack();
}
/* last utilities */
