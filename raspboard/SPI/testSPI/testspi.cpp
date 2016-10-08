#include <wiringPi.h>
#include <wiringPiSPI.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
//
// int req = 4;
// int per = 5;
// int wr = 0;
// int info = 3;
//
//
// #define Mega2560_CS 53
// #define Mega2560_SCK 52
// #define Mega2560_MO 51
// #define Mega2560_MI 50
//
#define RD_CODE 0x03
#define WR_CODE 0x02
#define EDIO 0x3B //Enter Dual I/O access
#define EQIO 0x38 //Enter Quad I/O access
#define RSTIO 0xFF //Reset Dual and Quad I/O access
#define RDMR 0x05 //Read Mode Register
#define WRMR 0x01 //Write Mode Register


#define REQ 4
#define WR 0
#define PER 5
#define INFO 3
#define CHANNEL 0
#define SPI_SPEED 5000000
// #define CS 10
#define MAX_DATA_LEN 1000000 //1MB. Indicate the temp storage size of spi func.

struct spi_tran_struct{
	unsigned char code;
	unsigned char addr[3];
	unsigned char data[MAX_DATA_LEN];
} rd_data, wr_data;



void init(){
	rd_data.code = RD_CODE;
	wr_data.code = WR_CODE;
	pinMode(REQ, OUTPUT);digitalWrite(REQ, LOW);
	pinMode(WR, OUTPUT);digitalWrite(WR, LOW);
	pinMode(PER, INPUT);
	pinMode(INFO, INPUT);
	pinMode(REQ, OUTPUT);digitalWrite(REQ, LOW);
	pinMode(WR, OUTPUT);digitalWrite(WR, LOW);
	// pinMode(CS, OUTPUT);digitalWrite(CS, HIGH);

  wiringPiSPISetup (CHANNEL, SPI_SPEED);
}

int new_info(){
	return digitalRead(INFO);
}

void request(){
	digitalWrite(REQ, HIGH);
	while(LOW == digitalRead(PER));
}


void release(){
	digitalWrite(REQ, LOW);
	digitalWrite(WR, LOW);
}

void addr_conv(struct spi_tran_struct * data, unsigned int addr)
{
	data->addr[0] = addr>>16;
	data->addr[1] = addr>>8;
	data->addr[2] = addr;
}


void write(uint32_t addr, unsigned int size, char *data)
{
	unsigned int i = 0;
	unsigned int num_loop = size / MAX_DATA_LEN;
	unsigned int remain = size % MAX_DATA_LEN;
	digitalWrite(WR, HIGH);
	// digitalWrite(CS, LOW);
	if(num_loop > 0)
	{
		for(i = 0; i< num_loop; i++)
		{
			memcpy(wr_data.data, data + (MAX_DATA_LEN * i), MAX_DATA_LEN);
			addr_conv(&wr_data, addr + (MAX_DATA_LEN * i));
			wr_data.code = WR_CODE;
			wiringPiSPIDataRW (CHANNEL, (char *) & wr_data, MAX_DATA_LEN) ;
		}
	}

		if(remain > 0)
	{
		memcpy(wr_data.data, data + (MAX_DATA_LEN * num_loop), remain);
		addr_conv(&wr_data, addr + (MAX_DATA_LEN * num_loop));
		wr_data.code = WR_CODE;
		wiringPiSPIDataRW (CHANNEL, (char *) & wr_data, remain) ;
	}

	// SPI.transfer(wr_code);
	// SPI.transfer(addr>>16);
	// SPI.transfer(addr>>8);
	// SPI.transfer(addr);
	// for(uint16_t i = 0; i<size; i++){
		// SPI.transfer(data[i]);
	// }

	// digitalWrite(CS, HIGH);
	// digitalWrite(WR, LOW);
}

void read(uint32_t addr, unsigned int size, char *data)
{

	unsigned int i = 0;
	unsigned int num_loop = size / MAX_DATA_LEN;
	unsigned int remain = size % MAX_DATA_LEN;

	if(num_loop > 0)
	{
		for(i = 0; i< num_loop; i++)
		{
			addr_conv(&rd_data, addr + (MAX_DATA_LEN * i));
			rd_data.code = RD_CODE;
			wiringPiSPIDataRW (CHANNEL, (char *) & rd_data, MAX_DATA_LEN) ;
			memcpy(data + (MAX_DATA_LEN * i), rd_data.data, MAX_DATA_LEN);
		}
	}

		if(remain > 0)
	{
		addr_conv(&rd_data, addr + (MAX_DATA_LEN * num_loop));
		rd_data.code = RD_CODE;
		wiringPiSPIDataRW (CHANNEL, (char *) & rd_data, remain) ;
		memcpy(data + (MAX_DATA_LEN * num_loop), rd_data.data, remain);
	}
	// digitalWrite(CS, LOW);

	// SPI.transfer(read_code);
	// SPI.transfer(addr>>16);
	// SPI.transfer(addr>>8);
	// SPI.transfer(addr);

	// for(uint16_t i = 0; i < size; i++)
	// {
	// 	data[i] = SPI.transfer(0);
	// }
	//
	// digitalWrite(CS, HIGH);
}


void q_write(uint32_t addr, unsigned int size, char *data)
{
	request();
	write(addr, size, data);
	release();
}


void q_read(uint32_t addr, unsigned int size, char *data)
{
	request();
	read(addr, size, data);
	release();
}





int main(void)
{
		volatile char res[20] = "";
  printf ("Raspberry Pi wiringPi test program\n") ;

  if (wiringPiSetup () == -1)
  {
    printf ("wiringPiSetup error, you may call this fun with root privileges, or call a standalone fun with wiringPiSetup.\n") ;
    exit (1) ;
  }
	init();
	for(;;)
	{
		memset(res, 0, 20);
		while(LOW == new_info());
		q_read(0, 20, res);
		printf(res);
		printf("\n");
		delay(100);
	}
}
