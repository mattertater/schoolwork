// Matt McDade 2849637
// Algorithms Project 1
// Part 1

// Added "-std=c++11" to makefile command
//        to get tuples to work

#include <cmath>
#include <ctime>
#include <fstream>
#include <iostream>
#include <stdlib.h>
#include <string>
#include <tuple>

// 'BigIntegerLibrary.hh' includes all of the library headers.
#include "BigIntegerLibrary.hh"

BigUnsigned generateBigPrime() {

  int iterations = 3;
  bool prime = false;
  BigUnsigned p;

  do {
    p = BigUnsigned(1);

    // 155 iterations is enough to generate a number thats around 525 bits
    for (int i = 0; i < 155; i++) {
      p = p * 10 + rand();
    }

    // See if it passes 3 iterations of the Fermat test
    for (int i = 0; i < iterations; i++) {
      // pick randomm a between 2 and 12
      int a = (rand() % 10) + 5;
      if (modexp(a, p - 1, p) != 1)
        break;
      else if (i == (iterations - 1))
        prime = true;
    }

  } while (!prime);

  return p;
}

// Extended Euclidean Algorithm
// a is the BigUnsigned number, b is the found gcd
// We care about D and Y that it returns
std::tuple<BigInteger, BigInteger, BigInteger> eea(BigUnsigned a,
                                                   BigUnsigned b) {
  if (b == 0)
    return std::make_tuple(BigInteger(a), BigInteger(1), BigInteger(0));
  auto temp = eea(b, a % b);
  auto newD = std::get<0>(temp);
  auto newX = std::get<2>(temp);
  auto newY = std::get<1>(temp) - (BigInteger(a / b) * newX);
  return std::make_tuple(newD, newX, newY);
}

int main() {
  srand(time(NULL));
  try {
    // Get current time
    std::clock_t start = std::clock();

    std::cout << "Finding 2 big prime numbers (1-3 minutes)..." << std::endl;

    // Generate our big number objects
    BigUnsigned p = generateBigPrime();
    BigUnsigned q = generateBigPrime();

    // Get differnece between current and start time
    double duration = (std::clock() - start) / (double)CLOCKS_PER_SEC;

    std::cout << "Took " << duration
              << " seconds to find two primes:" << std::endl;
    std::cout << "p: " << p << std::endl;
    std::cout << "q: " << q << std::endl;

    // Output p and q to text file
    std::cout << "Outputting to file \"p_q.txt\"..." << std::endl;
    std::ofstream file;
    file.open("p_q.txt", std::ofstream::out | std::ofstream::trunc);
    file << p << "\n" << q;
    file.close();

    BigUnsigned n = p * q;
    std::cout << "n: " << n << std::endl;
    BigUnsigned phi = (p - 1) * (q - 1);
    std::cout << "phi(n): " << phi << std::endl;

    // Find e and d
    BigUnsigned e = BigUnsigned(1);
    BigInteger gcd;
    std::tuple<BigInteger, BigInteger, BigInteger> eeaOut;

    start = std::clock();

    do {
      e += 2;
      eeaOut = eea(phi, e);
      gcd = std::get<0>(eeaOut);
    } while (gcd != 1);

    BigInteger d = std::get<2>(eeaOut);
    if (d < 0) {
      d += phi;
    }

    duration = (std::clock() - start) / (double)CLOCKS_PER_SEC;
    std::cout << "Took " << duration
              << " seconds to find e and d:" << std::endl;
    std::cout << "e: " << e << std::endl;
    std::cout << "d: " << d << std::endl;

    // Output to 2 more text files
    std::cout << "Outputting to file \"e_n.txt\"..." << std::endl;
    file.open("e_n.txt", std::ofstream::out | std::ofstream::trunc);
    file << e << "\n" << n;
    file.close();
    std::cout << "Outputting to file \"d_n.txt\"..." << std::endl;
    file.open("d_n.txt", std::ofstream::out | std::ofstream::trunc);
    file << d << "\n" << n;
    file.close();

    std::cout << "Done!" << std::endl;

  } catch (char const *err) {
    std::cout << "The library threw an exception:\n" << err << std::endl;
  }

  return 0;
}