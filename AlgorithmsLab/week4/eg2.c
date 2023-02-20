//Compute nth Fibonacci number

#include <stdio.h>

long Fib(int num)
{
    if (num <= 1)
        return num;
    return Fib(num - 1) + Fib(num - 2);
}

int main()
{
    int num;
    printf("Enter a number: ");
    scanf("%d", &num);

    printf("\nThe %dth fibonacci number is %ld", num, Fib(num));
    return 0;
}