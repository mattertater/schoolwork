#ifndef MYSTACK_H
#define MYSTACK_H

//***************************************//
//static stack template                  //
//finish all functions                   //
//***************************************//


//	Matt McDade 2849637
// mm263@zips.uakron.edu
// CS2 Project 2, Towers of Hanoi
// mystack.h

#include <iostream>
using namespace std;

class MyStack {
private:
   int *stackArray;    // Pointer to the stack array
   int stackSize;    // The stack size
   int numElem;		//index of the top element in the stack array

public:
   MyStack(){
      stackArray = new int[0];
      stackSize = 0;
      numElem = -1;
   }
   // Constructor
   MyStack(int size){
      //pass in an int: tells the maximum size of the stack
      stackArray = new int[size];
      stackSize = size;
      numElem = -1;
   }

   // Copy constructor
   MyStack(MyStack &obj){
      this->stackArray = obj.stackArray;
      this->stackSize = obj.stackSize;
      this->numElem = obj.numElem;
   }

   //operator= overloading
   MyStack& operator=(const MyStack &obj){
      //never used, no need to implement
   }

   // Destructor
   ~MyStack(){
      delete [] stackArray;
   }

   // Stack operations

   void push(int item){
      //add an item to the stack by passing in a value
      if (isFull())
         cout << "The stack is full." << endl;
      else
         stackArray[++numElem] = item;
   }

   int pop(){
      //pop a value out by returning the value
      if(isEmpty())
         cout << "The stack is empty." << endl;
      else
         return stackArray[numElem--];
   }

   int top(){
      //return the value at the top position in the stack
      return stackArray[numElem];
   }

   bool isFull() const{
      //tell if the statck is full
      if(numElem == stackSize - 1)
         return true;
      else
         return false;
   }

   bool isEmpty() const{
      //tell if the stack is empty
      if(numElem == -1)
         return true;
      else
         return false;
   }

   int size() const{
      //tell how many items are in the stack
      return stackSize;
   }
};


#endif
