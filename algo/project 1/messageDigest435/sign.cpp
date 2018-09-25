// Matt McDade 2849637
// Algorithms Project 1
// Part 2

// to sign:
// sign.exe s file.txt
// to verify:
// sign.exe v file.txt file.txt.signature

#include "BigIntegerLibrary.hh"
#include "sha256.h"
#include <fstream>
#include <iostream>
#include <string.h>

// Function to hash the char array and return the SHA256 hash
// in a BigUnsigned data type
BigUnsigned hashMemblock(char memblock[]) {
  // convert to string and hash using sha256
  std::string memblockString(memblock);
  std::string hashedFileContent = sha256(memblockString);

  // turn hashed string into BigUnsigned data type
  BigUnsignedInABase hashedFileContentNum =
      BigUnsignedInABase(hashedFileContent, 16);
  return BigUnsigned(hashedFileContentNum);
}

int main(int argc, char *argv[]) {
  if ((argv[1][0] != 's' && argv[1][0] != 'v') || argc > 4)
    std::cout << "wrong format! should be in format: \n"
                 "\"messageDigest435.exe s [filename]\" for signing or \n"
                 "\"messageDigest435.exe v [filename] [signature filename]\" "
                 "for verifying"
              << std::endl;
  else {

    // first argument after messageDigest435.exe is always file.txt
    std::string filename = argv[2];

    // Read the file
    std::streampos begin, end;
    std::ifstream infile(filename.c_str(), std::ios::binary);
    begin = infile.tellg();
    infile.seekg(0, std::ios::end);
    end = infile.tellg();
    std::streampos size = end - begin;
    // std::cout << "size of the file: " << size << " bytes.\n"; // size of the

    infile.seekg(0, std::ios::beg);
    char *memblock = new char[size];
    infile.read(memblock,
                size); // read file; it's saved in the char array memblock
    infile.close();

    // hash file.txt contents
    BigUnsigned hash = hashMemblock(memblock);
    std::cout << "Hashed contents from file.txt: " << hash << std::endl;

    if (argv[1][0] == 's') {
      std::cout << "Signing " << filename << "..." << std::endl;

      // load in d_n.txt
      std::ifstream d_nfile("d_n.txt");
      std::string dString, nString;
      while (d_nfile >> dString >> nString) {
      }
      d_nfile.close();
      BigUnsigned d = stringToBigUnsigned(dString);
      BigUnsigned n = stringToBigUnsigned(nString);
      std::cout << "d from d_n.txt: " << d << std::endl;
      std::cout << "n from d_n.txt: " << n << std::endl;

      // sign the hashed contents
      BigUnsigned signedContents = modexp(hash, d, n);
      std::cout << "Signed contents: " << signedContents << std::endl;

      // save contents to file.txt.signature
      std::ofstream outfile;
      outfile.open("file.txt.signature",
                   std::ofstream::out | std::ofstream::trunc);
      outfile << signedContents;
      outfile.close();

      std::cout << filename << " signed and saved to \"file.txt.signature\"!"
                << std::endl;

    } else {
      std::cout << "Verifying the signed file..." << std::endl;

      // read contents of signature file
      std::string signaturefilename = argv[3];
      std::ifstream sigfile(signaturefilename.c_str());
      std::string signatureString;
      while (sigfile >> signatureString) {
      }
      sigfile.close();
      BigUnsigned signature = stringToBigUnsigned(signatureString);
      std::cout << "Signature from file.txt.signature: " << signature
                << std::endl;

      // read contents of e_n.txt
      std::ifstream e_nfile("e_n.txt");
      std::string eString, nString;
      while (e_nfile >> eString >> nString) {
      }
      e_nfile.close();
      BigUnsigned e = stringToBigUnsigned(eString);
      BigUnsigned n = stringToBigUnsigned(nString);
      std::cout << "e from e_n.txt: " << e << std::endl;
      std::cout << "n from e_n.txt: " << n << std::endl;

      // "encrypt" signature gotten from file with e and n
      BigUnsigned encryptedSignature = modexp(signature, e, n);
      std::cout << "Encrypted signature: " << encryptedSignature << std::endl;

      // compare hash with encrypted signatureString
      if (encryptedSignature == hash)
        std::cout << "Verification passed! file.txt is unchanged after signing"
                  << std::endl;
      else
        std::cout << "Verification failed! file.txt was changed after signing"
                  << std::endl;
    }
    delete[] memblock;
  }
  return 0;
}
