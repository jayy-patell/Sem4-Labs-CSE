#include<stdio.h>

int min(int a, int b){ return (a<b) ? a:b; }

void floyd(int V[][10], int n){
    for(int k=1;k<=n;k++){
        for(int i=1;i<=n;i++){
            for(int j=1;j<=n;j++){
                //if (i == j) { V[i][j]=0; }
                
                V[i][j] = min(V[i][j], (V[i][k]+V[k][j]));
            }
        }
    }
    
}

int main(){
    int n, V[10][10];
    printf("Enter size of matrix: ");
    scanf("%d", &n);

    printf("Enter matrix(add 999 for no edge): \n");
    for(int i=1;i<=n;i++){
        for(int j=1;j<=n;j++){
            scanf("%d", &V[i][j]);
        }
    }
    floyd(V,n);
    printf("All pair shorteset path for the matrix is: \n");
    for(int i=1;i<=n;i++){
        for(int j=1;j<=n;j++){
            printf("%d\t", V[i][j]);
        }
        printf("\n");
    }

    return 0;
}

// 0       999     3       999
// 2       0       999     999
// 999     7       0       1
// 6       999     999     0