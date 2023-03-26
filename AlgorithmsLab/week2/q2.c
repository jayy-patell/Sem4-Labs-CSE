#include<math.h>
#include<stdio.h>
#include<stdlib.h>

void prime1(int n,int *arr1,int p1)
{
    while (n % 2 == 0) {
        //printf("%d ", 2);
        arr1[p1] = 2; printf("%d ", 2); p1++;
        n = n / 2;
    }
 
    for (int i = 3; i <= sqrt(n); i = i + 2) {
        while (n % i == 0) {
            //printf("%d ", i);
            arr1[p1] = i; printf("%d ", i); p1++;
            n = n / i;
        }
    }

    if (n > 2){
        //printf("%d ", n);
        arr1[p1] = n; printf("%d ", n); p1++;
    }
    printf("\nSize 1: %d ", p1);
    printf("Array 1: ");
    for(int r=0; r<p1 ; r++){
        // printf("\nSize: %d", sizeof(arr1)/sizeof(arr1[0]));
        printf("%d ", arr1[r]);
    }
    printf("\nSize: %d\n", sizeof(arr1)/sizeof(arr1[0]));
}

void prime2(int n, int* arr2,int p2)
{
    while (n % 2 == 0) {
        //printf("%d ", 2);
        arr2[p2] = 2; printf("%d ", 2); p2++;
        n = n / 2;
    }
 
    for (int i = 3; i <= sqrt(n); i = i + 2) {
        while (n % i == 0) {
            //printf("%d ", i);
            arr2[p2] = i; printf("%d ", i); p2++;
            n = n / i;
        }
    }

    if (n > 2){
        //printf("%d ", n);
        arr2[p2] = n; printf("%d ", n); p2++;
    }
    printf("\nSize 2: %d ", p2);
    printf("Array 2: ");
    for(int r=0; r<p2 ; r++){
        // printf("\nSize: %d", sizeof(arr1)/sizeof(arr1[0]));
        printf("%d ", arr2[r]);
    }
}

int main(){

    int *arr1; int p1=0;
    int *arr2; int p2=0;
    arr1 = (int*)malloc(sizeof(int));
    arr2 = (int*)malloc(sizeof(int));
    int m,n,gcd=1;
    int i=0,j=0;
    printf("Enter m and n: ");
    scanf("%d%d", &m,&n);
    prime1(m,arr1,p1); prime2(n,arr2,p2);

    
    p1=4;p2=4;
    while(i<p1 && j<p2){
        if(arr1[i] == arr2[j]){
            gcd *= arr1[i];
            i++; j++;
        }else if(arr1[i] > arr2[j]){
            j++;
        }else if(arr1[i] < arr2[j]){
            i++;
        }
    }

    printf("\ngcd is: %d", gcd);
    return 0;
}