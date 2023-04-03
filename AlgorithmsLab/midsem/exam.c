#include<stdio.h>
#include<stdlib.h>

void merge(int arr[], int left, int mid, int right){
    int n1 = mid-left+1;
    int n2 = right-left;
    int L[n1];
    int R[n2];

    for(int i=0;i<n1;i++){
        L[i]=arr[left+i];
    }
    for(int j=0;j<n2;j++){
        R[j]=arr[mid+1+j];
    }
    int i=0,j=0,k=left;

    while(i<n1 && j<n2){
        if(L[i] < R[j]){
            arr[k] = L[i++];
        }else{
            arr[k] = R[j++];
        }
        k++;
    }
    while(i<n1){
        arr[k++] = L[i++];
    }
    while(j<n2){
        arr[k++] = R[j++];
    }

    // while(i<n1 && j<n2){
    //     if(L[])
    // }
}

void mergeSort(int arr[], int left, int right){
    if(left<right){
        int mid = left + (right-left)/2;
        mergeSort(arr,left,mid);
        mergeSort(arr,mid+1,right);

        merge(arr,left,mid,right);
    }
}

int main(){
    int arr[8] = {8,9,1,4,5,6,5,2};
    mergeSort(arr,0,7);

    for(int i=0;i<8;i++){
        printf("%d", arr[i]);
    }
}