#ifndef NUMSTACK_HPP_INCLUDED
#define NUMSTACK_HPP_INCLUDED

template<class T>
class NumStack {
private:
   T *stackArray;  // Pointer to the stack array
   int stackSize;    // The stack size
   int top;          // Indicates the top of the stack

public:
   // Constructor
   NumStack(int size){
      stackArray = new int[size];
      stackSize = size;
      top = -1;
   }

   // Copy constructor
   NumStack(const NumStack &obj){
      // Create the stack array.
      if (obj.stackSize > 0)
         stackArray = new int[obj.stackSize];
      else
         stackArray = nullptr;

      // Copy the stackSize attribute.
      stackSize = obj.stackSize;

      // Copy the stack contents.
      for (int count = 0; count < stackSize; count++)
         stackArray[count] = obj.stackArray[count];

      // Set the top of the stack.
      top = obj.top;
   }

   // Destructor
   ~NumStack(){
      delete [] stackArray;

   }

   // Stack operations
   void push(T num){
      if (isFull())
         std::cout << "The stack is full.\n";
      else {
         top++;
         stackArray[top] = num;
      }
   }

   void pop(T &num){
      if (isEmpty())
         std::cout << "The stack is empty.\n";
      else {
         num = stackArray[top];
         top--;
      }
   }

   bool isFull() const{
      bool status;

      if (top == stackSize - 1)
         status = true;
      else
         status = false;

      return status;
   }

   bool isEmpty() const{
      bool status;

      if (top == -1)
         status = true;
      else
         status = false;

      return status;
   }
};

#endif // NUMSTACK_HPP_INCLUDED
