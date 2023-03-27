#include<stdio.h>
#include<stdlib.h>

int opCount = 0;

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

void inOrderTrav(struct node* curr) {
    if (curr == NULL)
        return;

    inOrderTrav(curr -> left);
    printf("%d\t", curr->data); //count++
    inOrderTrav(curr -> right);
}

int countnodes(struct node* header){
    opCount++;
	if (!header)
	{
		return 0;
	}
    return 1 + countnodes(header->right) + countnodes(header->left);
}

int main() {

    struct node * root = newNode(1);
    root -> left = newNode(2);
    root -> right = newNode(3);
    root -> left -> left = newNode(4);
    root -> left -> right = newNode(5);
    root -> right -> left = newNode(6);

    int num = countnodes(root);

    printf("The total number of nodes in the given complete binary tree are: %d", num);
    return 0;
}