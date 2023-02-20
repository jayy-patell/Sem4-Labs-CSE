//String Matching

#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int func(char pattern[], char text[]){
    int n = strlen(text), m = strlen(pattern);

    //puts(pattern); puts(text);
    int i,j;
    for(i=0; i<=(n-m); i++){
        j=0;
        while(j<m && pattern[j] == text[i+j]){
            j=j+1;
        }
        if(j==m){
            return i;
        }
    }
    return -1;
}

int main(){
    char pattern[20];
    char text[20]; 
    printf("Enter a string: ");
    scanf("%[^\n]%*c", text);
    // for(int i=0; i<20; i++){
    //     scanf("%c", pattern[i]);
    // }
    printf("Enter a substring to find: ");
    scanf("%s", pattern);    //it accepts string only until it finds the first space. 
    // for(int i=0; i<20; i++){
    //     scanf("%c", text[i]);
    // }
    int num = func(pattern,text);
    if(num == -1){
        printf("Substring not found");
    }else{
        printf("Substring starts at: %d", num);
    }
}