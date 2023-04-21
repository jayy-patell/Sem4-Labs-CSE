//C Program to display a number on the LCD Screen when a dice is rolled.

#include<LPC17xx.h>
#include "lcdmsh.h"
#include<stdlib.h>

unsigned char msg1[13]="Random var:";
unsigned char key;

int main()
{
    unsigned char k;
    lcd_init();

    lcd_comdata(0x80,0);
    delay_lcd(800);
    lcd_puts(&msg1[0]);
    while(1)
    {
        
        if(!(LPC_GPIO2->FIOPIN & 1<<12))
        {
            k = (rand()%6)+1;
            k=k+0x30;
            lcd_comdata(0xc0,0);
            delay_lcd(800);
            lcd_puts(&k);
        }
    }
}
