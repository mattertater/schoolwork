/*
   COPYRIGHT (C) 2017 Student Name (abt25) All rights reserved.
   CSII Project Assignment Part C: My Computer Lab
   Author.  Anthony Tung
            abt25@zips.uakron.edu
   Version. 1.01 10.01.2017
   Purpose: This assignment makes sure that I know how to write a program that declare and use classes and objects, and extends
   the practice into the use of arrays of objects.
*/

#include <iostream>
#include <iomanip>  //allows the use of setfill
#include <cstring>
#include <string>   //function allows me to string university name and name
#include <cstdlib>
#include <ctime>    //allows the use of srand
#include <limits>   //allows the use of cin.ignore
#include "labnamespace.h"

using namespace myConstants;

class LabClass
{
public:
    //Prototypes
    LabClass()
    {head = nullptr;}

    ~LabClass();

    void appendNode(char);
    void insertNode(int, int, std::string);
    void deleteNode(int);
    void displayList() const;

    void login_menu(int labs);
    void logout_menu(int labs);
    void search_user(int labs);
    void display_a_lab(int labs);
    void createLabsArray();
    int getComputerChoice();
    int getUserId();

private:

    int labs;
    int minute;
    char name;
    struct ListNode
    {
        LabClass * data;
        ListNode * next;
    };
    ListNode *head;


};



//Precondition: initializes computerChoice which is used for generating a random 5 digit user id
//Postcondition: generates a 5 digit user id
int LabClass::getComputerChoice()
{
    int computerChoice;

    srand(time (0));
    computerChoice = (1 + (rand() % (99999)));
    //computerChoice = (rand() % 99999) + 1;
    std::cout << "\nUser id: " << std::setfill('0') << std::setw(5) << computerChoice << std::endl;

    return computerChoice;
}


void LabClass::createLabsArray()
{

}

//Precondition: function takes in userId when you use the logout and search functions
//Postcondition: Asks user to enter an 5 digit id and takes in the 5 digit also checks if user input 5 digits and if the user typed in letters
int LabClass::getUserId()
{
    do
    {
        std::cout << "Enter the 5 digit ID number of the user logging in: ";

        int userId;
        std::cin >> userId;

        if(userId >= 00001 && userId <= 99999)
        return userId;
        std::cin.clear();
        std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n'); // makes sure no letters are entered
        std::cout << std::endl;
        std::cout << "Invalid ID number" << std::endl;

    } while(true);
}

//Precondition: initializes labId and takes in labId and checks if user is logged into labs 1-8
//Postcondition: Ask users to enter lab number and displays full labs if they are full
int getLabId()
{
    do
    {
        std::cout << "Enter the lab number the user is logging in from (1 - " << NUMLABS << "): ";

        int labId;
        std::cin >> labId;

        if(labId >= 1 && labId <= NUMLABS)
        return labId;
        std::cin.clear();
        std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
        std::cout << std::endl;

    } while(true);

}

//Precondition: initializes lab size, takes in the station number the user enters and also validates input so user does not input in letters
//Postcondition: Displays a message asking the user to type in a station number they wish to log into, if they enter something invalid they will get an error message
int getComputerId(int labId)
{
    do
    {
        int labSize = LABSIZES[labId];
        std::cout << "Enter computer station number the user is logging in to (1 - " << labSize << "): ";   //allows the user to enter in a computer station

        int computerId;
        std::cin >> computerId;
        if(computerId >= 1 && computerId <= labSize)
        return computerId;
        std::cin.clear();
        std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');     //makes sure the user cannot enter in letters
        std::cout << std::endl;

        std::cout << "Invalid computer station number" << std::endl;    //message would show if user entered invalid station number
    } while(true);
}

//Precondition: sets the size of the lines for the menu and declare how long the menu should be
//Postcondition: outputs the menu and allows the user to choose an option 1-5
int showMenu()
{
    const int MAX_SIZE = 75;

    std::cout << std::string(MAX_SIZE, '-') << std::endl;
    std::cout << std::setfill(' ') << std::setw(MAX_SIZE - 24) << "Anthony Tung Incorporated" << std::endl;
    std::cout << std::setw(MAX_SIZE - 28) << "Computer Lab System" << std::endl;
    std::cout << std::string(MAX_SIZE, '-') << std::endl;
    std::cout << std::setw(MAX_SIZE - 35) << "Main Menu" << std::endl;
    std::cout << std::setw(MAX_SIZE - 30) << "1) Simulate Login" << std::endl;
    std::cout << std::setw(MAX_SIZE - 29) << "2) Simulate Logoff" << std::endl;
    std::cout << std::setw(MAX_SIZE - 38) << "3) Search" << std::endl;
    std::cout << std::setw(MAX_SIZE - 31) << "4) Display a lab" << std::endl;
    std::cout << std::setw(MAX_SIZE - 40) << "5) Quit" << std::endl;
    std::cout << std::string(MAX_SIZE, '-') << std::endl;
    std::cout << std::setw(MAX_SIZE - 34) << "Your Choice: ";

    int choice;
    std::cin >> choice; // takes in the users choice of 1-5 from the menu
    std::cin.clear();
    std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n'); // makes sure the user cannot use letters to break my program
    std::cout << std::endl;

    return choice;
}

//Precondition: sets login to 1, logoff to 2, search to 3, display to 4, and quit to 5
//Postcondition: Lets the user choose an option 1-5 based on what you want to do and continue to do what you want to do
enum MenuChoice
{
    CHOICE_LOGIN = 1,   // choice 1 to Login
    CHOICE_LOGOFF = 2,  // choice 2 to Logout
    CHOICE_SEARCH = 3,  // choice 3 to Search
    CHOICE_DISPLAY = 4, // choice 4 to Display a lab
    CHOICE_QUIT = 5     // choice 5 to quit/exit the program
};

//Precondition: creates a case for each choice based on the choice provided from above and initializes the class
//Postcondition: displays the initial statement and also validates user choices
int main()
{
    LabClass start;
    int labs = createLabsArray();
    const int MAX_SIZE = 60;
    bool quit = false;

    std::cout << std::setw(6) << "    Welcome- here is our list of available labs" << std::endl;    //welcome page for the university labs

    for(int counter = 0; counter < NUMUNIVERSITIES; counter++)
        std::cout << "lab # " << counter + 1 << " for " << UNIVERSITYNAMES[counter] << std::endl;   //displays all the university and there lab number

    /*
    {

    namespace myConstants
    myConstants();
    }

    void myConstants(char arr[])
{
        int i = 0;
        for(i=0;i<SIZE;i++) // display array up to size
        {
                std::cout<<arr[i]<<" ";
        }

    */

    do
    {
        int choice = showMenu();
        // Creates the menu that will printed
        switch(choice)
        {
            case CHOICE_LOGIN:
                start.login_menu(labs);
                break;
            case CHOICE_LOGOFF:
                start.logout_menu(labs);
                break;
            case CHOICE_SEARCH:
                start.search_user(labs);
                break;
            case CHOICE_DISPLAY:
                start.display_a_lab(labs);
                break;
            case CHOICE_QUIT:
                quit = true;
                break;

            default:
                std::cout << std::setw(MAX_SIZE - 10) << "Invalid Choice: 1 - 5 ONLY!" << std::endl;
                break;
        }

    } while(!quit);

    return 0;
}

//Precondition: initializes labs and set set the labSize to LABSIZES array and allow the program to detect empty
//Postcondition: creates the array for computer stations, allows the program to display and check if computer is emepty
void LabClass::createLabsArray(int)
{
    LabClass labs = new LabClass*[NUMLABS];

    for(int lab = 0; lab < NUMLABS; ++lab)
    {
        LabClass[computer] = COMPUTER_FREE;
    }

}

void LabClass::login_menu(int labs)
{
    std::string name = "";
    minute = 0;
    int computerChoice;

    int labId = getLabId() - 1;
    int computerId = getComputerId(labId) - 1;
    int userId = getComputerChoice();

    do
    {
        std::cout << "Please enter the name of this user:" << std::endl;    //displays a screen asking user to type in a name
        std::cin >> name;   // takes in the name of the user and the while statement below determines the maximum length
        std::cin.clear();
        std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');

    } while(name == "" || name.length() > 36);


    do
    {
        std::cout << "Please enter the minutes for the work station (15/30/45/60):" << std::endl;   //displays a screen asking user to enter minutes
        std::cin >> minute; // takes in how much minute based on what is allowed in the while statement below
        std::cin.clear();
        std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n'); //makes sure letters cannot break my code
        std::cout << std::endl;
    } while(minute != 15 && minute != 30 && minute != 45 && minute != 60);  // These are the limits the minutes user can choose from


    if(labs[labId][computerId] != COMPUTER_FREE)       // if another person is logged in they cannot login
    {
        std::cout << "Computer station is already full" << std::endl;   //displays the error message if station is full
        return;
    }


    labs[labId][computerId] = userId;
    std::cout << "Now logged in" << std::endl;
}


  // current date/time based on current system
  //time_t now = time(0);
  // convert now to c-string form
  //char* timeOf = ctime(&now);
  // we want a way to limit the size to be just 20 in length
  //timeIn[20] = '\0'; // this effectively truncates the c-string




//Precondition: set the userId to getUserId and labId to getLabId()-1 and validates if the user is logged in or not
//Postcondition: user is logged out of a computer after the userId, lab, and computer station is entered
void LabClass::logout_menu(int** labs)
{
    int userId = getUserId();
    int labId = getLabId() - 1;
    int computerId = getComputerId(labId) - 1;

    if(labs[labId][computerId] != userId)
    {
        std::cout << "User " << userId << " is not currently logged on, cannot log off!" << std::endl;  //displays this if user is not logged in
        return;
    }

    labs[labId][computerId] = COMPUTER_FREE;
    std::cout << "Now logged out" << std::endl; //logs off user
}

//Precondition: labs has been initialized, uses boolean logic to determine if user is in a lab or not in a lab
//Postcondition: finds the location of the ID number entered and checks to see if the user is using a computer
void LabClass::search_user(int** labs)
{
    bool found = false;
    int userId = getUserId();

    for(int lab = 0; lab < NUMLABS; ++lab)
    {
        int labSize = LABSIZES[lab];
        for(int computer = 0; computer < labSize; ++computer)
        {
            if(labs[lab][computer] == userId)
            {
                std::cout << "User " << userId << " is in lab " << lab + 1 << " at computer " << computer + 1 <<" for " << minute << " minutes" << std::endl; //takes in the ID, computer there at and the minutes
                found = true;
            }
        }
    }

    if(!found)
        std::cout << "User " << userId << " was not found!" << std::endl;
}

//Precondition: checks to see if a user is logged into a lab, displays empty if the labs are empty
//Postcondition: displays the lab status and the lab number and what university lab it is and also displays the station and if they are empty or not
void LabClass::display_a_lab(int** labs)
{
    int labId = getLabId() - 1;

    std::cout << "LAB STATUS" << std::endl;     // display the status of the lab
    std::cout << "Lab #     " << labId + 1 << " for " << UNIVERSITYNAMES[labId] << std::endl;   // displays the lab number and the university lab belongs to
    std::cout << "Computer Stations" << std::endl;  //displays the stations whether they are empty or taken

    int labSizes = LABSIZES[labId];
    for(int computer = 0; computer < labSizes; ++computer)
    {
        if(computer % 5 == 0 && computer != 0)
            std::cout << std::endl;

        std::cout << std::setw(5) << computer + 1 << ": ";
        double userId = labs[labId][computer];

        if(userId == COMPUTER_FREE)                 // Checks for empty and this allows you to see if a lab is empty
            std::cout << std::setw(6) << "empty";
        else
            std::cout << std::setw(6) << userId;
    }
}

void LabClass::displayList() const
{
   ListNode *nodePtr;  // To move through the list

   // Position nodePtr at the head of the list.
   nodePtr = head;
   short count = 0;

   // While nodePtr points to a node, traverse the list.
   while (nodePtr)
   {
      // Display the value in this node.
      std::cout << "[" << nodePtr->value << "] -> ";
      ++count;
      // Move to the next node.
      nodePtr = nodePtr->next;
      if (count % 10 == 0) {
        std::cout << std::endl;
        count = 0;
      }
   }
   std::cout << std::endl;
}

void LabClass::appendNode(char character)
{

    ListNode *newNode;
    ListNode *nodePtr;

    newNode = new ListNode;
    newNode->value = character;
    newNode->next = nullptr;

    if(!head)
    {
        head = newNode;
    }
    else
    {
        nodePtr = head;

        while(nodePtr->next)
        {
            nodePtr = nodePtr-> next;
        }

        nodePtr->next = newNode;
    }
}

//Precondition: points ListNode to newNode, nodePtr, and previousNode, function also takes in a char variable
//Postcondition: This function inserts a node with the char parameter�s value copied to its char member element. This function also insert the values in descending order.
void LabClass::insertNode(int getUserId, int minute, char name)
{
    ListNode *newNode;
    ListNode *nodePtr;
    ListNode *previousNode = nullptr;

    newNode = new ListNode;
    newNode->getUserId = getUserId;
    newNode->time = time;
    newNode->name = name;

    if(!head)
    {
        head = newNode;
        newNode->next = nullptr;
    }
    else
    {
        nodePtr = head;
        previousNode = nullptr;

        while(nodePtr != nullptr && nodePtr->error >)
        {
            previousNode = nodePtr;
            nodePtr = nodePtr->next;
        }

        if(previousNode == nullptr)
        {
            head = newNode;
            newNode->next = nodePtr;
        }
        else
        {
            previousNode->next = newNode;
            newNode->next = nodePtr;
        }
    }
}

//Precondition: points ListNode to nodePtr and to previousNode, function also takes in a char value
//Postcondition: This function searches for a node with char parameter�s value as the element to find, if the node is found, it is deleted from the list and from memory.
void LabClass::deleteNode(int Logout)
{

    ListNode *nodePtr;
    ListNode *previousNode;

    if(!head)
    {
        return;
    }

    if(head->value == Logout)
    {
        nodePtr = head->next;
        delete head;
        head = nodePtr;
    }
    else
    {
        nodePtr = head;

        while((nodePtr != nullptr) && (nodePtr->getUserId != Logoff))
        {
            previousNode = nodePtr;
            nodePtr = nodePtr->next;
        }

        if(nodePtr)
        {
            previousNode->next = nodePtr->next;
            delete nodePtr;
        }
    }
}
