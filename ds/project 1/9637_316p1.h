#ifndef _STACK_H_
#define _STACK_H_

#include <iostream>

template <class T>
class Stack {
    public:
        Stack() {}
        ~Stack() {
            while ( !empty() ) {
                pop();
            }
            empty();
        }

        void push (const T& object);
        void pop();
        const T& top();
        bool empty();

    private:
        struct StackNode {              // linked list node
            T data;                     // data at this node
            StackNode *next;            // next node in list

            // StackNode constructor initializes both fields
            StackNode(const T& newData, StackNode *nextNode)
                : data(newData), next(nextNode) {}
        };

        // My Stack should not allow copy of entire stack
        Stack(const Stack& lhs) {}

        // My Stack should not allow assignment of one stack to another
        Stack& operator=(const Stack& rhs) {}
        StackNode *head;                 // top of stack

};

template <class T>
void Stack<T>::push(const T& obj) {
    head = new StackNode(obj, head);
}

template <class T>
void Stack<T>::pop() {
  if ( !empty() ) {
    StackNode *topNode = head;
    head = head->next;
    T data = topNode->data;
    delete topNode;
  }
  //return 0;
}

template <class T>
const T& Stack<T>::top() {
  return head->data;
}

template <class T>
bool Stack<T>::empty() {
  if (head == 0)
    return true;
  else
    return false;
}
#endif
