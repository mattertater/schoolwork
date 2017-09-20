#ifndef STACK_HPP
#define STACK_HPP
#include "NumStack.hpp"

template<class T>
class Stack : public NumStack<T> {
public:
   // Constructor
   Stack(int s) : NumStack<T>(s) {

   }

   // MathStack operations
   void add(){
      int num, sum;

      // Pop the first two values off the stack.
      this->pop(sum);
      this->pop(num);

      // Add the two values, store in sum.
      sum += num;

      // Push sum back onto the stack.
      this->push(sum);
   }
   void sub(){
      int num, diff;

      // Pop the first two values off the stack.
      this->pop(diff);
      this->pop(num);

      // Subtract num from diff.
      diff -= num;

      // Push diff back onto the stack.
      this->push(diff);
   }
   void mult(){
      int one, two;

      this->pop(one);
      this->pop(two);

      one *= two;

      this->push(one);
   }
   void div(){
      int divisor, dividend;

      this->pop(divisor);
      this->pop(dividend);

      dividend /= divisor;

      this->push(dividend);
   }
   void addAll(){
      T one, sum = 0;
      while(!this->isEmpty()){
         this->pop(one);
         sum+=one;
      }
      this->push(sum);
   }
   void multAll(){
      T one, product = 1;
      while(!this->isEmpty()){
         this->pop(one);
         product*=one;
      }
      this->push(product);
   }

};

#endif // STACK_HPP_INCLUDED
