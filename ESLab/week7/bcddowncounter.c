#include<LPC17xx.h>
#include<stdio.h>

unsigned int seg_select[4] = {0<<23, 1<<23, 2<<23, 3<<23};
int dig1=0x09, dig2=0x09, dig3=0x09, dig4=0x09;
unsigned int seg_count=0x00, temp1=0x00;
unsigned char arr_dec[10]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};
unsigned long int i=0;
void delay(void);
void display(void);

int main(void){
	SystemInit();
	SystemCoreClockUpdate();
	
	LPC_PINCON->PINSEL0=0X00000000;
	LPC_PINCON->PINSEL1=0X00000000;
	LPC_PINCON->PINSEL3=0X00000000;
	LPC_GPIO0->FIODIR=0X007F8000;
	LPC_GPIO1->FIODIR=0X07800000;
	
	while(1){
		delay();
		display();
		seg_count +=1;
		if(seg_count == 0x04){
			seg_count = 0x00;
			dig1-=1;
			if(dig1 < 0){
				dig1=0x09;
				dig2-=1;
				if(dig2 < 0){
					dig2=0x09;
					dig3-=1;
					if(dig3 < 0){
						dig3=0x09;
						dig4-=1;
						if(dig4 < 0){
							dig4=0x09;
						}
					}
				}
			}
		}
	}
}

void display(void){
	LPC_GPIO1->FIOPIN = seg_select[seg_count];
	if(seg_count == 0x00){
		temp1=dig1;
	}
	else if(seg_count == 0x01){
		temp1=dig2;
	}
	else if(seg_count == 0x02){//for segment U11
		temp1=dig3;
	}
	else if(seg_count == 0x03){//for segment U11
		temp1=dig4;
	}
	
	LPC_GPIO0->FIOPIN = arr_dec[temp1]<<15;//Taking Data Lines for 7-Seg
	for(i=0;i<100000;i++);
}

void delay(void){
	unsigned int i;
	for(i=0;i<100000;i++);
}