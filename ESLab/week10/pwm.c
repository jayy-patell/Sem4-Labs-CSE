#include <LPC17xx.h>

void initPWM(void);
void updatePulseWidth(unsigned int pulseWidth);
void delayMS(unsigned int milliseconds);
unsigned int temp3;
int main(void)
{
    LPC_GPIO0->FIODIR = 0xf00;
    initPWM();
    while(1)
    {
        LPC_GPIO0->FIOSET = 0x00000100;
        temp3 = LPC_GPIO0->FIOPIN;
        temp3 &= 0x000000f0;
        temp3 >>= 4;
        if(temp3==1)
            {
            updatePulseWidth(1000);
            //delayMS(1000);
            }
        else if(temp3==2)
            {
            updatePulseWidth(2500);
            //delayMS(1000);
            }
        else if(temp3==4)
            {
            updatePulseWidth(5000);
            //delayMS(1000);
            }
        else if(temp3==8)
            {
            updatePulseWidth(7500);
            //delayMS(1000);
            }
        //delayMS(10000);
    }
	}

void initPWM(void)
{
    LPC_PINCON->PINSEL3|=0x8000;
    LPC_PWM1->PCR=0x1000;
    LPC_PWM1->PR=0;
    LPC_PWM1->MR0=10000;
    LPC_PWM1->MCR=2;
    LPC_PWM1->LER=0xff;
    LPC_PWM1->TCR=0x2;
    LPC_PWM1->TCR=0x9;
}

void updatePulseWidth(unsigned int pulsewidth)
{
    LPC_PWM1->MR4=pulsewidth;
    LPC_PWM1->LER=0xff;
}

void delayMS(unsigned int milliseconds)
{
    LPC_TIM0->CTCR=0x0;
    LPC_TIM0->PR=2;
    LPC_TIM0->TCR=0x02;
    LPC_TIM0->TCR=0x1;
    while(LPC_TIM0->TC<milliseconds);
    LPC_TIM0->TCR=0;
}
