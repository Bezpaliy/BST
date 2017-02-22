//
//  BenarySearchTree.m
//  ExampleBST
//
//  Created by Безпалый Игорь on 1/11/17.
//  Copyright © 2017 Igorek. All rights reserved.
//

#import "BenarySearchTree.h"


#pragma mark - Print Traversal BST

void print_preorder(avltree * tree)
{
	if (tree)
	{
		printf("%d\n",tree->data);
		print_preorder(tree->left);
		print_preorder(tree->right);
	}
}

void print_inorder(avltree * tree)
{
	if (tree)
	{
		print_inorder(tree->left);
		printf("%d\n",tree->data);
		print_inorder(tree->right);
	}
}

void print_postorder(avltree * tree)
{
	if (tree)
	{
		print_postorder(tree->left);
		print_postorder(tree->right);
		printf("%d\n",tree->data);
	}
}

#pragma mark - Delete Tree for BST

void deapDeleleTree(avltree * tree)
{
	if (tree != NULL)
	{
		deapDeleleTree(tree->left);
		deapDeleleTree(tree->right);
		free(tree);
	}
}

#pragma mark - Is Empty Tree for BST

bool isEmpty(avltree * tree)
{
	return (tree != NULL) ? tree : false;
}

#pragma mark - Search For BST

avltree* search(avltree ** tree, int val)
{
	if ((*tree) == NULL)
	{
		return NULL;
	}
	
	if(val < (*tree)->data)
	{
		return search(&((*tree)->left), val);
	}
	else if(val > (*tree)->data)
	{
		return search(&((*tree)->right), val);
	}
	else if(val == (*tree)->data)
	{
		return *tree;
	}
	else
	{
		return NULL;
	}
}

#pragma mark - Remove Node For BST

avltree* findMostLeftNode(avltree ** tree)
{
	if ((*tree) == NULL)
	{
		return NULL;
	}
	else if((*tree)->left != NULL)
	{
		return findMostLeftNode(&(*tree)->left);
	}
	else
	{
		return *tree;
	}
}

void removeNode(avltree ** rootNode, int value)
{
	if((*rootNode) != NULL)
	{
		//Locate the node...
		bool found = false;
		avltree* currentNode = *rootNode;
		avltree* parentNode = NULL;
		while (currentNode != NULL)
		{
			if (currentNode->data == value)
			{
				found = true;
				break;
			}
			else
			{
				parentNode = currentNode;
				if (value > currentNode->data)
				{
					currentNode = currentNode->right;
				}
				else
				{
					currentNode = currentNode->left;
				}
			}
		}
		if (!found)
		{
			printf("Invalid value....%d", value);
			return;
		}
		
		// 1 - We're remove a leaf node...
		if( currentNode->left == NULL && currentNode->right == NULL)
		{
			if(parentNode->left == currentNode)
			{
				parentNode->left = NULL;
			}
			else
			{
				parentNode->right = NULL;
			}
			free(currentNode);
			return;
		}
		
		// 2. We're removing a node with a single child
		if((currentNode->left == NULL && currentNode->right != NULL) ||
		   (currentNode->left != NULL && currentNode->right == NULL))
		{
			if(currentNode->left == NULL && currentNode->right != NULL) // right child present, no left child
			{
				if(parentNode->left == currentNode)
				{
					parentNode->left = currentNode->right;
					free(currentNode);
				}
				else
				{
					parentNode->right = currentNode->right;
					free(currentNode);
				}
			}
			else // left child present, no right child
			{
				if(parentNode->left == currentNode)
				{
					parentNode->left = currentNode->left;
					free(currentNode);
				}
				else
				{
					parentNode->right = currentNode->left;
					free(currentNode);
				}
			}
			return;
		}
		
		//Node with 2 children
		if (currentNode->left != NULL && currentNode->right != NULL)
		{
			avltree* rightChildNode;
			rightChildNode = currentNode->right;
			if((rightChildNode->left == NULL) && (rightChildNode->right == NULL))
			{
				if(parentNode->left == currentNode)
				{
					parentNode->left = rightChildNode;
				}
				else
				{
					parentNode->right = rightChildNode;
				}
				rightChildNode->left=currentNode->left;
				rightChildNode->right=NULL;
				free(currentNode);
			}
			else // right child has children
			{
				//if the node's right child has a left child
				// Move all the way down left to locate smallest element
				if((currentNode->right)->left != NULL)
				{
					avltree* leftCurParent = currentNode->right;
					avltree* leftCurSubNode = (currentNode->right)->left;
					while(leftCurSubNode->left != NULL)
					{
						leftCurParent = leftCurSubNode;
						leftCurSubNode = leftCurSubNode->left;
					}
					currentNode->data = leftCurSubNode->data;
					free(leftCurSubNode);
					leftCurParent->left = NULL;
				}
				else
				{
					avltree* tmp= NULL;
					tmp = currentNode->right;
					currentNode->data = tmp->data;
					currentNode->right = tmp->right;
					free(tmp);
				}
			}
		 return;
		}
	}
}

#pragma mark - Insert For BST

void insert(avltree ** tree, int val)
{
	avltree *temp = NULL;
	if((*tree) == NULL)
	{
		temp = (avltree *)malloc(sizeof(avltree));
		temp->left = temp->right = NULL;
		temp->data = val;
		*tree = temp;
		return;
	}
	else
	{
		if(val < (*tree)->data)
		{
			insert(&(*tree)->left, val);
		}
		else if(val > (*tree)->data)
		{
			insert(&(*tree)->right, val);
		}
	}
}

#pragma mark - Create Random BST

avltree * createRandomBST()
{
	avltree *root = NULL;
	
	static const int maxValue = 20;
	int rootValue = maxValue / 2;
	insert(&root, rootValue);
	srand((unsigned)time(NULL));
	for (int i = 0; i <= 14; i++)
	{
		insert(&root, rand() % maxValue + 1);
	}
	return root;
}

#pragma mark - Create Manual BST

avltree * createManuallBST()
{
	avltree *root = NULL;
	/* Inserting nodes into tree */
	// Orignal
	insert(&root, 9);
	insert(&root, 4);
	insert(&root, 15);
	insert(&root, 6);
	insert(&root, 12);
	insert(&root, 17);
	insert(&root, 2);
	
	insert(&root, 5);
	insert(&root, 7);
	insert(&root, 8);
	insert(&root, 3);
	
	
	//  Remove = 1
	//	insert(&root, 9);
	//	insert(&root, 4);
	//	insert(&root, 15);
	//	insert(&root, 12);
	//	insert(&root, 17);
	//	insert(&root, 2);
	//	insert(&root, 1);
	
	// Remove = 2
	//	insert(&root, 9);
	//	insert(&root, 4);
	//	insert(&root, 15);
	//	insert(&root, 6);
	//	insert(&root, 12);
	//	insert(&root, 17);
	//	insert(&root, 2);
	//	insert(&root, 5);
	//	insert(&root, 7);
	//	insert(&root, 8);
	//
	// Remove = 2
	//	insert(&root, 9);
	//	insert(&root, 3);
	//	insert(&root, 15);
	//	insert(&root, 6);
	//	insert(&root, 12);
	//	insert(&root, 17);
	//	insert(&root, 2);
	//
	//	insert(&root, 5);
	//	insert(&root, 7);
	//	insert(&root, 8);
	//	insert(&root, 4);
	//	insert(&root, 1);
	//
	return root;
}
