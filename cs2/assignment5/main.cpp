// This program demonstrates simple operations
// on a linked list.
#include <iostream>
#include "CharList.h"

int main() {
    // Define a NumberList object.
    CharList list;

    // Append some values to the list.
    list.appendNode('t');
    list.appendNode('c');
    list.appendNode('b');
    list.appendNode('v');
    list.appendNode('z');
    list.appendNode('a');
    list.appendNode('r');
    list.appendNode('t');
    list.insertNode('y');
    list.insertNode('0');
    list.insertNode('9');
    list.insertNode('o');
    list.insertNode('p');
    list.insertNode('@');
    list.insertNode('Q');
    list.deleteNode('t');
    list.displayList();
    return 0;
}
