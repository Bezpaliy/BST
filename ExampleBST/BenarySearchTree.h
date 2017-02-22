//
//  BenarySearchTree.h
//  ExampleBST
//
//  Created by Безпалый Игорь on 1/11/17.
//  Copyright © 2017 Igorek. All rights reserved.
//

#import "BSTExtension.h"

void print_preorder(avltree * tree);
void print_inorder(avltree * tree);
void print_postorder(avltree * tree);

void deapDeleleTree(avltree * tree);

avltree* search(avltree ** tree, int val);

void removeNode(avltree ** rootNode, int value);

void insert(avltree ** tree, int val);

avltree * createRandomBST();
avltree * createManuallBST();
