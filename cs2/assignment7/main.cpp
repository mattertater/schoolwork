#include <iostream>
#include <map>
#include <fstream>
#include <iomanip>
using namespace std;

int main() {
   int numberRatings, currentRating;

   string movieName;

   map<int, int> movies; //maps movie rating to total amount of specific movie ratings
   map<string, map<int, int> > reviews; //maps above map to movie name

   ifstream file;
   file.open("ratings.txt");
   file >> numberRatings;
   file.ignore();

   for (int i = 0; i < numberRatings; i++){
      getline(file,movieName);
      file >> currentRating;
      file.ignore();
      reviews[movieName][currentRating]++;
   }

   map<int, int>::iterator movieIterator;
   map<string, map<int, int> >::iterator ratingIterator;

   for (ratingIterator = reviews.begin(); ratingIterator != reviews.end(); ratingIterator++){

      int total=0, a=0;

      for (movieIterator = ratingIterator->second.begin(); movieIterator != ratingIterator->second.end(); movieIterator++){
         total += movieIterator->first;
         a++;
      }
      double avg=(double)total/a;
      cout << ratingIterator->first << ": " << a << " reviews, average of " << avg << " / 5\n" << endl;;
   }
}