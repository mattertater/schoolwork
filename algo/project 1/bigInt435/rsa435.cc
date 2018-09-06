// You need to complete this program for a part of your first project.

// Standard libraries
#include <string>
#include <fstream>
#include <iostream>
#include <stdlib.h> 
#include <ctime>
#include <cmath>

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
			BigInteger a = BigInteger(rand());
			if (modexp(a, p - 1, p) != 1)
				break;
			else if (i == (iterations - 1))
				prime = true;
		}

	} while (!prime);

	return p;
}

int main(){
	srand(time(NULL));
	/* The library throws 'const char *' error messages when things go
	* wrong.  It's a good idea to catch them using a 'try' block like this
	* one.  Your C++ compiler might need a command-line option to compile
	* code that uses exceptions. */
	try {
		
		// Get current time
		std::clock_t start = std::clock();

		std::cout << "Finding 2 big prime numbers..." << std::endl;

		// Generate our big number objects
		BigUnsigned p = generateBigPrime();
		BigUnsigned q = generateBigPrime();

		// Get differnece between current and start time
		double duration = (std::clock() - start) / (double) CLOCKS_PER_SEC;


		std::cout << "Took " << duration <<" seconds to find two primes:" << std::endl;
		std::cout << "p: " << p << std::endl;
		std::cout << "q: " << q << std::endl;

		std::cout << "Outputting to file \"p_q.txt\"..." << std::endl;
		std::ofstream file;
		file.open("p_q.txt", std::ofstream::out | std::ofstream::trunc);
		file << p << "\n" << q;
		file.close();

		BigUnsigned n = p * q;

		std::cout << "n: " << n << std::endl;

	} catch(char const* err) {
		std::cout << "The library threw an exception:\n"
		<< err << std::endl;
	}

	return 0;
}

