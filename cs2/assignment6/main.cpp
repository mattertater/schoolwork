// This program demonstrates the MathStack class.
#include <iostream>
#include "Stack.hpp"

using namespace std;

int main() {
   int catchVar;  // To hold values popped off the stack

   // Create a MathStack object.
   Stack <int>stack(5);

   // Push 3 and 6 onto the stack.
   cout << "Pushing 3\n";
   stack.push(3);
   cout << "Pushing 6\n";
   stack.push(6);

   // Add the two values.
   stack.add();

   // Pop the sum off the stack and display it.
   cout << "The sum is ";
   stack.pop(catchVar);
   cout << catchVar << endl << endl;



   // Push 7 and 10 onto the stack
   cout << "Pushing 7\n";
   stack.push(7);
   cout << "Pushing 10\n";
   stack.push(10);

   // Subtract 7 from 10.
   stack.sub();

   // Pop the difference off the stack and display it.
   cout << "The difference is ";
   stack.pop(catchVar);
   cout << catchVar << endl << endl;



   // Push 7 and 10 onto the stack
   cout << "Pushing 7\n";
   stack.push(7);
   cout << "Pushing 10\n";
   stack.push(10);

   // Multiply 7 by 10.
   stack.mult();

   // Pop the product off the stack and display it.
   cout << "The product is ";
   stack.pop(catchVar);
   cout << catchVar << endl << endl;



   // Push 3 and 6 onto the stack.
   cout << "Pushing 6\n";
   stack.push(6);
   cout << "Pushing 3\n";
   stack.push(3);

   // Divide the two values.
   stack.div();

   // Pop the quotient off the stack and display it.
   cout << "The quotient is ";
   stack.pop(catchVar);
   cout << catchVar << endl << endl;



   // Push 3, 6, 7, and 10 to the stack
   cout << "Pushing 3\n";
   stack.push(3);
   cout << "Pushing 6\n";
   stack.push(6);
   cout << "Pushing 7\n";
   stack.push(7);
   cout << "Pushing 10\n";
   stack.push(10);

   // Demonstrate addAll function
   stack.addAll();

   // Pop the sum off the stack and display it
   cout << "The sum of all values in the stack is ";
   stack.pop(catchVar);
   cout << catchVar << endl << endl;



   // Push 3, 6, 7, and 10 to the stack
   cout << "Pushing 3\n";
   stack.push(3);
   cout << "Pushing 6\n";
   stack.push(6);
   cout << "Pushing 7\n";
   stack.push(7);
   cout << "Pushing 10\n";
   stack.push(10);

   // Demonstrate multAll function
   stack.multAll();

   // Pop the product off the stack and display it
   cout << "The product of all values in the stack is ";
   stack.pop(catchVar);
   cout << catchVar << endl;

   return 0;
}
