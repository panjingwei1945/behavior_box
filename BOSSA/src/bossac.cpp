///////////////////////////////////////////////////////////////////////////////
// BOSSA
//
// Copyright (c) 2011-2012, ShumaTech
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of the <organization> nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
///////////////////////////////////////////////////////////////////////////////
#include <string>
#include <exception>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <fcntl.h>
#include <unistd.h>

#include "CmdOpts.h"
#include "Samba.h"
#include "PortFactory.h"
#include "FlashFactory.h"
#include "Flasher.h"

/**********SOFT ERASE***********/
/**********SOFT ERASE***********/
#define DIRECTION_MAX 35
#define BUFFER_MAX 3
#define IN  0
#define OUT 1

#define LOW  0
#define HIGH 1

#define REQ 6
#define PER 5
#define ERA 7
#define RES 4

static int GPIOExport(int pin)
{
	char buffer[BUFFER_MAX];
	char path[DIRECTION_MAX];
	ssize_t bytes_written;
	int fd;

	snprintf(path, DIRECTION_MAX, "/sys/class/gpio/gpio%d", pin);
  if(0 == access(path, F_OK)) return(0);

	fd = open("/sys/class/gpio/export", O_WRONLY);
	if (-1 == fd) {
		fprintf(stderr, "Failed to open export for writing!\n");
		return(-1);
	}

	bytes_written = snprintf(buffer, BUFFER_MAX, "%d", pin);
	write(fd, buffer, bytes_written);
	close(fd);
	return(0);
}

static int GPIOUnexport(int pin)
{
	char buffer[BUFFER_MAX];
	ssize_t bytes_written;
	int fd;
	char path[DIRECTION_MAX];

	snprintf(path, DIRECTION_MAX, "/sys/class/gpio/gpio%d", pin);
  if(0 != access(path, F_OK)) return(0);

	fd = open("/sys/class/gpio/unexport", O_WRONLY);
	if (-1 == fd) {
		fprintf(stderr, "Failed to open unexport for writing!\n");
		return(-1);
	}

	bytes_written = snprintf(buffer, BUFFER_MAX, "%d", pin);
	write(fd, buffer, bytes_written);
	close(fd);
	return(0);
}

static int GPIODirection(int pin, int dir)
{
	static const char s_directions_str[]  = "in\0out";

	char path[DIRECTION_MAX];
	int fd;

	snprintf(path, DIRECTION_MAX, "/sys/class/gpio/gpio%d/direction", pin);
	fd = open(path, O_WRONLY);
	if (-1 == fd) {
		fprintf(stderr, "Failed to open gpio direction for writing!\n");
		return(-1);
	}

	if (-1 == write(fd, &s_directions_str[IN == dir ? 0 : 3], IN == dir ? 2 : 3)) {
		fprintf(stderr, "Failed to set direction!\n");
		return(-1);
	}

	close(fd);
	return(0);
}

static int GPIORead(int pin)
{
#define VALUE_MAX 30
	char path[VALUE_MAX];
	char value_str[3];
	int fd;

	snprintf(path, VALUE_MAX, "/sys/class/gpio/gpio%d/value", pin);
	fd = open(path, O_RDONLY);
	if (-1 == fd) {
		fprintf(stderr, "Failed to open gpio value for reading!\n");
		return(-1);
	}

	if (-1 == read(fd, value_str, 3)) {
		fprintf(stderr, "Failed to read value!\n");
		return(-1);
	}

	close(fd);

	return(atoi(value_str));
}

static int GPIOWrite(int pin, int value)
{
	static const char s_values_str[] = "01";

	char path[VALUE_MAX];
	int fd;

	snprintf(path, VALUE_MAX, "/sys/class/gpio/gpio%d/value", pin);
	fd = open(path, O_WRONLY);
	if (-1 == fd) {
		fprintf(stderr, "Failed to open gpio value for writing!\n");
		return(-1);
	}

	if (1 != write(fd, &s_values_str[LOW == value ? 0 : 1], 1)) {
		fprintf(stderr, "Failed to write value!\n");
		return(-1);
	}

	close(fd);
	return(0);
}
/**********SOFT ERASE***********/
/**********SOFT ERASE***********/



using namespace std;

class BossaConfig
{
public:
    BossaConfig();
    virtual ~BossaConfig() {}

    bool erase;
    bool write;
    bool read;
    bool verify;
    bool reset;
    bool port;
    bool boot;
    bool bor;
    bool bod;
    bool lock;
    bool unlock;
    bool security;
    bool info;
    bool debug;
    bool help;
    bool forceUsb;
    string forceUsbArg;

    int readArg;
    string portArg;
    int bootArg;
    int bodArg;
    int borArg;
    string lockArg;
    string unlockArg;
};

BossaConfig::BossaConfig()
{
    erase = false;
    write = false;
    read = false;
    verify = false;
    port = false;
    boot = false;
    bod = false;
    bor = false;
    lock = false;
    security = false;
    info = false;
    help = false;
    forceUsb = false;

    readArg = 0;
    bootArg = 1;
    bodArg = 1;
    borArg = 1;

    reset = false;
}

static BossaConfig config;
static Option opts[] =
{
    {
      'e', "erase", &config.erase,
      { ArgNone },
      "erase the entire flash (keep the 8KB of bootloader for SAM Dxx)"
    },
    {
      'w', "write", &config.write,
      { ArgNone },
      "write FILE to the flash; accelerated when\n"
      "combined with erase option"
    },
    {
      'r', "read", &config.read,
      { ArgOptional, ArgInt, "SIZE", { &config.readArg } },
      "read SIZE from flash and store in FILE;\n"
      "read entire flash if SIZE not specified"
    },
    {
      'v', "verify", &config.verify,
      { ArgNone },
      "verify FILE matches flash contents"
    },
    {
      'p', "port", &config.port,
      { ArgRequired, ArgString, "PORT", { &config.portArg } },
      "use serial PORT to communicate to device;\n"
      "default behavior is to auto-scan all serial ports"
    },
    {
      'b', "boot", &config.boot,
      { ArgOptional, ArgInt, "BOOL", { &config.bootArg } },
      "boot from ROM if BOOL is 0;\n"
      "boot from FLASH if BOOL is 1 [default];\n"
      "option is ignored on unsupported devices"
    },
    {
      'c', "bod", &config.bod,
      { ArgOptional, ArgInt, "BOOL", { &config.bodArg } },
      "no brownout detection if BOOL is 0;\n"
      "brownout detection is on if BOOL is 1 [default]"
    },
    {
      't', "bor", &config.bor,
      { ArgOptional, ArgInt, "BOOL", { &config.borArg } },
      "no brownout reset if BOOL is 0;\n"
      "brownout reset is on if BOOL is 1 [default]"
    },
    {
      'l', "lock", &config.lock,
      { ArgOptional, ArgString, "REGION", { &config.lockArg } },
      "lock the flash REGION as a comma-separated list;\n"
      "lock all if not given [default]"
    },
    {
      'u', "unlock", &config.unlock,
      { ArgOptional, ArgString, "REGION", { &config.unlockArg } },
      "unlock the flash REGION as a comma-separated list;\n"
      "unlock all if not given [default]"
    },
    {
      's', "security", &config.security,
      { ArgNone },
      "set the flash security flag"
    },
    {
      'i', "info", &config.info,
      { ArgNone },
      "display device information"
    },
    {
      'd', "debug", &config.debug,
      { ArgNone },
      "print debug messages"
    },
    {
      'h', "help", &config.help,
      { ArgNone },
      "display this help text"
    },
    {
      'U', "force_usb_port", &config.forceUsb,
      { ArgRequired, ArgString, "true/false", { &config.forceUsbArg } },
      "override USB port autodetection"
    },
    {
      'R', "reset", &config.reset,
      { ArgNone },
      "reset CPU (if supported)"
    }
};

bool
autoScan(Samba& samba, PortFactory& portFactory, string& port)
{
    for (port = portFactory.begin();
         port != portFactory.end();
         port = portFactory.next())
    {
        if (config.debug)
            printf("Trying to connect on %s\n", port.c_str());
        if (samba.connect(portFactory.create(port)))
            return true;
    }

    return false;
}

int
help(const char* program)
{
    fprintf(stderr, "Try '%s -h' or '%s --help' for more information\n", program, program);
    return 1;
}

static struct timeval start_time;

void
timer_start()
{
    gettimeofday(&start_time, NULL);
}

float
timer_stop()
{
    struct timeval end;
    gettimeofday(&end, NULL);
    return (end.tv_sec - start_time.tv_sec) + (end.tv_usec - start_time.tv_usec) / 1000000.0;
}

int
main(int argc, char* argv[])
{
    int args;
    char* pos;
    CmdOpts cmd(argc, argv, sizeof(opts) / sizeof(opts[0]), opts);



/**********SOFT ERASE***********/
/**********SOFT ERASE***********/
    GPIOExport(PER);
    sleep(0.01);
    GPIODirection(PER, IN);

    GPIOExport(REQ);
    sleep(0.01);
    GPIODirection(REQ, OUT);
    sleep(0.01);
    GPIOWrite(REQ, HIGH);

    GPIOExport(RES);
    sleep(0.01);
    GPIODirection(RES, OUT);
    sleep(0.01);
    GPIOWrite(RES, HIGH);

    GPIOExport(ERA);
    sleep(0.01);
    GPIODirection(ERA, OUT);
    sleep(0.01);
    GPIOWrite(ERA, HIGH);
/**********SOFT ERASE***********/
/**********SOFT ERASE***********/



    if ((pos = strrchr(argv[0], '/')) || (pos = strrchr(argv[0], '\\')))
        argv[0] = pos + 1;

    if (argc <= 1)
    {
        fprintf(stderr, "%s: you must specify at least one option\n", argv[0]);
        return help(argv[0]);
    }

    args = cmd.parse();
    if (args < 0)
        return help(argv[0]);

    if (config.read && (config.write || config.verify))
    {
        fprintf(stderr, "%s: read option is exclusive of write or verify\n", argv[0]);
        return help(argv[0]);
    }

    if (config.read || config.write || config.verify)
    {
        if (args == argc)
        {
            fprintf(stderr, "%s: missing file\n", argv[0]);
            return help(argv[0]);
        }
        argc--;
    }
    if (args != argc)
    {
        fprintf(stderr, "%s: extra arguments found\n", argv[0]);
        return help(argv[0]);
    }

    if (config.help)
    {
        printf("Usage: %s [OPTION...] [FILE]\n", argv[0]);
        printf("Basic Open Source SAM-BA Application (BOSSA) Version " VERSION "\n"
               "Flash programmer for Atmel SAM devices.\n"
               "Copyright (c) 2011-2012 ShumaTech (http://www.shumatech.com)\n"
               "\n"
               "Examples:\n"
               "  bossac -e -w -v -b image.bin   # Erase flash, write flash with image.bin,\n"
               "                                 # verify the write, and set boot from flash\n"
               "  bossac -r0x10000 image.bin     # Read 64KB from flash and store in image.bin\n"
              );
        printf("\nOptions:\n");
        cmd.usage(stdout);
        printf("\nReport bugs to <bugs@shumatech.com>\n");
        return 1;
    }

    try
    {
        Samba samba;
        PortFactory portFactory;
        FlashFactory flashFactory;

        /**********SOFT ERASE***********/
        /**********SOFT ERASE***********/
        GPIOWrite(REQ, 0);
        int tmp_per = 0;
        while(1)
        {
          tmp_per = GPIORead(PER);
          if (tmp_per == 1) break;
          else if(tmp_per == -1)
          {
            fprintf(stderr, "no permision signal.\n");
            return 1;
          }
        }

        /**********SOFT ERASE***********/
        /**********SOFT ERASE***********/

        if (config.debug)
            samba.setDebug(true);

        bool isUsb = false;
        if (config.forceUsb)
        {
            if (config.forceUsbArg.compare("true")==0)
                isUsb = true;
            else if (config.forceUsbArg.compare("false")==0)
                isUsb = false;
            else
            {
                fprintf(stderr, "Invalid USB value: %s\n", config.forceUsbArg.c_str());
                return 1;
            }
        }

        if (config.port)
        {
            bool res;
            if (config.forceUsb)
                res = samba.connect(portFactory.create(config.portArg, isUsb));
            else
                res = samba.connect(portFactory.create(config.portArg));
            if (!res)
            {
                fprintf(stderr, "No device found on %s\n", config.portArg.c_str());
                return 1;
            }
        }
        else
        {
            string port;
            if (!autoScan(samba, portFactory, port))
            {
                fprintf(stderr, "Auto scan for device failed\n");
                fprintf(stderr, "Try specifying a serial port with the '-p' option\n");
                return 1;
            }
            printf("Device found on %s\n", port.c_str());
        }

        uint32_t chipId = samba.chipId();
        printf( "Atmel SMART device 0x%08x found\n", chipId ) ;

        Flash::Ptr flash = flashFactory.create(samba, chipId);
        if (flash.get() == NULL)
        {
            fprintf(stderr, "Flash for chip ID %08x is not supported\n", chipId);
            return 1;
        }

        Flasher flasher(flash);

        if (config.info)
            flasher.info(samba);

        if (config.unlock)
            flasher.lock(config.unlockArg, false);

        if (config.erase)
        {
            timer_start();
            /**********SOFT ERASE***********/
            /**********SOFT ERASE***********/
            GPIOWrite(ERA, LOW);
            GPIOWrite(RES, LOW);
            sleep(0.01);
            GPIOWrite(RES, HIGH);
            sleep(0.5);
            GPIOWrite(ERA, HIGH);
            /**********SOFT ERASE***********/
            /**********SOFT ERASE***********/
            flasher.erase();
            printf("done in %5.3f seconds\n", timer_stop());
        }

        if (config.write)
        {
            printf("\n");
            timer_start();
            flasher.write(argv[args]);
            printf("done in %5.3f seconds\n", timer_stop());
        }

        if (config.verify)
        {
            printf("\n");
            timer_start();
            if (!flasher.verify(argv[args]))
            {
                return 2;
            }
            printf("done in %5.3f seconds\n", timer_stop());
        }

        if (config.read)
        {
            printf("\n");
            timer_start();
            flasher.read(argv[args], config.readArg);
            printf("done in %5.3f seconds\n", timer_stop());
        }

        if (config.boot)
        {
            printf("Set boot flash %s\n", config.bootArg ? "true" : "false");
            flash->setBootFlash(config.bootArg);
        }

        if (config.bod)
        {
            printf("Set brownout detect %s\n", config.bodArg ? "true" : "false");
            flash->setBod(config.bodArg);
        }

        if (config.bor)
        {
            printf("Set brownout reset %s\n", config.borArg ? "true" : "false");
            flash->setBor(config.borArg);
        }

        if (config.security)
        {
            printf("Set security\n");
            flash->setSecurity();
        }

        if (config.lock)
            flasher.lock(config.lockArg, true);

        if (config.reset)
            samba.reset();
    }
    catch (exception& e)
    {
        fprintf(stderr, "\n%s\n", e.what());
        return 1;
    }
    catch(...)
    {
        fprintf(stderr, "\nUnhandled exception\n");
        return 1;
    }

    return 0;
}
