#include<stdio.h>
#include<stdlib.h>

struct node {
    int data;
    struct node * left, * right;
};

struct node * newNode(int data) {
    struct node * node = (struct node * ) malloc(sizeof(struct node));
    node -> data = data;
    node -> left = NULL;
    node -> right = NULL;

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

void inOrder(struct node* ptr){
    if(ptr==NULL){
        return;
    }
    inOrder(ptr->left);
    printf("Node: %d and Balance Factor: %d\n", ptr->data, height(ptr->left)-height(ptr->right));
    inOrder(ptr->right);
}

int main() {

    struct node * root = newNode(1);
    root -> left = newNode(2);
    root -> right = newNode(3);
    root -> left -> left = newNode(4);
    root -> left -> right = newNode(5);
    root -> right -> left = newNode(6);

    inOrder(root);

    return 0;
}