#include<stdio.h>

int op=0;

void warshall(int n, int V[n][n]){
    //int R[n][n];
    for(int k=1;k<=n;k++){
        for(int i=1;i<=n;i++){
            for(int j=1;j<=n;j++){
                V[i][j] = V[i][j]||(V[i][k] && V[k][j]);
                op++;
            }
        }
    }
}

int main(){
    int n;
    printf("Enter size of matrix: ");
    scanf("%d", &n);
    int V[n][n];

    printf("Enter matrix: \n");
    for(int i=1;i<=n;i++){
        for(int j=1;j<=n;j++){
            scanf("%d", &V[i][j]);
        }
    }

    warshall(n,V);
    printf("Transitive closure for the matrix is: \n");
    for(int i=1;i<=n;i++){
        for(int j=1;j<=n;j++){
            printf("%d\t", V[i][j]);
        }
        printf("\n");
    }
    printf("OpCount is: %d", op);

    return 0;
}