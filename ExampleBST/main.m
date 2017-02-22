////
////  main.m
////  ExampleBST
////
////  Created by Igorek on 1/5/17.
////  Copyright © 2017 Igorek. All rights reserved.
////

#include<stdlib.h>
#include<stdio.h>
#include <string.h>

#import "BSTExtension.h"
#import "BenarySearchTree.h"
#import "AVLBinaryTree.h"


static avltree *binarySearchTree = NULL;
int mainForBST()
{
	printf("Start .. \n");
	bool running = true;
	
	while (running)
	{
		char str[20];
		readInputline(str, 20);
		int intValue = -1;
		if (strlen(str) > 0)
		{
			intValue = atoi(str);
		}

		switch (intValue)
		{
			case 0 :
			{
				running = false;
				break;
			}
			case 1 :
			{
				if (binarySearchTree != NULL)
				{
					deapDeleleTree(binarySearchTree);
				}
				binarySearchTree = createManuallBST();
				drawBST(binarySearchTree);
				break;
			}
			case 2 :
			{
				if (binarySearchTree != NULL)
				{
					deapDeleleTree(binarySearchTree);
				}
				binarySearchTree = createRandomBST();
				drawBST(binarySearchTree);
				break;
			}
			case 3 :
			{
				if (binarySearchTree != NULL)
				{
					drawBST(binarySearchTree);
				}
				break;
			}
			case 4 :
			{
				if (binarySearchTree != NULL)
				{
					drawBST(binarySearchTree);
					/* Printing nodes of tree */
					printf("Pre Order Display\n");
					print_preorder(binarySearchTree);
					
					printf("In Order Display\n");
					print_inorder(binarySearchTree);
					
					printf("Post Order Display\n");
					print_postorder(binarySearchTree);
				}
				break;
			}
			case 5 :
			{
				if (binarySearchTree != NULL)
				{
					char str[20];
					readInputline(str, 20);
					int newNodeValue = -1;
					if (strlen(str) > 0)
					{
						newNodeValue = atoi(str);
					}

					if (newNodeValue != -1)
					{
						insert(&binarySearchTree, newNodeValue);
						drawBST(binarySearchTree);
					}
				}
				break;
			}
			case 6 :
			{
				if (binarySearchTree != NULL)
				{
					char str[20];
					readInputline(str, 20);
					int searchNodeValue = -1;
					if (strlen(str) > 0)
					{
						searchNodeValue = atoi(str);
					}
					avltree* searchNode = search(&binarySearchTree, searchNodeValue);
					drawBST(searchNode);
				}
				break;
			}
			case 7 :
			{
				if (binarySearchTree != NULL)
				{
					char str[20];
					readInputline(str, 20);
					int removeNodeValue = -1;
					if (strlen(str) > 0)
					{
						removeNodeValue = atoi(str);
					}
					removeNode(&binarySearchTree, removeNodeValue);
					drawBST(binarySearchTree);
				}
				break;
			}

			default:
			{
				system("clear");
				printf(" 0 - Exit \n");
				printf(" 1 - Create manual BST \n");
				printf(" 2 - Create randome BST \n");
				printf(" 3 - Draw BST \n");
				printf(" 4 - Traversal BST \n");
				printf(" 5 - Insert node \n");
				printf(" 6 - Search node \n");
				printf(" 7 - Remove node \n");
				break;
			}
		}
	}
	return 0;
}

int mainForAVLTree()
{
//	avltree *rootAVLTree = avlMakeNode(1, NULL);
//	rootAVLTree = avlInsert(rootAVLTree, 2);
//	drawBST(rootAVLTree);
//	rootAVLTree = avlInsert(rootAVLTree, 3);
//	drawBST(rootAVLTree);
//	rootAVLTree = avlInsert(rootAVLTree, 4);
//	drawBST(rootAVLTree);
//	rootAVLTree = avlInsert(rootAVLTree, 5);
//	drawBST(rootAVLTree);
	
	avltree *rootAVLTree = avlMakeNode(10, NULL);
	rootAVLTree = avlInsert(rootAVLTree, 20);
	drawBST(rootAVLTree);
	rootAVLTree = avlInsert(rootAVLTree, 30);
	drawBST(rootAVLTree);
	rootAVLTree = avlInsert(rootAVLTree, 40);
	drawBST(rootAVLTree);
	rootAVLTree = avlInsert(rootAVLTree, 50);
	drawBST(rootAVLTree);

	rootAVLTree = avlInsert(rootAVLTree, 9);
	drawBST(rootAVLTree);

	rootAVLTree = avlInsert(rootAVLTree, 7);
	drawBST(rootAVLTree);

	rootAVLTree = avlInsert(rootAVLTree, 8);
	drawBST(rootAVLTree);

	rootAVLTree = avlInsert(rootAVLTree, 5);
	drawBST(rootAVLTree);

	rootAVLTree = avlInsert(rootAVLTree, 3);
	drawBST(rootAVLTree);

	
	return 0;
}

int main()
{
//	return mainForAVLTree();
	return mainForBST();
}


