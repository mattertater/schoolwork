#ifndef COMPLEX_HPP
#define COMPLEX_HPP
#include <string>


class Complex
{

friend std::ostream& operator<<(std::ostream&, const Complex&);
friend std::istream& operator>>(std::istream&, Complex&);



public:
   Complex(double = 0.0, double = 0.0); // default constructor
   Complex operator+(const Complex&) const; // function add
   Complex operator-(const Complex&) const; // function subtract
   Complex operator*(const Complex&) const; // function multiply
   const Complex& operator=(const Complex&); // set complex number

   bool operator==(const Complex&)const;
   bool operator!=(const Complex& myCompNum) const;
private:
    double realPart;
    double imaginaryPart;

};

#endif
