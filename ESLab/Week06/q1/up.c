#include<LPC17xx.h>
int main(){
	int i,j;
	LPC_PINCON->PINSEL0 = 0X00000000;
	LPC_PINCON->PINSEL1 = 0X00000000;
	LPC_GPIO0->FIODIR=0X007F8000;
	while(1){
		for(i=1;i<=255;i++){
			LPC_GPIO0->FIOPIN=(i<<15);
			for(j=1;j<=100000;j++);
		}
	}
}
