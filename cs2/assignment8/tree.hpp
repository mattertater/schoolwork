/*
   COPYRIGHT (C) 2017 Matt McDade (mm263) All rights reserved.
   CS assignment
   Author.  Matt McDade
            mm263@zips.uakron.edu
   Version. 1.01 09.09.2017
*/
#ifndef TREE_HPP
#define TREE_HPP
#include <iostream>
#include "treenode.hpp"

// Tree class-template definition
template<typename NODETYPE> class Tree {
public:
   // insert node in Tree
   void insertNode(const NODETYPE& value) {
      insertNodeHelper(&rootPtr, value);
   }

   // begin preorder traversal of Tree
   void preOrderTraversal() const {
      preOrderHelper(rootPtr);
   }

   // begin inorder traversal of Tree
   void inOrderTraversal() const {
      inOrderHelper(rootPtr);
   }

   // begin postorder traversal of Tree
   void postOrderTraversal() const {
      postOrderHelper(rootPtr);
   }

   // get the depth of the tree
   int getDepth() const {
      int totalDepth{0};
      int currentDepth{0};

      determineDepth(rootPtr, &totalDepth, &currentDepth);
      return totalDepth;
   }

   // begin binary search
   TreeNode<NODETYPE>* binaryTreeSearch(int val) const {
      return binarySearchHelper(rootPtr, val);
   }

private:
   TreeNode<NODETYPE>* rootPtr{nullptr};

   // utility function called by insertNode; receives a pointer
   // to a pointer so that the function can modify pointer's value
   void insertNodeHelper(
      TreeNode<NODETYPE>** ptr, const NODETYPE& value) {
      // subtree is empty; create new TreeNode containing value
      if (*ptr == nullptr) {
         *ptr = new TreeNode<NODETYPE>(value);
      }
      else { // subtree is not empty
             // data to insert is less than data in current node
         if (value <= (*ptr)->data) {
            insertNodeHelper(&((*ptr)->leftPtr), value);
         }
         else {
            insertNodeHelper(&((*ptr)->rightPtr), value);
         }
      }
   }

   // utility function to perform preorder traversal of Tree
   void preOrderHelper(TreeNode<NODETYPE>* ptr) const {
      if (ptr != nullptr) {
         std::cout << ptr->data << ' '; // process node
         preOrderHelper(ptr->leftPtr); // traverse left subtree
         preOrderHelper(ptr->rightPtr); // traverse right subtree
      }
   }

   // utility function to perform inorder traversal of Tree
   void inOrderHelper(TreeNode<NODETYPE>* ptr) const {
      if (ptr != nullptr) {
         inOrderHelper(ptr->leftPtr); // traverse left subtree
         std::cout << ptr->data << ' '; // process node
         inOrderHelper(ptr->rightPtr); // traverse right subtree
      }
   }

   // utility function to perform postorder traversal of Tree
   void postOrderHelper(TreeNode<NODETYPE>* ptr) const {
      if (ptr != nullptr) {
         postOrderHelper(ptr->leftPtr); // traverse left subtree
         postOrderHelper(ptr->rightPtr); // traverse right subtree
         std::cout << ptr->data << ' '; // process node
      }
   }

   // calculate the depth of the tree GTHS DOESN'T WORK. Should have worked it out on a whiteboard.
   void determineDepth(TreeNode<NODETYPE>* rootPtr, TreeNode<NODETYPE>* &totalDepth, TreeNode<NODETYPE>* &currentDepth) {
      if (rootPtr == nullptr) {
         &totalDepth = 0;
         &currentDepth = 0;
      }
      else {
         // get depth of both sides from middle
         totalDepth+=1;
         determineDepth(rootPtr->leftPtr, totalDepth, currentDepth);
         determineDepth(rootPtr->rightPtr, totalDepth, currentDepth);

      }
   }

   // do a binary search on the Tree
   TreeNode<NODETYPE>* binarySearchHelper(TreeNode<NODETYPE>* rootPtr, int value) {
      if (rootPtr == nullptr) {
         return nullptr;
      }

      //since it's not a reference pass of the root pointer, not worrying about changing it's value and messing things up
      while (rootPtr) {
         if (rootPtr == value)
            return rootPtr;
         else if (value < rootPtr->data)
            rootPtr = rootPtr->leftPtr;
         else
            rootPtr = rootPtr->rightPtr;
      }

      return nullptr;
   }

};

#endif // TREE_HPP
