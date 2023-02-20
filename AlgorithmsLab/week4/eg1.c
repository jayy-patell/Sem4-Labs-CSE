//Tower of Hanoi

#include<stdio.h>

void toh(int n,char source, char aux, char dest){
    if(n == 1){
        printf("\n Move disk from %c to %c", source, dest);
        return;
    }
    toh(n-1, source, dest, aux);
    printf("\nMove disc from %c to %c", source,dest);
    toh(n-1, aux, source, dest);
}
int main(){
    int num;
    printf("Enter the number of disks : ");
    scanf("%d", &num);
    toh(num,'a','b','c');
    return 0;
}