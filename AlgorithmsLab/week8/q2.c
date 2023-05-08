// Heap Sort in C

#include <stdio.h>

void swap(int* a, int* b)
{
	int temp = *a;
	*a = *b;
	*b = temp;
}

// To heapify a subtree rooted with node i
// which is an index in arr[].
// n is size of heap
void heapify(int arr[], int N, int i)
{
	// Initialize largest as root
	int largest = i;
	int left = 2 * i + 1;
	int right = 2 * i + 2;

	if (left < N && arr[left] > arr[largest])
		largest = left;

	if (right < N && arr[right] > arr[largest])
		largest = right;

	if (largest != i) {
		swap(&arr[i], &arr[largest]);

		// Recursively heapify the affected sub-tree
		heapify(arr, N, largest);
	}
}

void heapSort(int arr[], int N)
{
	// Build max heap
	for (int i = N / 2 - 1; i >= 0; i--)
		heapify(arr, N, i);

	// Heap sort
	for (int i = N - 1; i >= 0; i--) {
		swap(&arr[0], &arr[i]);

		// Heapify root element to get highest element at root again
		heapify(arr, i, 0);
	}
}

void printArray(int arr[], int N)
{
	for (int i = 0; i < N; i++)
		printf("%d ", arr[i]);
	printf("\n");
}

int main()
{
	int arr[] = { 12, 11, 13, 5, 6, 7 };
	int N = sizeof(arr) / sizeof(arr[0]);

	heapSort(arr, N);
	printf("Sorted array is\n");
	printArray(arr, N);
}





// #include <stdio.h>
// #include <stdlib.h>

// int op = 0;

// void heapify(int h[], int l, int n)
// {
//     int i, k, v, heapify, j;
//     for(i = (n/2); i>=l; i--)
//     {
//         k = i; v = h[k]; heapify = 0;
//         while(heapify == 0 && 2*k <= n)
//         {
//             j = 2*k;
//             op++;
//             if(j<n)
//                 if(h[j]<h[j+1])
//                     j = j+1;
//             if(v>=h[j])
//                 heapify = 1;
//             else
//             {
//                 h[k] = h[j];
//                 k = j;
//             }
//         }
//         h[k] = v;
//     }
//     return;
// }

// void HeapSort(int arr[], int n)
// {
//     int k = 0;
//     for(int i = 1; i<=n; i++)
//     {
//         heapify(arr, 1, n - k);
//         int temp = arr[1];
//         arr[1] = arr[n-k];
//         arr[n-k] = temp;
//         k++;
//     }
// }

// int main()
// {
//     int arr[20], n;
   
//     printf("Enter the Number of Elements : \n");
//     scanf("%d", &n);
    
//     printf("Enter the Elements : \n");
    
//     for(int i = 1; i<=n; i++)
//         scanf("%d", &arr[i]);
    
//     HeapSort(arr, n);
    
//     printf("The Sorted List is : \n");
    
//     for(int i = 1; i<=n; i++)
//         printf("%d ", arr[i]);
//     printf("\n");
    
//     printf("Count = %d\n", op);

//     return 0;
// }