/*
	COPYRIGHT (C) 2016 Matt McDade (mm263) All rights reserved.
	CSII assignment 5 A
	Author.  Matt McDade
				mm263@zips.uakron.edu
	Version. 1.01 09.09.2017

*/

#ifndef ASSIGNMENT5_CHARLIST_H
#define ASSIGNMENT5_CHARLIST_H

using namespace std;

class CharList {
private:
    struct DataNode {
        char value;
        DataNode *nextElementAddress;
    };
    DataNode *firstElementAddress;
public:
    CharList() {
        firstElementAddress = nullptr;
    }

    ~CharList() {
        DataNode *nodePtr;
        DataNode *nextNode;

        nodePtr = firstElementAddress;

        while (nodePtr != nullptr) {
            nextNode = nodePtr->nextElementAddress;
            delete nodePtr;
            nodePtr = nextNode;
        }
    }

    void displayList() const {
        DataNode *nodePtr;
        nodePtr = firstElementAddress;
        int count = 0;

        while (nodePtr) {
            cout << "[" << nodePtr->value << "] -> ";
            ++count;
            nodePtr = nodePtr->nextElementAddress;
            if (count % 10 == 0) {
                cout << endl;
                count = 0;
            }
        }
        cout << endl;
    }

    void appendNode(char toAppend) {
        DataNode *node = new DataNode();
        node->value = toAppend;
        node->nextElementAddress = nullptr;

        if (firstElementAddress == nullptr)
            firstElementAddress = node;
        else {
            DataNode *tmpAddress = firstElementAddress;
            while (tmpAddress->nextElementAddress != nullptr)
                tmpAddress = tmpAddress->nextElementAddress;
            tmpAddress->nextElementAddress = node;
        }
    }

    void insertNode(char toInsert) {
        DataNode *tmpAddress, *prevAddress;
        DataNode *newNodeAddress = new DataNode();
        newNodeAddress->value = toInsert;
        newNodeAddress->nextElementAddress = nullptr;
        if (firstElementAddress == nullptr)
            firstElementAddress = newNodeAddress;
        tmpAddress = firstElementAddress;
        prevAddress = nullptr;
        while (tmpAddress) {
            if (tmpAddress->value >= toInsert) {
                if (prevAddress == nullptr) {
                    newNodeAddress->nextElementAddress = firstElementAddress;
                    firstElementAddress = newNodeAddress;
                } else {
                    //insert
                    newNodeAddress->nextElementAddress = tmpAddress;
                    prevAddress->nextElementAddress = newNodeAddress;
                }
            }
            prevAddress = tmpAddress;
            tmpAddress = tmpAddress->nextElementAddress;
        }
        prevAddress->nextElementAddress = newNodeAddress;
    }

    void deleteNode(char toDelete) {
        DataNode *tmpAddress, *prevAddress;
        tmpAddress = firstElementAddress;
        prevAddress = nullptr;
        while (tmpAddress) {
            if (tmpAddress->value == toDelete) {
                if (prevAddress == nullptr) {
                    firstElementAddress = tmpAddress->nextElementAddress;
                    delete tmpAddress;
                } else {
                    prevAddress->nextElementAddress = tmpAddress->nextElementAddress;
                    delete tmpAddress;
                }
            }
            prevAddress = tmpAddress;
            tmpAddress = tmpAddress->nextElementAddress;
        }
    }
};

#endif //ASSIGNMENT5_CHARLIST_H
