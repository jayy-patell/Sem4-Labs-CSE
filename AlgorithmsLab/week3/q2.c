#include<stdio.h>
#include<stdlib.h>

//rows of first columns of second matrix as m and n vs. opcount

void Mult(int c1, int c2, int r1, int a[][c1], int b[][c2], int c[][c2]){
    
    int i,j,k,opcount=0;
    for(i=0;i<r1;i++){
        for(j=0;j<c2;j++){
            c[i][j]=0;
            for(k=0;k<c1;k++){
                opcount++;
                c[i][j] += a[i][k]*b[k][j];
            }
        }
    }
    printf("After multiplying\n");
    for (i=0;i<r1;i++){
        for(j=0;j<c2;j++){
            printf("%d  ", c[i][j]);
        }
        printf("\n");
    }
    printf("Opcount is: %d", opcount);
}

int main(){
    int i,j,r1,r2,c1,c2;
    printf("Enter dimensions of m1: ");
    scanf("%d%d", &r1,&c1);
    printf("Enter dimensions of m2: ");
    scanf("%d%d", &r2,&c2);
    int a[r1][c1], b[r2][c2];

    printf("Enter ele for matrix 1: ");
    for (i=0;i<r1;i++){
        for(j=0;j<c1;j++){
            scanf("%d", &a[i][j]);
        }
    }
    printf("Enter ele for matrix 2: ");
    for (i=0;i<r2;i++){
        for(j=0;j<c2;j++){
            scanf("%d", &b[i][j]);
        }
    }

    if(c1!=r2){
        printf("Cannot multiply");
    }else{
        int c[r1][c2];
        Mult(c1,c2,r1,a,b,c);
    }
    
    return 0;
}
    