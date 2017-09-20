// COPYRIGHT (C) 2017 Matt McDade (2849637) All rights reserved.
//
// rational.hpp: Definition of rational class and its interace.

#ifndef RATIONAL_HPP
#define RATIONAL_HPP

#include <cstdlib>
#include <iosfwd>
#include <iostream>
// 1. Comparing two rational numbers for equality:
// Mathematical helper functions.
//
// NOTE: These are defined in rational.cpp.


#include <stdlib.h>

using namespace std;

// Represents a rational number. The rational numbers are the set of
// numbers that can be represented as the quotient of two integers.
class Rational
{
    int gcd(int, int);
    int lcm(int, int);


    int numerator, denominator;
    double value;

  // 1. A default constructor


    public:

    Rational();
    Rational(int);
    Rational(int, int);
    bool operator==(const Rational&);
    Rational operator+(const Rational&);
    Rational operator+(const int&);
    Rational operator-(const Rational&);
    Rational operator-(const int&);
    Rational operator*(const Rational&);
    Rational operator*(const int&);
    Rational operator/(const Rational&);
    Rational operator/(const int&);

      // Returns the numerator.
      int num() const {
          return numerator;
      }

      // Returns the denominator
      int den() const {
          return denominator;
      }
};

// TODO: Implement support for
//    - r1 == t2
//    - r1 != r2
// 2. Ordering rational numbers
//    - r1 < r2
//    - r1 > r2
//    - r1 <= r2
//    - r1 >= r2
// 3. The standard arithmetic operators
//    - r1 + r2
//    - r1 - r2
//    - r1 * r2
//    - r1 / r2

// These are provided for you.
//
// NOTE: They are defined in rational.cpp.
ostream& operator<< (ostream&, Rational);
istream& operator>> (istream&, Rational&);

#endif
