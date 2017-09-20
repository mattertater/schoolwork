#include <iostream>
#include <memory>
#include <algorithm>
#include "deleteRepeats.hpp"
#include "deleteRepeats.cpp"
/*
Matt McDade
Computer Science 2
Assignment 1
Delete Repeat - Takes an array of chars, and removes any
repeated characters using smart pointers, and end with
a new array that has no repeats.
*/

int main(){

    int count=0;
    unique_ptr<char[]> noRepeats(new char[SIZE]);
    char originalArray[SIZE];

    originalArray[0]='a';
    originalArray[1]='b';
    originalArray[2]='b';
    originalArray[3]='c';
    originalArray[4]='a';
    originalArray[5]='c';
    originalArray[6]='a';
    originalArray[7]='c';
    originalArray[8]='b';
    originalArray[9]='c';

    //prints out original array separated by spaces
    for(int i=0; i<SIZE; i++){
        cout<<originalArray[i]<<" ";
    }
    cout<<endl;
    noRepeats = deleteRepeats(originalArray, count);

    //prints sorted array by going through elements of smart pointer
    for(int i=0; i<count; i++){
        cout<<noRepeats[i]<<" ";
    }
    cout<<endl<<"There were "<<(SIZE-count)<<" repeats";
}
