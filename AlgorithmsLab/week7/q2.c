// AVL tree implementation in C

#include <stdio.h>
#include <stdlib.h>

// Create Node
struct Node {
  int key;
  struct Node *left;
  struct Node *right;
  int height;
};

int max(int a, int b);

// Calculate height
int height(struct Node *N) {
  if (N == NULL)
    return 0;
  return N->height;
}

int max(int a, int b) {
  return (a > b) ? a : b;
}

// Create a node
struct Node *newNode(int key) {
  struct Node *node = (struct Node *)
    malloc(sizeof(struct Node));
  node->key = key;
  node->left = NULL;
  node->right = NULL;
  node->height = 1;
  return (node);
}

// Right rotate
struct Node *rightRotate(struct Node *y) {
  struct Node *x = y->left;
  struct Node *T2 = x->right;

  x->right = y;
  y->left = T2;

  y->height = max(height(y->left), height(y->right)) + 1;
  x->height = max(height(x->left), height(x->right)) + 1;

  return x;
}

// Left rotate
struct Node *leftRotate(struct Node *x) {
  struct Node *y = x->right;
  struct Node *T2 = y->left;

  y->left = x;
  x->right = T2;

  x->height = max(height(x->left), height(x->right)) + 1;
  y->height = max(height(y->left), height(y->right)) + 1;

  return y;
}

// Get the balance factor
int getBalance(struct Node *N) {
  if (N == NULL)
    return 0;
  return height(N->left) - height(N->right);
}

// Insert node
struct Node *insertNode(struct Node *node, int key) {
  // Find the correct position to insertNode the node and insertNode it
  if (node == NULL)
    return (newNode(key));

  if (key < node->key)
    node->left = insertNode(node->left, key);
  else if (key > node->key)
    node->right = insertNode(node->right, key);
  else
    return node;   //reaches its correct place

  // Update the balance factor of each node and
  // Balance the tree
  node->height = 1 + max(height(node->left),
               height(node->right));

  int balance = getBalance(node);
  if (balance > 1 && key < node->left->key)
    return rightRotate(node);

  if (balance < -1 && key > node->right->key)
    return leftRotate(node);

  if (balance > 1 && key > node->left->key) {
    node->left = leftRotate(node->left);
    return rightRotate(node);
  }

  if (balance < -1 && key < node->right->key) {
    node->right = rightRotate(node->right);
    return leftRotate(node);
  }

  return node;
}

struct Node *minValueNode(struct Node *node) {
  struct Node *current = node;

  while (current->left != NULL)
    current = current->left;

  return current;
}

// Delete a nodes
struct Node *deleteNode(struct Node *root, int key) {
  // Find the node and delete it
  if (root == NULL)
    return root;

  if (key < root->key)
    root->left = deleteNode(root->left, key);

  else if (key > root->key)
    root->right = deleteNode(root->right, key);

  else {
    if ((root->left == NULL) || (root->right == NULL)) {
      struct Node *temp = root->left ? root->left : root->right;

      if (temp == NULL) {
        temp = root;
        root = NULL;
      } else
        *root = *temp;
      free(temp);
    } else {
      struct Node *temp = minValueNode(root->right);

      root->key = temp->key;

      root->right = deleteNode(root->right, temp->key);
    }
  }

  if (root == NULL)
    return root;

  // Update the balance factor of each node and
  // balance the tree
  root->height = 1 + max(height(root->left),
               height(root->right));

  int balance = getBalance(root);
  if (balance > 1 && getBalance(root->left) >= 0)
    return rightRotate(root);

  if (balance > 1 && getBalance(root->left) < 0) {
    root->left = leftRotate(root->left);
    return rightRotate(root);
  }

  if (balance < -1 && getBalance(root->right) <= 0)
    return leftRotate(root);

  if (balance < -1 && getBalance(root->right) > 0) {
    root->right = rightRotate(root->right);
    return leftRotate(root);
  }

  return root;
}

// Print the tree
void printPreOrder(struct Node *root) {
  if (root != NULL) {
    printf("%d ", root->key);
    printPreOrder(root->left);
    printPreOrder(root->right);
  }
}

int main() {
  struct Node *root = NULL;

  root = insertNode(root, 2);
  root = insertNode(root, 1);
  root = insertNode(root, 7);
  root = insertNode(root, 4);
  root = insertNode(root, 5);
  root = insertNode(root, 3);
  root = insertNode(root, 8);

  printPreOrder(root);

  root = deleteNode(root, 3);

  printf("\nAfter deletion: ");
  printPreOrder(root);

  return 0;
}



// #include<stdio.h>
// #include<stdlib.h>

// struct node
// {
// 	struct node *left,*right;
// 	int data;
// 	int balance;
// };

// typedef struct node Node;

// int max(int a,int b)
// {
// 	return a>b? a: b;
// }

// int height(Node *root)
// {
// 	if(root==NULL)
// 		return 0;
// 	return max(height(root->left),height(root->right))+1;
// }

// void balance_factor(Node *root,Node *st[],int *top)
// {
// 	if(root==NULL)
// 		return;
// 	if(root->left==NULL && root->right==NULL)
// 	{
		
// 		return;
// 	}
// 	balance_factor(root->left,st,top);
// 	int bf = height(root->left)-height(root->right);
// 	root->balance=bf;
// 	if(bf>1 || bf<-1)
// 		st[++(*top)]=root;
// 	balance_factor(root->right,st,top);
// }

// Node *leftrotate(Node *root)
// {
// 	Node *z=root;
// 	Node *y=root->right;
// 	z->right=y->left;
// 	y->left=z;
// 	return y;
// }

// Node *rightrotate(Node *root)
// {
// 	Node *z=root;
// 	Node *y=root->left;
// 	z->left=y->right;
// 	y->right=z;
// 	return y;
// }

// Node *avl(Node *root,int key)
// {
// 	Node *st[10];
// 	int top=-1;
// 	balance_factor(root,st,&top);
// 	if(top==-1)
// 		return root;
// 	//search the node
// 	//printf("hi\n");
// 	Node *snode;
// 	if(top==1)
// 		snode=st[top-1];
// 	else
// 		snode=st[top];
// 	Node *nd=root;
// 	//printf("hi\n");
// 	//left case
// 	//printf("%d ",snode->data);
// 	if(snode->balance>1 && key<nd->left->data)
// 		root=rightrotate(snode);
// 	//right case
// 	else if(snode->balance<-1 && key>nd->right->data)
// 		root=leftrotate(snode);
// 	//left right case
// 	else if(snode->balance>1 && key>nd->left->data)
// 	{
// 		snode->left =leftrotate(snode->left);
// 		root=rightrotate(snode);
// 	}
// 	//right left case
// 	else if(snode->balance<1 && key<nd->right->data)
// 	{
// 		snode->right =rightrotate(snode->right);
// 		root=leftrotate(snode);
// 	}
// 	return root;
// }

// Node *newNode(int data,Node *root)
// {
// 	Node *node=(Node*)malloc(sizeof(Node));
// 	node->left=NULL;
// 	node->right=NULL;
// 	node->data=data;
// 	node->balance=0;
// 	if(root==NULL)
// 	{
// 		return node;
// 	}

// 	Node *nd=root;
// 	Node *parent;
// 	while(nd)
// 	{
// 		parent=nd;
// 		if(nd->data<data)
// 			nd=nd->right;
// 		else
// 			nd=nd->left;
// 	}
// 	if(parent->data<data)
// 		parent->right=node;
// 	else
// 		parent->left=node;
// 	root=avl(root,data);
// 	return root;
// }

// void print(Node *root)
// {
// 	if(root==NULL)
// 		return;
// 	printf("%d ",root->data);
// 	print(root->left);
// 	print(root->right);
// }

// int main()
// {
// 	int n;
// 	Node *root=NULL;
// 	printf("Enter the Number of Nodes of The AVL Tree : \n");
// 	scanf("%d",&n);
// 	int x;
// 	for(int i=0;i<n;i++)
// 	{
// 		printf("Enter the %d Node in the AVL Tree \n",(i+1));
// 		scanf("%d",&x);
// 		root=newNode(x,root);
// 	}
// 	printf("The AVL Tree Inserted has the Preorder Traversal given by : \n");
// 	print(root);
// 	printf("\n");
// }