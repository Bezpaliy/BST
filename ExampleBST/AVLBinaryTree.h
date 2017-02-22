//
//  AVLBinaryTree.h
//  ExampleBST
//
//  Created by Безпалый Игорь on 1/11/17.
//  Copyright © 2017 Igorek. All rights reserved.
//

#import "BSTExtension.h"

avltree *avlFind(avltree *root, int val);

avltree *avlMakeNode(int val, avltree *parent);

avltree *avlInsert(avltree *root, int val);
