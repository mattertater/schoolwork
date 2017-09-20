#include <iostream>
#include <cmath>
#include "towers.h"
#include "mystack.h"

//	Matt McDade 2849637
// mm263@zips.uakron.edu
// CS2 Project 2, Towers of Hanoi
//towers.cpp

using namespace std;

Towers::Towers(int numDisk){
	//constructor - takes numDisk equal to parameter
	this->numDisk = numDisk;
   peg1 = new MyStack(numDisk);
   peg2 = new MyStack(numDisk);
   peg3 = new MyStack(numDisk);
   setDisks();
}

Towers::~Towers() {
	//destructor implementation

   //never called, no need to implement
};lllol;olol;;ll;lolllooo;l;l;lollolpl;llo;l;oolpllollllol;l;l;llloll;pllo;olllololopllo;lllloo;ool

Towers::Towers(const Towers &obj) {
	//copy constructor
   this->numDisk = obj.numDisk;
   this->peg1 = obj.peg1;
   this->peg2 = obj.peg2;
   this->peg3 = obj.peg3;
   setDisks();
   //not used
}

Towers &Towers::operator=(const Towers &obj) {
	//operator= overloading

   //not used

	//this isn't right, please change.
	//return <#initializer#>;
}

void Towers::setDisks() {
	//initialize start-tower by putting discs in, then print out the status of three towers after initialized
   for(int i = this->numDisk; i > 0; i--)
      peg1->push(i);
   plotPegs();
}

void Towers::move(int n, MyStack *s, MyStack *t, MyStack *d) {
   int a, b;
   for (int i = 0; i < (pow(2, n)); i++) {

      int x = s->top();
      if (i % 2 == 0) {
         if (x == 1)
            d->push(s->pop());
         else if (x == 2)
            s->push(t->pop());
         else if (x == 3)
            t->push(d->pop());
      }
      else {
         if (x == 1) {
            a = t->pop();
            b = d->pop();
            if (a < b) {
               d->push(b);
               d->push(a);
            }
            else {
               t->push(a);
               t->push(b);
            }
         }
         else if (x == 2) {
            a = s->pop();
            b = d->pop();
            if (a < b) {
               d->push(b);
               d->push(a);
            }
            else {
               s->push(a);
               s->push(b);
            }
         }
         else if (x == 3) {
            a = s->pop();
            b = t->pop();
            if (a < b) {
               t->push(b);
               t->push(a);
            }
            else {
               s->push(a);
               s->push(b);
            }
         }
      }
      this->plotPegs();
   }
}

void Towers::moveOne(MyStack *s, MyStack *d) {
   //not used
}

//display disks on the three pegs in the console window (stdout)
//DO NOT MODIFY THIS FUNCTION
void Towers::plotPegs() {
	if (peg1==NULL || peg2==NULL || peg3==NULL) return;

	int n1=peg1->size();
	int n2=peg2->size();
	int n3=peg3->size();
	int numDisk = n1+n2+n3;

	MyStack tmp1(*peg1);
	MyStack tmp2(*peg2);
	MyStack tmp3(*peg3);

	//plot
	for (int i=0; i<numDisk/3; i++) {
		//peg1
		if (numDisk-n1-i>0) {
			for (int j=0; j<numDisk; j++)
				cout << " ";
		}
		else {
			int m1 = tmp1.top();
			tmp1.pop();
			for (int j=0; j<m1; j++)
				cout << "*";
			for (int j=m1; j<numDisk; j++)
				cout << " ";
		}
		cout <<" | ";

		//peg2
		if (numDisk-n2-i>0) {
			for (int j=0; j<numDisk; j++)
				cout << " ";
		}
		else {
			int m2 = tmp2.top();
			tmp2.pop();
			for (int j=0; j<m2; j++)
				cout << "*";
			for (int j=m2; j<numDisk; j++)
				cout << " ";
		}
		cout <<" | ";

		//peg3
		if (numDisk-n3-i>0) {
			for (int j=0; j<numDisk; j++)
				cout << " ";
		}
		else {
			int m3 = tmp3.top();
			tmp3.pop();
			for (int j=0; j<m3; j++)
				cout << "*";
			for (int j=m3; j<numDisk; j++)
				cout << " ";
		}
		cout<<endl;
	}
	cout << "_________________________________________\n";
}


