#include<stdio.h>
#include<stdlib.h>

void SelectionSort(int *a, int n){
    int i,j,min_ind,temp;
    int opcount=0;
    for(i=0;i<n-1;i++){
        min_ind = i;
        for(j=i+1;j<n;j++){
            ++opcount;
            if(a[j]<a[min_ind]){
                min_ind=j;
            }
        }
        temp = a[i];
        a[i]=a[min_ind];
        a[min_ind] = temp;
    }
    printf("\nOpcount is: %d", opcount);
}

int main(){
    int arr[5];
    printf("Enter 5 elements in array: ");
    for(int i=0;i<5;i++){
        scanf("%d", &arr[i]);
    }
    printf("Before sorting:");
    for(int i=0;i<5;i++){
        printf("%d", arr[i]);
    }
    SelectionSort(arr,5);
    printf("\nAfter selection:");
    for(int i=0;i<5;i++){
        printf("%d", arr[i]);
    }
    return 0;
}