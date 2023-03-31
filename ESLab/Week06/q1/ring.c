#include <LPC17xx.h>

unsigned int i,k;
int c=1;

int main(void)
{
		LPC_PINCON->PINSEL0 &= 0xFF0000FF; 
    LPC_PINCON->PINSEL4 &= 0xFCFFFFFF; //for pin 2.12 gpio2 as switch
    LPC_GPIO0->FIODIR |=0x007F8000 ; //config as output pin
    LPC_GPIO2->FIODIR &= 0xFFFFEFFF; //pin 12 is made to be 0 since i/p
    while(1){
        k = LPC_GPIO2->FIOPIN >> 12 ;
        k&=0x00000001; //reads switch press
        if(k==1){
            LPC_GPIO0->FIOPIN=c<<15; 
            if(c==128) c=1; //to reset the ring counter
            else c*=2;   //shifting by 1 bit
        }
        for(i=0;i<50000;i++);//random delay
    }
}