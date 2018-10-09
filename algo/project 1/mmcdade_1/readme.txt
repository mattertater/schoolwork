Matt McDade 2849637
Algorithms Project 1 README


Part 1 (rsa435.cc):
Since I used tuples in my implementation, I added "-std=c++11" to the makefile command to include the right standard libraries.

I included my Makefile in the part1 .zip if you didn't want to add that yourself.

"srand(time(NULL))" was added to the top of the main function to generate a different random seed every time and not end up with the same numbers. 

The two big chunks (finding the two big primes and the extended euclidean algorithm) are timed, with their durations being displayed in the output.

I made a "generateBigPrime()" function to clean up the main function when generating the 2 big primes, with 3 iterations of the fermat test built in to make sure the big number we generated is in fact prime. (this fermat test process takes the longest, 1-2 minutes on average)

I also made a function implementation of the extended euclidean algorithm in "eea()". This quickly performs the d, x, and y for the next steps. (always takes much less than 1 second)

e_n.txt and d_n.txt are created if they dont exist, their contents deleted if they do exist, and written to with the new e, d, and n values. 



Part 2 (sign.cpp):
remaned the working cpp and output exe file to "sign" per the instruction page "we should be able to run it using: “sign.exe s file.txt” "

I have included the Makefile again with these changes if you don't want to edit the one you have. 

I made a "hashMemblock()" function that SHA256 hashes the char[] parameter, and returns the base 10 BigUnsigned equivalent for easier use down the line. 

The main function checks for either an 's' or 'v' as the second argument when running the program, and makes sure there are no more than 4 arguments passed total. If either condition is not met, it reminds you the proper format to run the program.

It first hashes the file, which always needs done whether you're signing or verifying, and outputs the resulting base 10 hash.

The processes in signing and verifying are self explanatory, and all important calculated and read values are output for transparency. Signing and verifying both work great and as expected.

Thanks!