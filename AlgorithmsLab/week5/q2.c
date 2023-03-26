// Recursive optimized C program to find the diameter of a
// Binary Tree
#include <stdio.h>
#include <stdlib.h>

struct node {
	int data;
	struct node *left, *right;
};

//also can be done recursively
struct node* newNode(int data)
{
	struct node* node = (struct node*)malloc(sizeof(struct node));
	node->data = data;
	node->left = NULL;
	node->right = NULL;

	return (node);
}

// returns max of two integers
int max(int a, int b) { return (a > b) ? a : b; }

int height(struct node* node)
{
	// base case
	if (node == NULL)
		return 0;

	return 1 + max(height(node->left), height(node->right));
}

int diameter(struct node* tree)
{
	// base case where tree is empty
	if (tree == NULL)
		return 0;

	// get the height of left and right sub-trees
	int lheight = height(tree->left);
	int rheight = height(tree->right);

	// get the diameter of left and right sub-trees
	int ldiameter = diameter(tree->left);
	int rdiameter = diameter(tree->right);

	// Return max of following three
	// 1) Diameter of left subtree
	// 2) Diameter of right subtree
	// 3) Height of left subtree + height of right subtree +
	// 1

	return max(lheight + rheight + 1, max(ldiameter, rdiameter));
}

// UTILITY FUNCTIONS TO TEST diameter() FUNCTION

int main()
{

	/* Constructed binary tree is
			 1
			/ \
		   2  3
		/  \
	    4   5
	*/
	struct node* root = newNode(1);
	root->left = newNode(2);
	root->right = newNode(3);
	root->left->left = newNode(4);
	root->left->right = newNode(5);

	printf("Diameter of the given binary tree is %d\n", diameter(root));

	return 0;
}
