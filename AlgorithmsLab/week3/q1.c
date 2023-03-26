//Bubble Sort

#include<stdio.h>
#include<stdlib.h>

void Bubbly(int* a, int n){
    int i,j,opcount=0,temp;
    for(i=0;i<(n-1);i++){
        for(j=0;j<(n-i-1);j++){
            opcount++;
            if(a[j]>a[j+1]){
                temp = a[j];
                a[j] = a[j+1];
                a[j+1] = temp;
            }
        }
    }
    printf("\nOpcount is: %d", opcount);
}

int main(){
    int n;
    printf("Enter dimensions: ");
    scanf("%d", &n);
    int arr[n];
    printf("Enter elements in array: ");
    for(int i=0;i<n;i++){
        scanf("%d", &arr[i]);
    }
    printf("Before sorting:");
    for(int i=0;i<n;i++){
        printf("%d", arr[i]);
    }
    Bubbly(arr,n);
    printf("After sorting:");
    for(int i=0;i<n;i++){
        printf("%d", arr[i]);
    }
    return 0;
}