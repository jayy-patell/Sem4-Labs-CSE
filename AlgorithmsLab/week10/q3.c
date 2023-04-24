
//KNAPSACK

#include<stdio.h>

int max(int a,int b){return a>b?a:b;}

int knapsack(int N,int W,int value[],int wt[]){
    int V[N+1][W+1];
    for(int i=0;i<=N;i++){
        for(int j=0;j<=W;j++)
            V[i][j]=0;
    } 

    for(int i=1;i<=N;i++){
        for(int j=1;j<=W;j++){
            if(j-wt[i-1]>=0)
                V[i][j]=max(V[i-1][j],(value[i-1]+V[i-1][j-wt[i-1]]));
            else
                V[i][j]=V[i-1][j];
        }
    }

    printf("\n---------OUTPUT-----------\n");

    for(int i=0;i<=N;i++) {
        for(int j=0;j<=W;j++)
            printf("%d\t",V[i][j]);
        printf("\n");
    }

    return V[N][W];
}



void main(){
    int N,W;
    int value[10],wt[10];
    printf("Enter no of items: ");
    scanf("%d",&N);

    printf("Enter value and weight of each item:\n");
    for(int i=0;i<N;i++)
    scanf("%d %d",&value[i],&wt[i]);
    printf("Enter knapsack capacity: ");
    scanf("%d",&W);

    knapsack(N,W,value,wt);
}


