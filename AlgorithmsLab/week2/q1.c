#include<stdio.h>

void display(int n){
    printf("gcd is: %d", n);
}

int gcd(int m, int n){
    int t,rem,opcount = 0;
    t = (m>n) ? n:m;
    do{
        opcount++;
        rem = m%t;
        if(rem == 0){
            rem = n%t;
            if(rem == 0){
                display(t);
                return opcount;
            }
        }
        t--;
    }while(t!=0);
}

int main(){
    int m,n,ans;
    printf("Enter m and n: ");
    scanf("%d%d", &m,&n);
    ans = gcd(m,n);
    printf("\nUpcount: %d", ans);
    return 0;
}