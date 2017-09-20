// COPYRIGHT (C) 2017 Matt McDade (2849637) All rights reserved.
//
// rational.hpp: Definition of rational class and its interace.

#include "rational.hpp"

#include <iostream>

using namespace std;

// -------------------------------------------------------------------------- //
// Helper functions

Rational(){
    value=0;
}

// 2. A constructor that takes an integer value
Rational(int x){
    numerator = x;
    value = x;
}

// 3. A constructor that takes a pair of values
Rational(int x, int y){
    int gcd = gcd(x, y);

    x /= gcd;
    y /= gcd;

    // one if covers all negative y cases, if x is negative or not, they both need to be flipped either way.
    if (y < 0) {
        numerator = (-1 * x);
        denominator = (-1 * y);
    }
    else {
        numerator = x;
        denominator = y;
    }
}


// Compute the GCD (greatest common denominator) of two integer values using Euclid's algorithm.
int gcd(int a, int b) {
  a = abs(a);   //make them to be positive numbers
  b = abs(b);
  if(a==0 || b==0){ //if one number is 0, always return 1
    return 1;
  }
  while (b != 0) {
    int t = b;
    b = a % b;
    a = t;
  }
  return a;
}

//simplifies fraction
Rational simplified(Rational a){
    int gcd = gcd(a.numerator, a.denominator);
    Rational result = a;
    result.numerator /= gcd;
    result.denominator /= gcd;
    return result;
}

// Compute the LCM (Least Common Multiple) of two integer values.
int lcm(int a, int b) {
  a = abs(a); //make them positive
  b = abs(b);
  if(a == 0 || b == 0){
    throw "Integers can not be zero in calculating Least Common Multiple";
  }
  return (abs(a) / gcd(a, b)) * abs(b);
}

// -------------------------------------------------------------------------- //
// Rational implementation
// -------------------------------------------------------------------------- //

//Compares 2 rational numbers to see if they're equal
bool operator==(const Rational& a){
    Rational newA = simplify(a);
    Rational newB = simplify(this);
    if(newA.numerator == newB.numerator && newA.denominator == newB.denominator)
        return true;
    return false;
}

//Multiplication overloading with 2 rationals
Rational operator*(const Rational& a){
    Rational result = a;
    result.numerator *= b.numerator;
    result.denominator *= b.denominator;
    return simplify(result);
}
//Multiplication overloading with 1 rational and 1 int
Rational operator*(const int& b){
    Rational result = this;
    result.numerator *= b;
    return simplify(result);
}

//Division overloading with 2 rationals
Rational operator/(const Rational& a){
    Rational result = a;
    result.numerator *= this->denominator;
    result.denominator *= this->numerator;
    return simplify(result);
}
//Division overloading with 1 rational and 1 int
Rational operator/(int b) {
    Rational result = this;
    result.denominator *= b;
    return simplify(result);
}


//Addition overloading with 2 rationals
Rational operator+(Rational a){
    Rational result = a;
    int lcm = lcm(result.denominator, this.denominator);
    result.numerator *= lcm;
    result.denominator *= lcm;
    this->numerator *= lcm;
    this->denominator *= lcm;
    result.numerator += this->numerator;
    return simplify(result);
}
Rational operator+(Rational a){
    Rational newB(this);
    Rational result = a;
    newB.numerator *= a.denominator;
    a.numerator += newB.numerator;
    return simplify(result);
}
//Subtraction overloading with 2 rationals
Rational operator-(Rational a){
    Rational result = a;
    int lcm = lcm(result.denominator, this->denominator);
    result.numerator *= lcm;
    result.denominator *= lcm;
    this->numerator *= lcm;
    this->denominator *= lcm;
    result.numerator -= this->numerator;
    return simplify(result);
}
//Subtraction overloading with 1 rational and 1 int
Rational operator-(const int& b){
    Rational newB(b);
    Rational result = this;
    newB.numerator *= result.denominator;
    result.numerator -= newB.numerator;
    return simplify(result);
}

//DO NOT CHANGE operators << and >> overloading functions
ostream& operator<<(ostream& os, Rational r) {
  return os << r.num() << '/' << r.den();
}

istream& operator>>(istream& is, Rational& r) {
  // Read the first integer, return on error.
  int p;
  is >> p;
  if (!is)
    return is;

  // Check for the divider. Assuming no spaces.
  if (is.peek() != '/') {
    r = Rational(p);
    return is;
  }
  is.get();

  int q;
  is >> q;
  if (!is)
    return is;
  if (q == 0) {
    is.setstate(ios::failbit);
    return is;
  }
  r = Rational(p, q);
  return is;
#if 0
  int p, q;
  char c;
  is >> p >> c >> q;
  if (!is)
    return is;
  // Require that the divider to be a '/'.
  if (c != '/') {
    is.setstate(ios::failbit);
    return is;
  }

  // Make sure that we didn't read p/0.

  r = Rational(p, q);
  return is;
#endif
}






