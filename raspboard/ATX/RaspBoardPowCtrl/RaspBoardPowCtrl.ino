// #include <Arduino.h>

/* RaspBoardPowCtrl.ino
* arduino board: pro mini 3.3v(8MHz)
* designed by: Jingwei Pan
* version: 20160720-ver01
*
*/


#define PWR_OFF 0
#define PWR_ON 1
#define SYS_OFF 0
#define SYS_ON 1
#define FORCE_SD_TIME 5000 //about 5 sed.
#define RESET_TIME 300*1000 //about 5 mins.
#define HALT_TIME 120*1000 //about 2 mins.
#define button_delay 20
#define LED_RAMPUP 1
#define LED_RAMPDOWN 0
#define LED_SPEED_HALT 6
#define LED_SPEED_START 1


int pin_Caseswitch = 5;
int pin_PWR5V = 6;
int pin_PSON = 2;
int POWERONLED = 9;
int pin_syson = 3;
int pin_reset = A3;
int pin_halt = 4;

unsigned long led_speed = LED_SPEED_HALT;
// int LED_R = A0;
// int LED_G = A1;
unsigned long time_caseswitch_ms = 0;
unsigned long time_halt_ms = 0;
unsigned long time_reset_ms = 0;
unsigned char led_value = 0;
unsigned char led_status = LED_RAMPDOWN;
char system_status = SYS_OFF;



void setup() {
	pinMode(pin_Caseswitch, INPUT);
	pinMode(pin_PWR5V, INPUT);
	pinMode(pin_syson, INPUT);
	pinMode(pin_reset, INPUT);
	pinMode(pin_halt, OUTPUT);
	pinMode(POWERONLED, OUTPUT);
	pinMode(pin_PSON, OUTPUT);
	// pinMode(LED_G, OUTPUT);
	// pinMode(LED_R, OUTPUT);
	digitalWrite(pin_PSON, LOW);
	// analogWrite(LED_G, 250);
	delay(1000); //wait for ATX power init.
	// analogWrite(LED_R, 255);
}

void loop() {
	while(1)
	{
		delay(led_speed);

		if(digitalRead(pin_syson))
		{
			analogWrite(POWERONLED, 255);
			system_status = SYS_ON;
			time_halt_ms = millis();
			continue;
		}

		if(digitalRead(pin_PWR5V)) led_speed = LED_SPEED_START;
		else led_speed = LED_SPEED_HALT;

		switch(led_value)
		{
			case 0: led_status = LED_RAMPUP;break;
			case 255: led_status = LED_RAMPDOWN;break;
		}

		switch(led_status)
		{
			case LED_RAMPUP: led_value++; break;
			case LED_RAMPDOWN: led_value--; break;
		}

		analogWrite(POWERONLED, led_value);


		if(digitalRead(pin_reset)) time_reset_ms = millis();
		if((SYS_ON==system_status) \
		&& (LOW==digitalRead(pin_syson)) \
		&& ((millis()-time_halt_ms)>HALT_TIME) \
		&& ((millis()-time_reset_ms)>RESET_TIME))
		{
			digitalWrite(pin_PSON, LOW);
			system_status = SYS_OFF;
		}

		if(digitalRead(pin_Caseswitch)) delay(button_delay);
		if(digitalRead(pin_Caseswitch))
		{
			time_caseswitch_ms = millis();
			while(digitalRead(pin_Caseswitch))
			{
				if((millis() - time_caseswitch_ms) > FORCE_SD_TIME)
				{
					digitalWrite(pin_PSON, LOW);
					system_status = SYS_OFF;
					// force to shutdonw;
					break;
				}
			}
			while(digitalRead(pin_Caseswitch));

			if((millis() - time_caseswitch_ms) < FORCE_SD_TIME)
			{
				digitalWrite(pin_PSON, HIGH);
			}
			// if time of pushing smaller than FORCE_SD_TIME turn on ATX;

			delay(1000);
		}
	}

}
