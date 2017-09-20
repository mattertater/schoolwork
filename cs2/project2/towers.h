#ifndef TOWERS_H
#define TOWERS_H

#include "mystack.h"

//********************************//
//prototype of class tower        //
//put all functions to towers.cpp //
//DO NOT MODIFY THIS FILE         //
//********************************//

class Towers {
	private:
		MyStack *peg1; //start stack
		MyStack *peg2; //tmp stack
		MyStack *peg3; //destination stack
	   int numDisk;	     //number of discs to move
public:
	   //constructor, passing in an int to tell how many discs to move
		Towers(int);
		
		//destructor
		~Towers();
		
		//copy constructor
		Towers(const Towers &);

	   //operator= overloading
	   Towers& operator=(const Towers &);
	   
	   //start function, DO NOT MODIFY
		void start() {
			move(numDisk, peg1, peg2, peg3); 
		}
		
	private:
		void setDisks();	//initialize start-tower by putting discs in, then print out the status of three towers after initialized
		void plotPegs();	//print out the status of three towers
		void move(int n, MyStack* s, MyStack* t, MyStack* d);  //move n discs from tower s to tower d by using a temporary tower t
		void moveOne(MyStack* s, MyStack* d);  //move one discs from tower s to tower d
};
#endif
