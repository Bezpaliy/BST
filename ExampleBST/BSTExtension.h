//
//  BSTExtension.h
//  ExampleBST
//
//  Created by Igorek on 1/7/17.
//  Copyright © 2017 Igorek. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct avlnode
{
	int data;
	struct avlnode *left;
	struct avlnode *right;
	struct avlnode *parent; // optional !
	int height;				// for avl tree
} avltree;

int readInputline(char line[], int max);
void drawBST(avltree *tree);

void drawAVLTree(avltree *tree);

