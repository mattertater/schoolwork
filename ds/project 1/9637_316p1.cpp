// Matt McDade
// Data Structures Project 1
// 9/30/2017
// infix -> postfix -> solution

// imports
#include <stdexcept>
#include <cctype>
#include <sstream>
#include <iostream>
#include <string>
#include "9637_316p1.h"

using namespace std;

// Takes in char, and returns true if it's an operator
bool isOperator(char currentChar) {
  switch (currentChar) {
  case '+':
  case '-':
  case '*':
  case '/':
    return true;
  default:
    return false;
  }
}

bool isNumber(char currentChar){
  switch (currentChar) {
    case '1':
    case '2':
    case '3':
    case '4':
    case '5':
    case '6':
    case '7':
    case '8':
    case '9':
    case '0':
      return true;
    default:
      return false;
  }
}

// simple PEMDAS stuff
bool precedence(char leftOperator, char rightOperator)
{
  if      ( leftOperator  == '*' ||
            leftOperator  == '/' )  { return true;  }
  else if ( rightOperator == '*' ||
            rightOperator == '/' )  { return false; }
  return true;
}

int performOperation(char operation, int operand1, int operand2)
{
	if     (operation == '+') return (operand1 + operand2);
	else if(operation == '-') return (operand1 - operand2);
	else if(operation == '*') return (operand1 * operand2);
	else if(operation == '/') return (operand1 / operand2);
	else return -1;
}
#include <stack>
int solvePostfix(string postfix){
	stack<int> S;
	for(int i = 0; i< postfix.length(); i++) {

		// skipping spaces
		if(postfix[i] == ' ') continue;

    // if number, push to stack
		else if(isNumber(postfix[i]))
      S.push(postfix[i]-'0');

		// if operator, push two numbers and push back operation result
		else if(isOperator(postfix[i])) {
			int operand2 = S.top(); S.pop();
			int operand1 = S.top(); S.pop();
			int result = performOperation(postfix[i], operand1, operand2);
			//Push back result of operation on stack.
			S.push(result);
		}
	}
	// only element should be solution
	return S.top();
}

string convertToPostfix(const string& infix){

  // return string
  stringstream postfix;
  stack<char> stack;
  stack.push('(');

  for(size_t i = 0, l = infix.size(); i < l; ++i) {
    const char current = infix[i];

    // If it's a digit, add it to the output
    if(isalnum(current))
      postfix << current;

    else if('(' == current)
      stack.push(current);

    else if(isOperator(current)) {
      char rightOperator = current;
      while(!stack.empty() && isOperator(stack.top()) && precedence(stack.top(), rightOperator)) {
        postfix << ' ' << stack.top();
        stack.pop();
      }
      postfix << ' ';
      stack.push(rightOperator);
    }

    else if(')' == current) {
      // While top of stack is not a left parens
      while(!stack.empty() && '(' != stack.top()) {
        postfix << ' ' << stack.top();
        stack.pop();
      }
      // Discard the left paren
      stack.pop();
      postfix << ' ';
    }
  }


  // Started with a left paren, now close it:
  // While top of stack is not a left paren
  while(!stack.empty() && '(' != stack.top()) {
      postfix << ' ' << stack.top();
      stack.pop();
  }
  // Discard the left paren
  stack.pop();


  return postfix.str();
}


int main()
{
  //infinite loop
  for (;;) {
    string response, infix, postfix;

    cout << "(1) Convert Infix to Postfix" << endl;
    cout << "(2) Evaluate Postfix postfix" << endl;
    cout << "(3) Exit" << endl;
    getline(cin, response);

    if (response == "1"){
      cout << "Enter an Infix Expression: ";
      string infix;
      getline(cin, infix);
      cout << "Postfix: '" << convertToPostfix(infix) << "'" << endl << endl;
    }

    else if (response == "2"){
      cout << "Enter a Postfix expression: " << endl;
      getline(cin, postfix);
      cout << "Solution: " << solvePostfix(postfix) << "" << endl << endl;
    }

    else exit(0);
  }
  return 0;
}
