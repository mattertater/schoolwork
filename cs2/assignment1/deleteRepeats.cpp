#include "deleteRepeats.hpp"
std::unique_ptr<char[]> deleteRepeats(char input[], int &count){

    std::sort(input, input+SIZE);
    std::unique_ptr<char[]> uniqueRepeats(new char[SIZE]);
    char temp;

    //since the input array is sorted, you only need to check the element before the current one.
    for(int i=0; i<SIZE; i++){
        if(input[i] != temp){
            uniqueRepeats[count] = input[i];
            count++;
        }
        temp = input[i];

    }
    return uniqueRepeats;
}

