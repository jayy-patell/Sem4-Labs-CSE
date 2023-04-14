#include<LPC17xx.h>

unsigned seven_seg[10] = {0x3F, 0x06, 0x5B, 0x4F, 0x66};
unsigned int dig_value[4]={1,2,3,4};
unsigned int dig_select[]={0,1,2,3};
unsigned int i=0,j=0;

int main()
{
    LPC_PINCON->PINSEL3 &= 0xFFC03FFF; //1.23 to 1.26
  LPC_PINCON->PINSEL0=0x00000000;
    LPC_PINCON->PINSEL1=0x00000000;
  LPC_GPIO0->FIODIR = 0x007F8000;//configuring as output pins
    LPC_GPIO1->FIODIR |= 0x07800000; //1.23 to 1.26 as output
    
    while(1){
        LPC_GPIO1->FIOPIN = dig_select[i]<<23;
        LPC_GPIO0->FIOPIN = seven_seg[dig_value[i]] << 15;
        i=(i+1)%4;
        for( j=0;j<50000;j++);
    }
}