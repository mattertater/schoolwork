#ifndef LABNAMESPACE_H_INCLUDED
#define LABNAMESPACE_H_INCLUDED


namespace myConstants
{
extern const int NUMLABS = 8;

extern const int NUMUNIVERSITIES = 8;

// Number of computers in each lab
extern const int LABSIZES[NUMLABS];

// Indicates a particular computer is free
extern const int COMPUTER_FREE;

// Name for each university lab
const std::string UNIVERSITYNAMES[NUMUNIVERSITIES] = {"The University of Michigan", "The University of Pittsburgh", "Stanford University", "Arizona State University", "North Texas State University", "The University of Alabama, Huntsville", "Princeton University", "Duquesne University"};
}

#endif // LABNAMESPACE_H_INCLUDED
