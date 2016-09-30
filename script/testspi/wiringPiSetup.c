#include <wiringPi.h>
#include <stdio.h>

int main(void)
{
  printf ("Raspberry Pi wiringPi test program\n") ;	
  if (wiringPiSetup () == -1)
  {
    printf ("wiringPiSetup error, you may call this fun with root privileges, or call a standalone fun with wiringPiSetup.") ;
    exit (1) ;
  }
  exit (0);
}

