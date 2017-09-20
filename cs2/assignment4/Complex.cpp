// Member-function definitions for class Complex.
#include <iostream>
#include <sstream> // for ostringstream class
#include "Complex.hpp"


// the default constructor to set the imaginary ans real parts of the number
Complex::Complex(double real, double imaginary){
    realPart = real;
    imaginaryPart = imaginary;
}


//Overloaded the = operator
const Complex& Complex::operator=(const Complex& myNum){
    if (&myNum != this){
        realPart = myNum.realPart;
        imaginaryPart = myNum.imaginaryPart;
    }
    return *this;
}

//Overloading >>
std::istream& operator>>(std::istream& input, Complex& a){
    input >> a.realPart, a.imaginaryPart;
    return input;
}

//Overloading >>
std::ostream& operator<<(std::ostream& output, const Complex& a){
    output << a.realPart, a.imaginaryPart;
    return output;
}

//overloading ==
bool Complex::operator==(const Complex& comp) const{
    if((comp.realPart != realPart) || (comp.imaginaryPart != imaginaryPart))
        return false;
    return true;
}

//overloading !=
bool Complex::operator!=(const Complex& comp) const{
        return !(*this == comp);
}

//overloading +
Complex Complex::operator+(const Complex &right) const{
   return Complex(
      realPart + right.realPart, imaginaryPart + right.imaginaryPart);
}

//overloading -
Complex Complex::operator-(const Complex &right) const{
   return Complex(realPart - right.realPart, imaginaryPart - right.imaginaryPart);
}

//overloading *
Complex Complex::operator*(const Complex &right) const{
   return Complex((realPart * right.realPart) - (imaginaryPart * right.imaginaryPart),
                  (imaginaryPart * right.imaginaryPart) + (realPart * right.realPart));
}



