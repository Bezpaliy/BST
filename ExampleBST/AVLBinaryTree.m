//
//  AVLBinaryTree.m
//  ExampleBST
//
//  Created by Безпалый Игорь on 1/11/17.
//  Copyright © 2017 Igorek. All rights reserved.
//

#import "AVLBinaryTree.h"


int max(int a, int b) { return a > b ? a : b; }

avltree *avlFind(avltree *root, int val)
{
	if (root == NULL) return NULL;
	if (val < root->data)
		return avlFind(root->left, val);
	else if (val > root->data)
		return avlFind(root->right, val);
	else
		return root;
}

int avlHeight(avltree *root)
{
	return root ? root->height : 0;
}

void avlAdjustHeight(avltree *root)
{
	root->height = 1 + max(avlHeight(root->left), avlHeight(root->right));
}

/* We can assume node->left is non-null due to how this is called */
avltree *avlRotateRight(avltree *root)
{
	printf("Right rotate...\n");
	/* Fix pointers */
	avltree *new_root = root->left;
	if (root->parent)
	{
		if (root->parent->left == root) root->parent->left = new_root;
		else root->parent->right = new_root;
	}
	new_root->parent = root->parent;
	root->parent = new_root;
	root->left = new_root->right;
	if (root->left) root->left->parent = root;
	new_root->right = root;
	
	/* Fix heights; root and new_root may be wrong. Do bottom-up */
	avlAdjustHeight(root);
	avlAdjustHeight(new_root);
	return new_root;
}

/* We can assume node->right is non-null due to how this is called */
avltree *avlRotateLeft(avltree *root)
{
	printf("Left rotate...\n");
	/* Fix pointers */
	avltree *new_root = root->right;
	if (root->parent)
	{
		if (root->parent->right == root) root->parent->right = new_root;
		else root->parent->left = new_root;
	}
	new_root->parent = root->parent;
	root->parent = new_root;
	root->right = new_root->left;
	if (root->right) root->right->parent = root;
	new_root->left = root;
	
	/* Fix heights; root and new_root may be wrong */
	avlAdjustHeight(root);
	avlAdjustHeight(new_root);
	return new_root;
}

avltree *avlMakeNode(int val, avltree *parent)
{
	avltree *n = malloc(sizeof(avltree));
	n->data = val;
	n->parent = parent;
	n->height = 1;
	n->left = NULL;
	n->right = NULL;
	
	return n;
}

avltree *avlBalance(avltree *root)
{
	if (avlHeight(root->left) - avlHeight(root->right) > 1)
	{
		if (avlHeight(root->left->left) > avlHeight(root->left->right))
		{
			root = avlRotateRight(root);
		}
		else
		{
			avlRotateLeft(root->left);
			root = avlRotateRight(root);
		}
	}
	else if (avlHeight(root->right) - avlHeight(root->left) > 1)
	{
		if (avlHeight(root->right->right) > avlHeight(root->right->left))
		{
			root = avlRotateLeft(root);
		}
		else
		{
			avlRotateRight(root->right);
			root = avlRotateLeft(root);
		}
	}
	return root;
}

avltree *avlInsert(avltree *root, int val)
{
	printf("Insert %d...\n", val);
	avltree *current = root;
	while (current->data != val)
	{
		if (val < current->data)
		{
			if (current->left) current = current->left;
			else
			{
				current->left = avlMakeNode(val, current);
				current = current->left;
			}
		}
		else if (val > current->data)
		{
			if (current->right) current = current->right;
			else
			{
				current->right = avlMakeNode(val, current);
				current = current->right;
			}
		}
		else return root; /* Value was in the tree, dumbass */
	}
	
	do
	{
		current  = current->parent;
		avlAdjustHeight(current);
		current = avlBalance(current);
	} while (current->parent);
	
	return current;
}

