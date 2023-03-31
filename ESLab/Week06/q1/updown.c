#include<LPC17xx.h>
int main(void)
{
	unsigned int j,k;
	unsigned long LED;
	int c =0;
	LPC_PINCON->PINSEL0&=0x00000000;
	LPC_PINCON->PINSEL4&=0x00000000;
	
	LPC_GPIO0->FIODIR|=0X007F8000;

	LPC_GPIO2->FIODIR=0X00000000;
	while(1)
	{
		k=LPC_GPIO2->FIOPIN >> 12;
		k &=0x00000001;
	if(k==1)
	c++;
		else
	c--;
		if(c==-1)
	c=255;
		if(c==256)
	c=0;
		LPC_GPIO0->FIOPIN=c<<15;
		for(j=0;j<100000;j++);
		}
	}
