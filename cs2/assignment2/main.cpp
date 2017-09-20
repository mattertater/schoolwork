#include "Tax.cpp"

/*
Matt McDade
Computer Science 2
Assignment 2
Array of Structs- Gets tax information and
prints out taxes for multiple people.
*/
using namespace constants;

int main(){

    taxPayer a[SIZE];

    for(int i=0; i<SIZE; i++){
        a[i].index=i+1;
        taxTaker(a[i]);
    }
    for(int i=0; i<SIZE; i++){
        taxPrint(a[i]);
    }

    return 0;
}
