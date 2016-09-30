	.file	"Arduino-usbserial.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.RingBuffer_Insert,"ax",@progbits
	.type	RingBuffer_Insert, @function
RingBuffer_Insert:
.LFB71:
	.file 1 "Lib/LightweightRingBuff.h"
	.loc 1 160 0
	.cfi_startproc
.LVL0:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 161 0
	movw r30,r24
	subi r30,-128
	sbci r31,-1
	ld r26,Z
	ldd r27,Z+1
	st X,r22
	.loc 1 163 0
	ld r26,Z
	ldd r27,Z+1
	movw r18,r26
	subi r18,-1
	sbci r19,-1
	std Z+1,r19
	st Z,r18
	cp r18,r30
	cpc r19,r31
	brne .L2
	.loc 1 164 0
	adiw r26,1+1
	st X,r25
	st -X,r24
	sbiw r26,1
.L2:
.LBB31:
	.loc 1 166 0
	in r18,__SREG__
.LVL1:
.LBB32:
.LBB33:
	.file 2 "/usr/lib/avr/include/util/atomic.h"
	.loc 2 50 0
/* #APP */
 ;  50 "/usr/lib/avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
.LVL2:
/* #NOAPP */
.LBE33:
.LBE32:
	.loc 1 168 0
	movw r30,r24
	subi r30,124
	sbci r31,-1
	ld r24,Z
.LVL3:
	subi r24,lo8(-(1))
	st Z,r24
.LVL4:
.LBB34:
.LBB35:
	.loc 2 70 0
	out __SREG__,r18
	.loc 2 71 0
	ret
.LBE35:
.LBE34:
.LBE31:
	.cfi_endproc
.LFE71:
	.size	RingBuffer_Insert, .-RingBuffer_Insert
	.section	.text.RingBuffer_Remove,"ax",@progbits
	.type	RingBuffer_Remove, @function
RingBuffer_Remove:
.LFB72:
	.loc 1 183 0
	.cfi_startproc
.LVL5:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 184 0
	movw r26,r24
	subi r26,126
	sbci r27,-1
	ld r30,X+
	ld r31,X
	sbiw r26,1
	ld r20,Z+
.LVL6:
	.loc 1 186 0
	adiw r26,1
	st X,r31
	st -X,r30
	movw r18,r24
	subi r18,-128
	sbci r19,-1
	cp r30,r18
	cpc r31,r19
	brne .L5
	.loc 1 187 0
	st X+,r24
	st X,r25
.L5:
.LBB36:
	.loc 1 189 0
	in r18,__SREG__
.LVL7:
.LBB37:
.LBB38:
	.loc 2 50 0
/* #APP */
 ;  50 "/usr/lib/avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
.LVL8:
/* #NOAPP */
.LBE38:
.LBE37:
	.loc 1 191 0
	movw r30,r24
	subi r30,124
	sbci r31,-1
	ld r25,Z
	subi r25,lo8(-(-1))
	st Z,r25
.LVL9:
.LBB39:
.LBB40:
	.loc 2 70 0
	out __SREG__,r18
	.loc 2 71 0
.LBE40:
.LBE39:
.LBE36:
	.loc 1 195 0
	mov r24,r20
.LVL10:
	ret
	.cfi_endproc
.LFE72:
	.size	RingBuffer_Remove, .-RingBuffer_Remove
	.section	.text.Serial_Init.constprop.2,"ax",@progbits
	.type	Serial_Init.constprop.2, @function
Serial_Init.constprop.2:
.LFB98:
	.file 3 "../../LUFA/Drivers/Peripheral/Serial.h"
	.loc 3 99 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LVL11:
	.loc 3 102 0
	ldi r24,lo8(103)
	ldi r25,0
	sts 204+1,r25
	sts 204,r24
	.loc 3 104 0
	ldi r24,lo8(6)
	sts 202,r24
	.loc 3 105 0
	sts 200,__zero_reg__
	.loc 3 106 0
	ldi r24,lo8(24)
	sts 201,r24
	.loc 3 108 0
	sbi 0xa,3
	.loc 3 109 0
	sbi 0xb,2
	ret
	.cfi_endproc
.LFE98:
	.size	Serial_Init.constprop.2, .-Serial_Init.constprop.2
	.section	.text.setResetPin,"ax",@progbits
.global	setResetPin
	.type	setResetPin, @function
setResetPin:
.LFB85:
	.file 4 "Arduino-usbserial.c"
	.loc 4 195 0
	.cfi_startproc
.LVL12:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 4 199 0
	tst r24
	breq .L8
	.loc 4 203 0
	sbi 0x7,7
	rjmp .L10
.L8:
	.loc 4 213 0
	cbi 0x7,7
.L10:
	.loc 4 215 0
	cbi 0x8,7
	ret
	.cfi_endproc
.LFE85:
	.size	setResetPin, .-setResetPin
	.section	.text.setErasePin,"ax",@progbits
.global	setErasePin
	.type	setErasePin, @function
setErasePin:
.LFB86:
	.loc 4 225 0
	.cfi_startproc
.LVL13:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 4 227 0
	tst r24
	breq .L12
	.loc 4 229 0
	cbi 0x8,6
	ret
.L12:
	.loc 4 235 0
	sbi 0x8,6
	ret
	.cfi_endproc
.LFE86:
	.size	setErasePin, .-setErasePin
	.section	.text.SetupHardware,"ax",@progbits
.global	SetupHardware
	.type	SetupHardware, @function
SetupHardware:
.LFB88:
	.loc 4 475 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 4 479 0
	in r24,0x34
	andi r24,lo8(-9)
	out 0x34,r24
	.loc 4 481 0
	ldi r24,lo8(24)
/* #APP */
 ;  481 "Arduino-usbserial.c" 1
	in __tmp_reg__, __SREG__
	cli
	sts 96, r24
	sts 96, __zero_reg__
	out __SREG__,__tmp_reg__
	
 ;  0 "" 2
	.loc 4 485 0
/* #NOAPP */
	ldi r24,0
	call setResetPin
.LVL14:
	.loc 4 491 0
	sbi 0x8,6
	.loc 4 493 0
	sbi 0x7,6
	.loc 4 499 0
	call Serial_Init.constprop.2
.LVL15:
.LBB43:
.LBB44:
	.file 5 "./Board/LEDs.h"
	.loc 5 69 0
	in r24,0xa
	ori r24,lo8(48)
	out 0xa,r24
	.loc 5 70 0
	in r24,0xb
	ori r24,lo8(48)
	out 0xb,r24
.LBE44:
.LBE43:
	.loc 4 503 0
	call USB_Init
.LVL16:
	.loc 4 509 0
	ldi r24,lo8(4)
	out 0x25,r24
	ret
	.cfi_endproc
.LFE88:
	.size	SetupHardware, .-SetupHardware
	.section	.text.startup.main,"ax",@progbits
.global	main
	.type	main, @function
main:
.LFB87:
	.loc 4 255 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 4 257 0
	call SetupHardware
.LVL17:
.LBB98:
.LBB99:
	.loc 1 87 0
	in r18,__SREG__
.LVL18:
.LBB100:
.LBB101:
	.loc 2 50 0
/* #APP */
 ;  50 "/usr/lib/avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
.LVL19:
/* #NOAPP */
.LBE101:
.LBE100:
	.loc 1 89 0
	ldi r24,lo8(USBtoUSART_Buffer)
	ldi r25,hi8(USBtoUSART_Buffer)
	sts USBtoUSART_Buffer+128+1,r25
	sts USBtoUSART_Buffer+128,r24
	.loc 1 90 0
	sts USBtoUSART_Buffer+130+1,r25
	sts USBtoUSART_Buffer+130,r24
.LVL20:
.LBB102:
.LBB103:
	.loc 2 70 0
	out __SREG__,r18
	.loc 2 71 0
.LVL21:
.LBE103:
.LBE102:
.LBE99:
.LBE98:
.LBB104:
.LBB105:
	.loc 1 87 0
	in r18,__SREG__
.LVL22:
.LBB106:
.LBB107:
	.loc 2 50 0
/* #APP */
 ;  50 "/usr/lib/avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
.LVL23:
/* #NOAPP */
.LBE107:
.LBE106:
	.loc 1 89 0
	ldi r24,lo8(USARTtoUSB_Buffer)
	ldi r25,hi8(USARTtoUSB_Buffer)
	sts USARTtoUSB_Buffer+128+1,r25
	sts USARTtoUSB_Buffer+128,r24
	.loc 1 90 0
	sts USARTtoUSB_Buffer+130+1,r25
	sts USARTtoUSB_Buffer+130,r24
.LVL24:
.LBB108:
.LBB109:
	.loc 2 70 0
	out __SREG__,r18
.LVL25:
	.loc 2 71 0
.LBE109:
.LBE108:
.LBE105:
.LBE104:
	.loc 4 267 0
/* #APP */
 ;  267 "Arduino-usbserial.c" 1
	sei
 ;  0 "" 2
	.loc 4 271 0
/* #NOAPP */
	cbi 0x4,6
	.loc 4 273 0
	sbi 0x5,6
	.loc 4 275 0
	cbi 0x4,7
	.loc 4 277 0
	sbi 0x5,7
	.loc 4 279 0
	sbi 0x4,4
	.loc 4 281 0
	cbi 0x5,4
	.loc 4 283 0
	cbi 0x4,5
	.loc 4 285 0
	sbi 0x5,5
.LBB110:
	.loc 4 367 0
	ldi r29,lo8(3)
.LVL26:
.L49:
	.loc 4 295 0
	sbic 0x3,5
	rjmp .L16
	.loc 4 299 0
/* #APP */
 ;  299 "Arduino-usbserial.c" 1
	cli
 ;  0 "" 2
/* #NOAPP */
.LBB111:
.LBB112:
	.loc 3 115 0
	sts 201,__zero_reg__
	.loc 3 116 0
	sts 200,__zero_reg__
	.loc 3 117 0
	sts 202,__zero_reg__
	.loc 3 119 0
	sts 204+1,__zero_reg__
	sts 204,__zero_reg__
	.loc 3 121 0
	cbi 0xa,3
	.loc 3 122 0
	cbi 0xb,2
.LBE112:
.LBE111:
	.loc 4 303 0
	sbi 0xa,3
	.loc 4 305 0
	sbis 0x3,5
	rjmp .L17
	.loc 4 305 0 is_stmt 0 discriminator 1
	in r24,0xb
	ori r24,lo8(32)
	rjmp .L18
.L17:
	.loc 4 305 0 discriminator 2
	in r24,0xb
	andi r24,lo8(-33)
.L18:
	.loc 4 305 0 discriminator 3
	out 0xb,r24
	.loc 4 307 0 is_stmt 1 discriminator 3
	sbi 0x5,4
.L19:
	.loc 4 309 0 discriminator 1
	sbic 0x3,5
	rjmp .L58
	.loc 4 313 0
	in r24,0x3
	com r24
	rol r24
	clr r24
	rol r24
	call setErasePin
.LVL27:
	.loc 4 315 0
	sbis 0x3,6
	rjmp .L20
	.loc 4 315 0 is_stmt 0 discriminator 1
	in r24,0xb
	ori r24,lo8(8)
	rjmp .L21
.L20:
	.loc 4 315 0 discriminator 2
	in r24,0xb
	andi r24,lo8(-9)
.L21:
	.loc 4 315 0 discriminator 3
	out 0xb,r24
	.loc 4 317 0 is_stmt 1 discriminator 3
	sbis 0x3,6
	rjmp .L22
	.loc 4 317 0 is_stmt 0 discriminator 1
	in r24,0xb
	ori r24,lo8(16)
	rjmp .L23
.L22:
	.loc 4 317 0 discriminator 2
	in r24,0xb
	andi r24,lo8(-17)
.L23:
	.loc 4 317 0 discriminator 3
	out 0xb,r24
	rjmp .L19
.L58:
	.loc 4 321 0 is_stmt 1
	cbi 0x5,4
	.loc 4 323 0
	sbis 0x3,5
	rjmp .L25
	.loc 4 323 0 is_stmt 0 discriminator 1
	in r24,0xb
	ori r24,lo8(32)
	rjmp .L26
.L25:
	.loc 4 323 0 discriminator 2
	in r24,0xb
	andi r24,lo8(-33)
.L26:
	.loc 4 323 0 discriminator 3
	out 0xb,r24
	.loc 4 325 0 is_stmt 1 discriminator 3
	call Serial_Init.constprop.2
.LVL28:
	.loc 4 327 0 discriminator 3
/* #APP */
 ;  327 "Arduino-usbserial.c" 1
	sei
 ;  0 "" 2
/* #NOAPP */
.L16:
.LVL29:
.LBB113:
.LBB114:
.LBB115:
.LBB116:
	.loc 1 111 0
	in r25,__SREG__
.LVL30:
.LBB117:
.LBB118:
	.loc 2 50 0
/* #APP */
 ;  50 "/usr/lib/avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
.LVL31:
/* #NOAPP */
.LBE118:
.LBE117:
	.loc 1 113 0
	lds r24,USBtoUSART_Buffer+132
.LVL32:
.LBB119:
.LBB120:
	.loc 2 70 0
	out __SREG__,r25
	.loc 2 71 0
.LBE120:
.LBE119:
.LBE116:
.LBE115:
.LBE114:
.LBE113:
	.loc 4 333 0
	cpi r24,lo8(-128)
	breq .L28
.LBB121:
	.loc 4 337 0
	ldi r24,lo8(VirtualSerial_CDC_Interface)
	ldi r25,hi8(VirtualSerial_CDC_Interface)
.LVL33:
	call CDC_Device_ReceiveByte
.LVL34:
	.loc 4 343 0
	sbrc r25,7
	rjmp .L28
	.loc 4 345 0
	mov r22,r24
	ldi r24,lo8(USBtoUSART_Buffer)
	ldi r25,hi8(USBtoUSART_Buffer)
.LVL35:
	call RingBuffer_Insert
.LVL36:
.L28:
.LBE121:
.LBB122:
.LBB123:
.LBB124:
	.loc 1 111 0
	in r24,__SREG__
.LVL37:
.LBB125:
.LBB126:
	.loc 2 50 0
/* #APP */
 ;  50 "/usr/lib/avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
.LVL38:
/* #NOAPP */
.LBE126:
.LBE125:
	.loc 1 113 0
	lds r28,USARTtoUSB_Buffer+132
.LVL39:
.LBB127:
.LBB128:
	.loc 2 70 0
	out __SREG__,r24
	.loc 2 71 0
.LBE128:
.LBE127:
.LBE124:
.LBE123:
.LBE122:
	.loc 4 355 0
	sbic 0x15,0
	rjmp .L30
	.loc 4 355 0 is_stmt 0 discriminator 1
	cpi r28,lo8(97)
	brsh .+2
	rjmp .L31
.L30:
	.loc 4 359 0 is_stmt 1
	sbi 0x15,0
	.loc 4 363 0
	lds r24,USARTtoUSB_Buffer+132
.LVL40:
	tst r24
	breq .L33
.LVL41:
.LBB129:
.LBB130:
	.loc 5 75 0
	cbi 0xb,5
.LBE130:
.LBE129:
	.loc 4 367 0
	sts PulseMSRemaining,r29
.LVL42:
.L33:
	.loc 4 375 0 discriminator 1
	tst r28
	breq .L59
	.loc 4 377 0
	ldi r24,lo8(USARTtoUSB_Buffer)
	ldi r25,hi8(USARTtoUSB_Buffer)
	call RingBuffer_Remove
.LVL43:
	mov r22,r24
	ldi r24,lo8(VirtualSerial_CDC_Interface)
	ldi r25,hi8(VirtualSerial_CDC_Interface)
	call CDC_Device_SendByte
.LVL44:
	subi r28,lo8(-(-1))
.LVL45:
	rjmp .L33
.LVL46:
.L59:
	.loc 4 383 0
	lds r24,PulseMSRemaining
	tst r24
	breq .L36
	.loc 4 383 0 is_stmt 0 discriminator 1
	lds r24,PulseMSRemaining
	subi r24,lo8(-(-1))
	sts PulseMSRemaining,r24
	cpse r24,__zero_reg__
	rjmp .L36
.LVL47:
.LBB131:
.LBB132:
	.loc 5 80 0 is_stmt 1
	sbi 0xb,5
.LVL48:
.L36:
.LBE132:
.LBE131:
	.loc 4 391 0
	lds r24,PulseMSRemaining+1
	tst r24
	breq .L39
	.loc 4 391 0 is_stmt 0 discriminator 1
	lds r24,PulseMSRemaining+1
	subi r24,lo8(-(-1))
	sts PulseMSRemaining+1,r24
	cpse r24,__zero_reg__
	rjmp .L39
.LVL49:
.LBB133:
.LBB134:
	.loc 5 80 0 is_stmt 1
	sbi 0xb,4
.LVL50:
.L39:
.LBE134:
.LBE133:
	.loc 4 397 0
	lds r24,ResetTimer
	lds r25,ResetTimer+1
	cp __zero_reg__,r24
	cpc __zero_reg__,r25
	brge .L41
	.loc 4 407 0
	sbiw r24,60
	sbiw r24,61
	brsh .L42
	.loc 4 409 0
	ldi r24,lo8(1)
	rjmp .L56
.L42:
	.loc 4 413 0
	ldi r24,0
.L56:
	call setErasePin
.LVL51:
	.loc 4 421 0
	lds r24,ResetTimer
	lds r25,ResetTimer+1
	sbiw r24,1
	sbiw r24,50
	brsh .L44
	.loc 4 423 0
	ldi r24,lo8(1)
	rjmp .L57
.L44:
	.loc 4 427 0
	ldi r24,0
.L57:
	call setResetPin
.LVL52:
	.loc 4 431 0
	lds r24,ResetTimer
	lds r25,ResetTimer+1
	sbiw r24,1
	sts ResetTimer+1,r25
	sts ResetTimer,r24
	rjmp .L31
.L41:
	.loc 4 435 0
	ldi r24,0
	call setErasePin
.LVL53:
	.loc 4 437 0
	ldi r24,0
	call setResetPin
.LVL54:
.L31:
.LBB135:
.LBB136:
.LBB137:
.LBB138:
	.loc 1 111 0
	in r25,__SREG__
.LVL55:
.LBB139:
.LBB140:
	.loc 2 50 0
/* #APP */
 ;  50 "/usr/lib/avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
.LVL56:
/* #NOAPP */
.LBE140:
.LBE139:
	.loc 1 113 0
	lds r24,USBtoUSART_Buffer+132
.LVL57:
.LBB141:
.LBB142:
	.loc 2 70 0
	out __SREG__,r25
	.loc 2 71 0
.LBE142:
.LBE141:
.LBE138:
.LBE137:
.LBE136:
.LBE135:
	.loc 4 447 0
	tst r24
	breq .L46
	.loc 4 449 0
	ldi r24,lo8(USBtoUSART_Buffer)
	ldi r25,hi8(USBtoUSART_Buffer)
.LVL58:
	call RingBuffer_Remove
.LVL59:
.L48:
.LBB143:
.LBB144:
	.loc 3 142 0
	lds r25,200
	sbrs r25,5
	rjmp .L48
	.loc 3 143 0
	sts 206,r24
.LVL60:
.LBE144:
.LBE143:
.LBB145:
.LBB146:
	.loc 5 75 0
	cbi 0xb,4
.LBE146:
.LBE145:
	.loc 4 453 0
	sts PulseMSRemaining+1,r29
.LVL61:
.L46:
	.loc 4 459 0
	ldi r24,lo8(VirtualSerial_CDC_Interface)
	ldi r25,hi8(VirtualSerial_CDC_Interface)
	call CDC_Device_USBTask
.LVL62:
	.loc 4 461 0
	call USB_USBTask
.LVL63:
.LBE110:
	.loc 4 463 0
	rjmp .L49
	.cfi_endproc
.LFE87:
	.size	main, .-main
	.section	.text.EVENT_USB_Device_ConfigurationChanged,"ax",@progbits
.global	EVENT_USB_Device_ConfigurationChanged
	.type	EVENT_USB_Device_ConfigurationChanged, @function
EVENT_USB_Device_ConfigurationChanged:
.LFB89:
	.loc 4 519 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 4 521 0
	ldi r24,lo8(VirtualSerial_CDC_Interface)
	ldi r25,hi8(VirtualSerial_CDC_Interface)
	jmp CDC_Device_ConfigureEndpoints
.LVL64:
	.cfi_endproc
.LFE89:
	.size	EVENT_USB_Device_ConfigurationChanged, .-EVENT_USB_Device_ConfigurationChanged
	.section	.text.EVENT_USB_Device_UnhandledControlRequest,"ax",@progbits
.global	EVENT_USB_Device_UnhandledControlRequest
	.type	EVENT_USB_Device_UnhandledControlRequest, @function
EVENT_USB_Device_UnhandledControlRequest:
.LFB90:
	.loc 4 531 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 4 533 0
	ldi r24,lo8(VirtualSerial_CDC_Interface)
	ldi r25,hi8(VirtualSerial_CDC_Interface)
	jmp CDC_Device_ProcessControlRequest
.LVL65:
	.cfi_endproc
.LFE90:
	.size	EVENT_USB_Device_UnhandledControlRequest, .-EVENT_USB_Device_UnhandledControlRequest
	.section	.text.EVENT_CDC_Device_LineEncodingChanged,"ax",@progbits
.global	EVENT_CDC_Device_LineEncodingChanged
	.type	EVENT_CDC_Device_LineEncodingChanged, @function
EVENT_CDC_Device_LineEncodingChanged:
.LFB91:
	.loc 4 549 0
	.cfi_startproc
.LVL66:
	push r12
.LCFI0:
	.cfi_def_cfa_offset 3
	.cfi_offset 12, -2
	push r13
.LCFI1:
	.cfi_def_cfa_offset 4
	.cfi_offset 13, -3
	push r14
.LCFI2:
	.cfi_def_cfa_offset 5
	.cfi_offset 14, -4
	push r15
.LCFI3:
	.cfi_def_cfa_offset 6
	.cfi_offset 15, -5
	push r28
.LCFI4:
	.cfi_def_cfa_offset 7
	.cfi_offset 28, -6
/* prologue: function */
/* frame size = 0 */
/* stack size = 5 */
.L__stack_usage = 5
	movw r30,r24
.LVL67:
	.loc 4 555 0
	ldd r24,Z+20
.LVL68:
	cpi r24,lo8(1)
	breq .L72
	cpi r24,lo8(2)
	breq .L65
	.loc 4 551 0
	ldi r28,0
	rjmp .L64
.L65:
.LVL69:
	.loc 4 567 0
	ldi r28,lo8(32)
	.loc 4 569 0
	rjmp .L64
.LVL70:
.L72:
	.loc 4 561 0
	ldi r28,lo8(48)
.LVL71:
.L64:
	.loc 4 575 0
	ldd r24,Z+19
	cpi r24,lo8(2)
	brne .L66
	.loc 4 577 0
	ori r28,lo8(8)
.LVL72:
.L66:
	.loc 4 581 0
	ldd r24,Z+21
	cpi r24,lo8(7)
	breq .L68
	cpi r24,lo8(8)
	breq .L69
	cpi r24,lo8(6)
	brne .L67
	.loc 4 587 0
	ori r28,lo8(2)
.LVL73:
	.loc 4 589 0
	rjmp .L67
.L68:
	.loc 4 593 0
	ori r28,lo8(4)
.LVL74:
	.loc 4 595 0
	rjmp .L67
.L69:
	.loc 4 599 0
	ori r28,lo8(6)
.LVL75:
.L67:
	.loc 4 609 0
	sts 201,__zero_reg__
	.loc 4 611 0
	sts 200,__zero_reg__
	.loc 4 613 0
	sts 202,__zero_reg__
	.loc 4 617 0
	ldd r12,Z+15
	ldd r13,Z+16
	ldd r14,Z+17
	ldd r15,Z+18
.LVL76:
	.loc 4 619 0
	ldi r24,lo8(1)
	ldi r25,-80
	cp r12,r25
	ldi r25,4
	cpc r13,r25
	cpc r14,__zero_reg__
	cpc r15,__zero_reg__
	breq .L71
	ldi r24,0
.L71:
	sts Selected1200BPS,r24
	.loc 4 623 0
	movw r24,r14
	movw r22,r12
	ldi r18,lo8(2)
	ldi r19,0
	ldi r20,0
	ldi r21,0
	call __divmodsi4
.LVL77:
	subi r18,-128
	sbci r19,123
	sbci r20,-31
	sbci r21,-1
	movw r24,r20
	movw r22,r18
	movw r20,r14
	movw r18,r12
	call __udivmodsi4
	subi r18,1
	sbc r19,__zero_reg__
	sts 204+1,r19
	sts 204,r18
	.loc 4 625 0
	sts 202,r28
	.loc 4 627 0
	ldi r24,lo8(2)
	sts 200,r24
	.loc 4 629 0
	ldi r24,lo8(-104)
	sts 201,r24
/* epilogue start */
	.loc 4 631 0
	pop r28
.LVL78:
	pop r15
	pop r14
	pop r13
	pop r12
.LVL79:
	ret
	.cfi_endproc
.LFE91:
	.size	EVENT_CDC_Device_LineEncodingChanged, .-EVENT_CDC_Device_LineEncodingChanged
	.section	.text.__vector_23,"ax",@progbits
.global	__vector_23
	.type	__vector_23, @function
__vector_23:
.LFB92:
	.loc 4 643 0
	.cfi_startproc
	push r1
.LCFI5:
	.cfi_def_cfa_offset 3
	.cfi_offset 1, -2
	push r0
.LCFI6:
	.cfi_def_cfa_offset 4
	.cfi_offset 0, -3
	in r0,__SREG__
	push r0
	clr __zero_reg__
	push r18
.LCFI7:
	.cfi_def_cfa_offset 5
	.cfi_offset 18, -4
	push r19
.LCFI8:
	.cfi_def_cfa_offset 6
	.cfi_offset 19, -5
	push r20
.LCFI9:
	.cfi_def_cfa_offset 7
	.cfi_offset 20, -6
	push r21
.LCFI10:
	.cfi_def_cfa_offset 8
	.cfi_offset 21, -7
	push r22
.LCFI11:
	.cfi_def_cfa_offset 9
	.cfi_offset 22, -8
	push r23
.LCFI12:
	.cfi_def_cfa_offset 10
	.cfi_offset 23, -9
	push r24
.LCFI13:
	.cfi_def_cfa_offset 11
	.cfi_offset 24, -10
	push r25
.LCFI14:
	.cfi_def_cfa_offset 12
	.cfi_offset 25, -11
	push r26
.LCFI15:
	.cfi_def_cfa_offset 13
	.cfi_offset 26, -12
	push r27
.LCFI16:
	.cfi_def_cfa_offset 14
	.cfi_offset 27, -13
	push r30
.LCFI17:
	.cfi_def_cfa_offset 15
	.cfi_offset 30, -14
	push r31
.LCFI18:
	.cfi_def_cfa_offset 16
	.cfi_offset 31, -15
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 15 */
.L__stack_usage = 15
	.loc 4 645 0
	lds r22,206
.LVL80:
	.loc 4 649 0
	in r24,0x1e
	cpi r24,lo8(4)
	brne .L76
	.loc 4 651 0
	ldi r24,lo8(USARTtoUSB_Buffer)
	ldi r25,hi8(USARTtoUSB_Buffer)
	call RingBuffer_Insert
.LVL81:
.L76:
/* epilogue start */
	.loc 4 653 0
	pop r31
	pop r30
	pop r27
	pop r26
	pop r25
	pop r24
	pop r23
	pop r22
	pop r21
	pop r20
	pop r19
	pop r18
	pop r0
	out __SREG__,r0
	pop r0
	pop r1
	reti
	.cfi_endproc
.LFE92:
	.size	__vector_23, .-__vector_23
	.section	.text.EVENT_CDC_Device_ControLineStateChanged,"ax",@progbits
.global	EVENT_CDC_Device_ControLineStateChanged
	.type	EVENT_CDC_Device_ControLineStateChanged, @function
EVENT_CDC_Device_ControLineStateChanged:
.LFB93:
	.loc 4 667 0
	.cfi_startproc
.LVL82:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 4 669 0
	lds r18,CurrentDTRState
	sts PreviousDTRState,r18
	.loc 4 671 0
	lds r19,CurrentRTSState
	sts PreviousRTSState,r19
	.loc 4 673 0
	movw r30,r24
	ldd r25,Z+13
	mov r24,r25
.LVL83:
	andi r24,lo8(1)
	sts CurrentDTRState,r24
	.loc 4 675 0
	lsr r25
	andi r25,1
	sts CurrentRTSState,r25
	.loc 4 679 0
	lds r25,Selected1200BPS
	tst r25
	breq .L79
	.loc 4 683 0
	ldi r24,lo8(120)
	ldi r25,0
	rjmp .L84
.L79:
	.loc 4 685 0
	cpse r18,__zero_reg__
	rjmp .L78
	.loc 4 685 0 is_stmt 0 discriminator 1
	tst r24
	breq .L78
	.loc 4 689 0 is_stmt 1
	ldi r24,lo8(50)
	ldi r25,0
.L84:
	sts ResetTimer+1,r25
	sts ResetTimer,r24
.L78:
	ret
	.cfi_endproc
.LFE93:
	.size	EVENT_CDC_Device_ControLineStateChanged, .-EVENT_CDC_Device_ControLineStateChanged
.global	Selected1200BPS
	.section .bss
	.type	Selected1200BPS, @object
	.size	Selected1200BPS, 1
Selected1200BPS:
	.zero	1
.global	PreviousRTSState
	.type	PreviousRTSState, @object
	.size	PreviousRTSState, 1
PreviousRTSState:
	.zero	1
.global	CurrentRTSState
	.type	CurrentRTSState, @object
	.size	CurrentRTSState, 1
CurrentRTSState:
	.zero	1
.global	PreviousDTRState
	.type	PreviousDTRState, @object
	.size	PreviousDTRState, 1
PreviousDTRState:
	.zero	1
.global	CurrentDTRState
	.type	CurrentDTRState, @object
	.size	CurrentDTRState, 1
CurrentDTRState:
	.zero	1
.global	tries
	.data
	.type	tries, @object
	.size	tries, 2
tries:
	.word	20
.global	ResetTimer
	.section .bss
	.type	ResetTimer, @object
	.size	ResetTimer, 2
ResetTimer:
	.zero	2
.global	VirtualSerial_CDC_Interface
	.data
	.type	VirtualSerial_CDC_Interface, @object
	.size	VirtualSerial_CDC_Interface, 22
VirtualSerial_CDC_Interface:
	.byte	0
	.byte	3
	.word	64
	.byte	0
	.byte	4
	.word	64
	.byte	0
	.byte	2
	.word	8
	.byte	0
	.zero	9
	.comm	PulseMSRemaining,3,1
	.comm	USARTtoUSB_Buffer,133,1
	.comm	USBtoUSART_Buffer,133,1
.global	tmp_erase_cmd_last
	.section .bss
	.type	tmp_erase_cmd_last, @object
	.size	tmp_erase_cmd_last, 1
tmp_erase_cmd_last:
	.zero	1
.global	tmp_erase_cmd
	.type	tmp_erase_cmd, @object
	.size	tmp_erase_cmd, 1
tmp_erase_cmd:
	.zero	1
.global	ex_resettime
	.type	ex_resettime, @object
	.size	ex_resettime, 1
ex_resettime:
	.zero	1
	.text
.Letext0:
	.file 6 "/usr/lib/avr/include/stdint.h"
	.file 7 "../../LUFA/Drivers/USB/HighLevel/../LowLevel/Device.h"
	.file 8 "../../LUFA/Drivers/USB/Class/Device/../Common/CDC.h"
	.file 9 "../../LUFA/Drivers/USB/Class/Device/CDC.h"
	.file 10 "../../LUFA/Drivers/USB/HighLevel/../LowLevel/USBController.h"
	.file 11 "../../LUFA/Drivers/USB/HighLevel/USBTask.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xd62
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF107
	.byte	0x1
	.long	.LASF108
	.long	.LASF109
	.long	.Ldebug_ranges0+0
	.long	0
	.long	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF0
	.uleb128 0x3
	.long	.LASF2
	.byte	0x6
	.byte	0x7a
	.long	0x3b
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x3
	.long	.LASF3
	.byte	0x6
	.byte	0x7b
	.long	0x4d
	.uleb128 0x4
	.byte	0x2
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.long	.LASF4
	.byte	0x6
	.byte	0x7c
	.long	0x5f
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.long	.LASF6
	.uleb128 0x3
	.long	.LASF7
	.byte	0x6
	.byte	0x7e
	.long	0x78
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF9
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF10
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF11
	.uleb128 0x5
	.long	.LASF18
	.byte	0x1
	.byte	0x7
	.byte	0x72
	.long	0xc5
	.uleb128 0x6
	.long	.LASF12
	.sleb128 0
	.uleb128 0x6
	.long	.LASF13
	.sleb128 1
	.uleb128 0x6
	.long	.LASF14
	.sleb128 2
	.uleb128 0x6
	.long	.LASF15
	.sleb128 3
	.uleb128 0x6
	.long	.LASF16
	.sleb128 4
	.uleb128 0x6
	.long	.LASF17
	.sleb128 5
	.byte	0
	.uleb128 0x5
	.long	.LASF19
	.byte	0x1
	.byte	0x8
	.byte	0x9b
	.long	0xe4
	.uleb128 0x6
	.long	.LASF20
	.sleb128 0
	.uleb128 0x6
	.long	.LASF21
	.sleb128 1
	.uleb128 0x6
	.long	.LASF22
	.sleb128 2
	.byte	0
	.uleb128 0x5
	.long	.LASF23
	.byte	0x1
	.byte	0x8
	.byte	0xa3
	.long	0x10f
	.uleb128 0x6
	.long	.LASF24
	.sleb128 0
	.uleb128 0x6
	.long	.LASF25
	.sleb128 1
	.uleb128 0x6
	.long	.LASF26
	.sleb128 2
	.uleb128 0x6
	.long	.LASF27
	.sleb128 3
	.uleb128 0x6
	.long	.LASF28
	.sleb128 4
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF29
	.uleb128 0x7
	.byte	0xd
	.byte	0x9
	.byte	0x64
	.long	0x1ab
	.uleb128 0x8
	.long	.LASF30
	.byte	0x9
	.byte	0x66
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.long	.LASF31
	.byte	0x9
	.byte	0x68
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x8
	.long	.LASF32
	.byte	0x9
	.byte	0x69
	.long	0x54
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x8
	.long	.LASF33
	.byte	0x9
	.byte	0x6a
	.long	0x1ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.long	.LASF34
	.byte	0x9
	.byte	0x6c
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x8
	.long	.LASF35
	.byte	0x9
	.byte	0x6d
	.long	0x54
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x8
	.long	.LASF36
	.byte	0x9
	.byte	0x6e
	.long	0x1ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x8
	.long	.LASF37
	.byte	0x9
	.byte	0x70
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0x8
	.long	.LASF38
	.byte	0x9
	.byte	0x71
	.long	0x54
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0x8
	.long	.LASF39
	.byte	0x9
	.byte	0x72
	.long	0x1ab
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF40
	.uleb128 0x7
	.byte	0x2
	.byte	0x9
	.byte	0x78
	.long	0x1d7
	.uleb128 0x8
	.long	.LASF41
	.byte	0x9
	.byte	0x7a
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.long	.LASF42
	.byte	0x9
	.byte	0x7d
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.byte	0
	.uleb128 0x7
	.byte	0x7
	.byte	0x9
	.byte	0x83
	.long	0x218
	.uleb128 0x8
	.long	.LASF43
	.byte	0x9
	.byte	0x85
	.long	0x6d
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.long	.LASF44
	.byte	0x9
	.byte	0x86
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.long	.LASF45
	.byte	0x9
	.byte	0x89
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x8
	.long	.LASF46
	.byte	0x9
	.byte	0x8c
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.byte	0
	.uleb128 0x7
	.byte	0x9
	.byte	0x9
	.byte	0x76
	.long	0x23d
	.uleb128 0x8
	.long	.LASF47
	.byte	0x9
	.byte	0x81
	.long	0x1b2
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.long	.LASF48
	.byte	0x9
	.byte	0x8d
	.long	0x1d7
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0
	.uleb128 0x7
	.byte	0x16
	.byte	0x9
	.byte	0x62
	.long	0x262
	.uleb128 0x8
	.long	.LASF49
	.byte	0x9
	.byte	0x73
	.long	0x262
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.long	.LASF50
	.byte	0x9
	.byte	0x90
	.long	0x218
	.byte	0x2
	.byte	0x23
	.uleb128 0xd
	.byte	0
	.uleb128 0x9
	.long	0x116
	.uleb128 0x3
	.long	.LASF51
	.byte	0x9
	.byte	0x93
	.long	0x23d
	.uleb128 0x7
	.byte	0x85
	.byte	0x1
	.byte	0x46
	.long	0x2b5
	.uleb128 0x8
	.long	.LASF52
	.byte	0x1
	.byte	0x48
	.long	0x2b5
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0xa
	.string	"In"
	.byte	0x1
	.byte	0x49
	.long	0x2c5
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0xa
	.string	"Out"
	.byte	0x1
	.byte	0x4a
	.long	0x2c5
	.byte	0x3
	.byte	0x23
	.uleb128 0x82
	.uleb128 0x8
	.long	.LASF53
	.byte	0x1
	.byte	0x4b
	.long	0x30
	.byte	0x3
	.byte	0x23
	.uleb128 0x84
	.byte	0
	.uleb128 0xb
	.long	0x30
	.long	0x2c5
	.uleb128 0xc
	.long	0x8d
	.byte	0x7f
	.byte	0
	.uleb128 0xd
	.byte	0x2
	.long	0x30
	.uleb128 0x3
	.long	.LASF54
	.byte	0x1
	.byte	0x4c
	.long	0x272
	.uleb128 0x7
	.byte	0x3
	.byte	0x4
	.byte	0x75
	.long	0x309
	.uleb128 0x8
	.long	.LASF55
	.byte	0x4
	.byte	0x79
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.long	.LASF56
	.byte	0x4
	.byte	0x7b
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x8
	.long	.LASF57
	.byte	0x4
	.byte	0x7d
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0
	.uleb128 0xe
	.long	.LASF60
	.byte	0x2
	.byte	0x44
	.byte	0x1
	.byte	0x3
	.long	0x322
	.uleb128 0xf
	.string	"__s"
	.byte	0x2
	.byte	0x44
	.long	0x322
	.byte	0
	.uleb128 0xd
	.byte	0x2
	.long	0x328
	.uleb128 0x9
	.long	0x30
	.uleb128 0x10
	.long	.LASF110
	.byte	0x2
	.byte	0x30
	.byte	0x1
	.long	0x30
	.byte	0x3
	.uleb128 0x11
	.long	.LASF63
	.byte	0x1
	.byte	0x6b
	.byte	0x1
	.long	0x30
	.byte	0x3
	.long	0x37a
	.uleb128 0x12
	.long	.LASF52
	.byte	0x1
	.byte	0x6b
	.long	0x37a
	.uleb128 0x13
	.long	.LASF53
	.byte	0x1
	.byte	0x6d
	.long	0x30
	.uleb128 0x14
	.uleb128 0x13
	.long	.LASF58
	.byte	0x1
	.byte	0x6f
	.long	0x30
	.uleb128 0x13
	.long	.LASF59
	.byte	0x1
	.byte	0x6f
	.long	0x30
	.byte	0
	.byte	0
	.uleb128 0x9
	.long	0x37f
	.uleb128 0xd
	.byte	0x2
	.long	0x2cb
	.uleb128 0xe
	.long	.LASF61
	.byte	0x3
	.byte	0x8c
	.byte	0x1
	.byte	0x3
	.long	0x39e
	.uleb128 0x12
	.long	.LASF62
	.byte	0x3
	.byte	0x8c
	.long	0x39e
	.byte	0
	.uleb128 0x9
	.long	0x10f
	.uleb128 0x11
	.long	.LASF64
	.byte	0x1
	.byte	0x7f
	.byte	0x1
	.long	0x1ab
	.byte	0x3
	.long	0x3c0
	.uleb128 0x12
	.long	.LASF52
	.byte	0x1
	.byte	0x7f
	.long	0x37a
	.byte	0
	.uleb128 0x11
	.long	.LASF65
	.byte	0x1
	.byte	0x90
	.byte	0x1
	.long	0x1ab
	.byte	0x3
	.long	0x3dd
	.uleb128 0x12
	.long	.LASF52
	.byte	0x1
	.byte	0x90
	.long	0x37a
	.byte	0
	.uleb128 0xe
	.long	.LASF66
	.byte	0x3
	.byte	0x63
	.byte	0x1
	.byte	0x3
	.long	0x401
	.uleb128 0x12
	.long	.LASF67
	.byte	0x3
	.byte	0x63
	.long	0x401
	.uleb128 0x12
	.long	.LASF68
	.byte	0x3
	.byte	0x64
	.long	0x406
	.byte	0
	.uleb128 0x9
	.long	0x6d
	.uleb128 0x9
	.long	0x1ab
	.uleb128 0x15
	.long	.LASF111
	.byte	0x1
	.byte	0x9e
	.byte	0x1
	.long	.LFB71
	.long	.LFE71
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x492
	.uleb128 0x16
	.long	.LASF52
	.byte	0x1
	.byte	0x9e
	.long	0x37a
	.long	.LLST0
	.uleb128 0x17
	.long	.LASF69
	.byte	0x1
	.byte	0x9f
	.long	0x328
	.byte	0x1
	.byte	0x66
	.uleb128 0x18
	.long	.LBB31
	.long	.LBE31
	.uleb128 0x19
	.long	.LASF58
	.byte	0x1
	.byte	0xa6
	.long	0x30
	.byte	0x1
	.byte	0x62
	.uleb128 0x1a
	.long	.LASF59
	.byte	0x1
	.byte	0xa6
	.long	0x30
	.long	.LLST1
	.uleb128 0x1b
	.long	0x32d
	.long	.LBB32
	.long	.LBE32
	.byte	0x1
	.byte	0xa6
	.uleb128 0x1c
	.long	0x309
	.long	.LBB34
	.long	.LBE34
	.byte	0x1
	.byte	0xa6
	.uleb128 0x1d
	.long	0x316
	.byte	0x6
	.byte	0xf2
	.long	.Ldebug_info0+1097
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1e
	.long	.LASF112
	.byte	0x1
	.byte	0xb6
	.byte	0x1
	.long	0x30
	.long	.LFB72
	.long	.LFE72
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x51d
	.uleb128 0x16
	.long	.LASF52
	.byte	0x1
	.byte	0xb6
	.long	0x37a
	.long	.LLST2
	.uleb128 0x19
	.long	.LASF69
	.byte	0x1
	.byte	0xb8
	.long	0x30
	.byte	0x1
	.byte	0x64
	.uleb128 0x18
	.long	.LBB36
	.long	.LBE36
	.uleb128 0x19
	.long	.LASF58
	.byte	0x1
	.byte	0xbd
	.long	0x30
	.byte	0x1
	.byte	0x62
	.uleb128 0x1a
	.long	.LASF59
	.byte	0x1
	.byte	0xbd
	.long	0x30
	.long	.LLST3
	.uleb128 0x1b
	.long	0x32d
	.long	.LBB37
	.long	.LBE37
	.byte	0x1
	.byte	0xbd
	.uleb128 0x1c
	.long	0x309
	.long	.LBB39
	.long	.LBE39
	.byte	0x1
	.byte	0xbd
	.uleb128 0x1d
	.long	0x316
	.byte	0x6
	.byte	0xf2
	.long	.Ldebug_info0+1236
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1f
	.long	0x3dd
	.long	.LFB98
	.long	.LFE98
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x541
	.uleb128 0x20
	.long	0x3f5
	.byte	0
	.uleb128 0x21
	.long	0x3ea
	.word	0x2580
	.byte	0
	.uleb128 0x22
	.byte	0x1
	.long	.LASF70
	.byte	0x4
	.byte	0xc3
	.byte	0x1
	.long	.LFB85
	.long	.LFE85
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x567
	.uleb128 0x23
	.string	"v"
	.byte	0x4
	.byte	0xc3
	.long	0x1ab
	.byte	0x1
	.byte	0x68
	.byte	0
	.uleb128 0x22
	.byte	0x1
	.long	.LASF71
	.byte	0x4
	.byte	0xe1
	.byte	0x1
	.long	.LFB86
	.long	.LFE86
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x58d
	.uleb128 0x23
	.string	"v"
	.byte	0x4
	.byte	0xe1
	.long	0x1ab
	.byte	0x1
	.byte	0x68
	.byte	0
	.uleb128 0x24
	.long	.LASF74
	.byte	0x5
	.byte	0x43
	.byte	0x1
	.byte	0x3
	.uleb128 0x25
	.byte	0x1
	.long	.LASF72
	.byte	0x4
	.word	0x1d9
	.byte	0x1
	.long	.LFB88
	.long	.LFE88
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x5e7
	.uleb128 0x26
	.long	0x58d
	.long	.LBB43
	.long	.LBE43
	.byte	0x4
	.word	0x1f5
	.uleb128 0x27
	.long	.LVL14
	.long	0x541
	.long	0x5d4
	.uleb128 0x28
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0x29
	.long	.LVL15
	.long	0x51d
	.uleb128 0x29
	.long	.LVL16
	.long	0xcde
	.byte	0
	.uleb128 0xe
	.long	.LASF73
	.byte	0x1
	.byte	0x55
	.byte	0x1
	.byte	0x3
	.long	0x618
	.uleb128 0x12
	.long	.LASF52
	.byte	0x1
	.byte	0x55
	.long	0x37a
	.uleb128 0x14
	.uleb128 0x13
	.long	.LASF58
	.byte	0x1
	.byte	0x57
	.long	0x30
	.uleb128 0x13
	.long	.LASF59
	.byte	0x1
	.byte	0x57
	.long	0x30
	.byte	0
	.byte	0
	.uleb128 0x24
	.long	.LASF75
	.byte	0x3
	.byte	0x71
	.byte	0x1
	.byte	0x3
	.uleb128 0xe
	.long	.LASF76
	.byte	0x5
	.byte	0x49
	.byte	0x1
	.byte	0x3
	.long	0x63a
	.uleb128 0x12
	.long	.LASF77
	.byte	0x5
	.byte	0x49
	.long	0x328
	.byte	0
	.uleb128 0xe
	.long	.LASF78
	.byte	0x5
	.byte	0x4e
	.byte	0x1
	.byte	0x3
	.long	0x653
	.uleb128 0x12
	.long	.LASF77
	.byte	0x5
	.byte	0x4e
	.long	0x328
	.byte	0
	.uleb128 0x2a
	.byte	0x1
	.long	.LASF113
	.byte	0x4
	.byte	0xfd
	.byte	0x1
	.long	0x4d
	.long	.LFB87
	.long	.LFE87
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0xaac
	.uleb128 0x2b
	.long	0x5e7
	.long	.LBB98
	.long	.LBE98
	.byte	0x4
	.word	0x105
	.long	0x6d6
	.uleb128 0x1d
	.long	0x5f4
	.byte	0x6
	.byte	0x3
	.long	USBtoUSART_Buffer
	.byte	0x9f
	.uleb128 0x18
	.long	.LBB99
	.long	.LBE99
	.uleb128 0x2c
	.long	0x600
	.long	.LLST4
	.uleb128 0x2c
	.long	0x60b
	.long	.LLST5
	.uleb128 0x1b
	.long	0x32d
	.long	.LBB100
	.long	.LBE100
	.byte	0x1
	.byte	0x57
	.uleb128 0x1c
	.long	0x309
	.long	.LBB102
	.long	.LBE102
	.byte	0x1
	.byte	0x57
	.uleb128 0x2d
	.long	0x316
	.long	.LLST6
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2b
	.long	0x5e7
	.long	.LBB104
	.long	.LBE104
	.byte	0x4
	.word	0x107
	.long	0x73b
	.uleb128 0x1d
	.long	0x5f4
	.byte	0x6
	.byte	0x3
	.long	USARTtoUSB_Buffer
	.byte	0x9f
	.uleb128 0x18
	.long	.LBB105
	.long	.LBE105
	.uleb128 0x2c
	.long	0x600
	.long	.LLST7
	.uleb128 0x2c
	.long	0x60b
	.long	.LLST8
	.uleb128 0x1b
	.long	0x32d
	.long	.LBB106
	.long	.LBE106
	.byte	0x1
	.byte	0x57
	.uleb128 0x1c
	.long	0x309
	.long	.LBB108
	.long	.LBE108
	.byte	0x1
	.byte	0x57
	.uleb128 0x2d
	.long	0x316
	.long	.LLST9
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2e
	.long	.LBB110
	.long	.LBE110
	.long	0xaa2
	.uleb128 0x2f
	.long	.LASF79
	.byte	0x4
	.word	0x161
	.long	0x30
	.long	.LLST10
	.uleb128 0x26
	.long	0x618
	.long	.LBB111
	.long	.LBE111
	.byte	0x4
	.word	0x12d
	.uleb128 0x2b
	.long	0x3a3
	.long	.LBB113
	.long	.LBE113
	.byte	0x4
	.word	0x14d
	.long	0x7f5
	.uleb128 0x1d
	.long	0x3b4
	.byte	0x6
	.byte	0x3
	.long	USBtoUSART_Buffer
	.byte	0x9f
	.uleb128 0x1c
	.long	0x33a
	.long	.LBB114
	.long	.LBE114
	.byte	0x1
	.byte	0x81
	.uleb128 0x30
	.long	0x34b
	.uleb128 0x18
	.long	.LBB115
	.long	.LBE115
	.uleb128 0x2c
	.long	0x356
	.long	.LLST11
	.uleb128 0x18
	.long	.LBB116
	.long	.LBE116
	.uleb128 0x2c
	.long	0x362
	.long	.LLST12
	.uleb128 0x2c
	.long	0x36d
	.long	.LLST13
	.uleb128 0x1b
	.long	0x32d
	.long	.LBB117
	.long	.LBE117
	.byte	0x1
	.byte	0x6f
	.uleb128 0x1c
	.long	0x309
	.long	.LBB119
	.long	.LBE119
	.byte	0x1
	.byte	0x6f
	.uleb128 0x2d
	.long	0x316
	.long	.LLST14
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2e
	.long	.LBB121
	.long	.LBE121
	.long	0x847
	.uleb128 0x2f
	.long	.LASF80
	.byte	0x4
	.word	0x151
	.long	0x42
	.long	.LLST15
	.uleb128 0x27
	.long	.LVL34
	.long	0xce9
	.long	0x82e
	.uleb128 0x28
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x5
	.byte	0x3
	.long	VirtualSerial_CDC_Interface
	.byte	0
	.uleb128 0x31
	.long	.LVL36
	.long	0x40b
	.uleb128 0x28
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x5
	.byte	0x3
	.long	USBtoUSART_Buffer
	.byte	0
	.byte	0
	.uleb128 0x2b
	.long	0x33a
	.long	.LBB122
	.long	.LBE122
	.byte	0x4
	.word	0x161
	.long	0x8b8
	.uleb128 0x30
	.long	0x34b
	.uleb128 0x18
	.long	.LBB123
	.long	.LBE123
	.uleb128 0x2c
	.long	0x356
	.long	.LLST16
	.uleb128 0x18
	.long	.LBB124
	.long	.LBE124
	.uleb128 0x2c
	.long	0x362
	.long	.LLST17
	.uleb128 0x2c
	.long	0x36d
	.long	.LLST18
	.uleb128 0x1b
	.long	0x32d
	.long	.LBB125
	.long	.LBE125
	.byte	0x1
	.byte	0x6f
	.uleb128 0x1c
	.long	0x309
	.long	.LBB127
	.long	.LBE127
	.byte	0x1
	.byte	0x6f
	.uleb128 0x2d
	.long	0x316
	.long	.LLST19
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2b
	.long	0x621
	.long	.LBB129
	.long	.LBE129
	.byte	0x4
	.word	0x16d
	.long	0x8d6
	.uleb128 0x2d
	.long	0x62e
	.long	.LLST20
	.byte	0
	.uleb128 0x2b
	.long	0x63a
	.long	.LBB131
	.long	.LBE131
	.byte	0x4
	.word	0x181
	.long	0x8f4
	.uleb128 0x2d
	.long	0x647
	.long	.LLST21
	.byte	0
	.uleb128 0x2b
	.long	0x63a
	.long	.LBB133
	.long	.LBE133
	.byte	0x4
	.word	0x189
	.long	0x912
	.uleb128 0x2d
	.long	0x647
	.long	.LLST22
	.byte	0
	.uleb128 0x2b
	.long	0x3c0
	.long	.LBB135
	.long	.LBE135
	.byte	0x4
	.word	0x1bf
	.long	0x9a2
	.uleb128 0x1d
	.long	0x3d1
	.byte	0x6
	.byte	0x3
	.long	USBtoUSART_Buffer
	.byte	0x9f
	.uleb128 0x1c
	.long	0x33a
	.long	.LBB136
	.long	.LBE136
	.byte	0x1
	.byte	0x92
	.uleb128 0x30
	.long	0x34b
	.uleb128 0x18
	.long	.LBB137
	.long	.LBE137
	.uleb128 0x2c
	.long	0x356
	.long	.LLST23
	.uleb128 0x18
	.long	.LBB138
	.long	.LBE138
	.uleb128 0x2c
	.long	0x362
	.long	.LLST24
	.uleb128 0x2c
	.long	0x36d
	.long	.LLST25
	.uleb128 0x1b
	.long	0x32d
	.long	.LBB139
	.long	.LBE139
	.byte	0x1
	.byte	0x6f
	.uleb128 0x1c
	.long	0x309
	.long	.LBB141
	.long	.LBE141
	.byte	0x1
	.byte	0x6f
	.uleb128 0x1d
	.long	0x316
	.byte	0x6
	.byte	0xf2
	.long	.Ldebug_info0+2401
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2b
	.long	0x385
	.long	.LBB143
	.long	.LBE143
	.byte	0x4
	.word	0x1c1
	.long	0x9c0
	.uleb128 0x2d
	.long	0x392
	.long	.LLST26
	.byte	0
	.uleb128 0x2b
	.long	0x621
	.long	.LBB145
	.long	.LBE145
	.byte	0x4
	.word	0x1c3
	.long	0x9de
	.uleb128 0x2d
	.long	0x62e
	.long	.LLST27
	.byte	0
	.uleb128 0x29
	.long	.LVL27
	.long	0x567
	.uleb128 0x29
	.long	.LVL28
	.long	0x51d
	.uleb128 0x27
	.long	.LVL43
	.long	0x492
	.long	0xa0c
	.uleb128 0x28
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x5
	.byte	0x3
	.long	USARTtoUSB_Buffer
	.byte	0
	.uleb128 0x27
	.long	.LVL44
	.long	0xd02
	.long	0xa28
	.uleb128 0x28
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x5
	.byte	0x3
	.long	VirtualSerial_CDC_Interface
	.byte	0
	.uleb128 0x29
	.long	.LVL51
	.long	0x567
	.uleb128 0x29
	.long	.LVL52
	.long	0x541
	.uleb128 0x27
	.long	.LVL53
	.long	0x567
	.long	0xa4d
	.uleb128 0x28
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0x27
	.long	.LVL54
	.long	0x541
	.long	0xa60
	.uleb128 0x28
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0x27
	.long	.LVL59
	.long	0x492
	.long	0xa7c
	.uleb128 0x28
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x5
	.byte	0x3
	.long	USBtoUSART_Buffer
	.byte	0
	.uleb128 0x27
	.long	.LVL62
	.long	0xd1f
	.long	0xa98
	.uleb128 0x28
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x5
	.byte	0x3
	.long	VirtualSerial_CDC_Interface
	.byte	0
	.uleb128 0x29
	.long	.LVL63
	.long	0xd33
	.byte	0
	.uleb128 0x29
	.long	.LVL17
	.long	0x596
	.byte	0
	.uleb128 0x25
	.byte	0x1
	.long	.LASF81
	.byte	0x4
	.word	0x205
	.byte	0x1
	.long	.LFB89
	.long	.LFE89
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0xae1
	.uleb128 0x32
	.long	.LVL64
	.byte	0x1
	.long	0xd3d
	.uleb128 0x28
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x5
	.byte	0x3
	.long	VirtualSerial_CDC_Interface
	.byte	0
	.byte	0
	.uleb128 0x25
	.byte	0x1
	.long	.LASF82
	.byte	0x4
	.word	0x211
	.byte	0x1
	.long	.LFB90
	.long	.LFE90
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0xb16
	.uleb128 0x32
	.long	.LVL65
	.byte	0x1
	.long	0xd55
	.uleb128 0x28
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x5
	.byte	0x3
	.long	VirtualSerial_CDC_Interface
	.byte	0
	.byte	0
	.uleb128 0x33
	.byte	0x1
	.long	.LASF83
	.byte	0x4
	.word	0x223
	.byte	0x1
	.long	.LFB91
	.long	.LFE91
	.long	.LLST28
	.byte	0x1
	.long	0xb62
	.uleb128 0x34
	.long	.LASF84
	.byte	0x4
	.word	0x223
	.long	0xb62
	.long	.LLST29
	.uleb128 0x2f
	.long	.LASF85
	.byte	0x4
	.word	0x227
	.long	0x30
	.long	.LLST30
	.uleb128 0x35
	.string	"bps"
	.byte	0x4
	.word	0x269
	.long	0x66
	.long	.LLST31
	.byte	0
	.uleb128 0x9
	.long	0xb67
	.uleb128 0xd
	.byte	0x2
	.long	0x267
	.uleb128 0x33
	.byte	0x1
	.long	.LASF86
	.byte	0x4
	.word	0x281
	.byte	0x1
	.long	.LFB92
	.long	.LFE92
	.long	.LLST32
	.byte	0x1
	.long	0xbb1
	.uleb128 0x2f
	.long	.LASF80
	.byte	0x4
	.word	0x285
	.long	0x30
	.long	.LLST33
	.uleb128 0x31
	.long	.LVL81
	.long	0x40b
	.uleb128 0x28
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x5
	.byte	0x3
	.long	USARTtoUSB_Buffer
	.byte	0
	.byte	0
	.uleb128 0x25
	.byte	0x1
	.long	.LASF87
	.byte	0x4
	.word	0x299
	.byte	0x1
	.long	.LFB93
	.long	.LFE93
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0xbdd
	.uleb128 0x34
	.long	.LASF84
	.byte	0x4
	.word	0x299
	.long	0xb62
	.long	.LLST34
	.byte	0
	.uleb128 0x36
	.long	.LASF88
	.byte	0x4
	.byte	0x5f
	.long	0x3b
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	ex_resettime
	.uleb128 0x36
	.long	.LASF89
	.byte	0x4
	.byte	0x61
	.long	0x1ab
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	tmp_erase_cmd
	.uleb128 0x36
	.long	.LASF90
	.byte	0x4
	.byte	0x63
	.long	0x1ab
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	tmp_erase_cmd_last
	.uleb128 0x36
	.long	.LASF91
	.byte	0x4
	.byte	0x69
	.long	0x2cb
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	USBtoUSART_Buffer
	.uleb128 0x36
	.long	.LASF92
	.byte	0x4
	.byte	0x6f
	.long	0x2cb
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	USARTtoUSB_Buffer
	.uleb128 0x36
	.long	.LASF93
	.byte	0x4
	.byte	0x7f
	.long	0xc49
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	PulseMSRemaining
	.uleb128 0x37
	.long	0x2d6
	.uleb128 0x36
	.long	.LASF94
	.byte	0x4
	.byte	0x8b
	.long	0x267
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	VirtualSerial_CDC_Interface
	.uleb128 0x36
	.long	.LASF95
	.byte	0x4
	.byte	0xb3
	.long	0x4d
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	ResetTimer
	.uleb128 0x36
	.long	.LASF96
	.byte	0x4
	.byte	0xb5
	.long	0x4d
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	tries
	.uleb128 0x36
	.long	.LASF97
	.byte	0x4
	.byte	0xb7
	.long	0x1ab
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	CurrentDTRState
	.uleb128 0x36
	.long	.LASF98
	.byte	0x4
	.byte	0xb9
	.long	0x1ab
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	PreviousDTRState
	.uleb128 0x36
	.long	.LASF99
	.byte	0x4
	.byte	0xbb
	.long	0x1ab
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	CurrentRTSState
	.uleb128 0x36
	.long	.LASF100
	.byte	0x4
	.byte	0xbd
	.long	0x1ab
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	PreviousRTSState
	.uleb128 0x36
	.long	.LASF101
	.byte	0x4
	.byte	0xbf
	.long	0x1ab
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	Selected1200BPS
	.uleb128 0x38
	.byte	0x1
	.long	.LASF104
	.byte	0xa
	.word	0x123
	.byte	0x1
	.byte	0x1
	.uleb128 0x39
	.byte	0x1
	.long	.LASF102
	.byte	0x9
	.word	0x106
	.byte	0x1
	.long	0x42
	.byte	0x1
	.long	0xd02
	.uleb128 0x3a
	.long	0xb62
	.byte	0
	.uleb128 0x3b
	.byte	0x1
	.long	.LASF103
	.byte	0x9
	.byte	0xe9
	.byte	0x1
	.long	0x30
	.byte	0x1
	.long	0xd1f
	.uleb128 0x3a
	.long	0xb62
	.uleb128 0x3a
	.long	0x328
	.byte	0
	.uleb128 0x3c
	.byte	0x1
	.long	.LASF114
	.byte	0x9
	.byte	0xac
	.byte	0x1
	.byte	0x1
	.long	0xd33
	.uleb128 0x3a
	.long	0xb62
	.byte	0
	.uleb128 0x3d
	.byte	0x1
	.long	.LASF105
	.byte	0xb
	.byte	0xb2
	.byte	0x1
	.byte	0x1
	.uleb128 0x3b
	.byte	0x1
	.long	.LASF106
	.byte	0x9
	.byte	0x9e
	.byte	0x1
	.long	0x1ab
	.byte	0x1
	.long	0xd55
	.uleb128 0x3a
	.long	0xb62
	.byte	0
	.uleb128 0x3e
	.byte	0x1
	.long	.LASF115
	.byte	0x9
	.byte	0xa5
	.byte	0x1
	.byte	0x1
	.uleb128 0x3a
	.long	0xb62
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0xb
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x1d
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x1d
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x32
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2115
	.uleb128 0xc
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x33
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x34
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x35
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x36
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x37
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x38
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x39
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3a
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3d
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x3e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LVL0
	.long	.LVL3
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL3
	.long	.LFE71
	.word	0x4
	.byte	0x8e
	.sleb128 -132
	.byte	0x9f
	.long	0
	.long	0
.LLST1:
	.long	.LVL2
	.long	.LVL4
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL4
	.long	.LFE71
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
.LLST2:
	.long	.LVL5
	.long	.LVL10
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL10
	.long	.LFE72
	.word	0x4
	.byte	0x8e
	.sleb128 -132
	.byte	0x9f
	.long	0
	.long	0
.LLST3:
	.long	.LVL8
	.long	.LVL9
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL9
	.long	.LFE72
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
.LLST4:
	.long	.LVL18
	.long	.LVL22
	.word	0x1
	.byte	0x62
	.long	.LVL22
	.long	.LVL25
	.word	0x2
	.byte	0x8
	.byte	0x5f
	.long	0
	.long	0
.LLST5:
	.long	.LVL19
	.long	.LVL20
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL20
	.long	.LFE87
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
.LLST6:
	.long	.LVL20
	.long	.LVL24
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+1690
	.sleb128 0
	.long	.LVL24
	.long	.LVL26
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+1791
	.sleb128 0
	.long	.LVL32
	.long	.LVL39
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+1975
	.sleb128 0
	.long	.LVL39
	.long	.LVL57
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+2171
	.sleb128 0
	.long	.LVL57
	.long	.LFE87
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+2401
	.sleb128 0
	.long	0
	.long	0
.LLST7:
	.long	.LVL22
	.long	.LVL26
	.word	0x1
	.byte	0x62
	.long	0
	.long	0
.LLST8:
	.long	.LVL23
	.long	.LVL24
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL24
	.long	.LFE87
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
.LLST9:
	.long	.LVL24
	.long	.LVL26
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+1791
	.sleb128 0
	.long	.LVL32
	.long	.LVL39
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+1975
	.sleb128 0
	.long	.LVL39
	.long	.LVL57
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+2171
	.sleb128 0
	.long	.LVL57
	.long	.LFE87
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+2401
	.sleb128 0
	.long	0
	.long	0
.LLST10:
	.long	.LVL42
	.long	.LVL45
	.word	0x3
	.byte	0x8c
	.sleb128 -1
	.byte	0x9f
	.long	.LVL45
	.long	.LVL46
	.word	0x1
	.byte	0x6c
	.long	.LVL46
	.long	.LVL54
	.word	0x3
	.byte	0x8c
	.sleb128 -1
	.byte	0x9f
	.long	0
	.long	0
.LLST11:
	.long	.LVL32
	.long	.LVL33
	.word	0x1
	.byte	0x68
	.long	.LVL33
	.long	.LVL34-1
	.word	0x5
	.byte	0x3
	.long	USBtoUSART_Buffer+132
	.long	0
	.long	0
.LLST12:
	.long	.LVL30
	.long	.LVL34-1
	.word	0x1
	.byte	0x69
	.long	0
	.long	0
.LLST13:
	.long	.LVL31
	.long	.LVL32
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL32
	.long	.LFE87
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
.LLST14:
	.long	.LVL32
	.long	.LVL39
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+1975
	.sleb128 0
	.long	.LVL39
	.long	.LVL57
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+2171
	.sleb128 0
	.long	.LVL57
	.long	.LFE87
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+2401
	.sleb128 0
	.long	0
	.long	0
.LLST15:
	.long	.LVL34
	.long	.LVL35
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST16:
	.long	.LVL39
	.long	.LVL42
	.word	0x1
	.byte	0x6c
	.long	0
	.long	0
.LLST17:
	.long	.LVL37
	.long	.LVL40
	.word	0x1
	.byte	0x68
	.long	.LVL40
	.long	.LVL42
	.word	0x2
	.byte	0x8
	.byte	0x5f
	.long	0
	.long	0
.LLST18:
	.long	.LVL38
	.long	.LVL39
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL39
	.long	.LFE87
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
.LLST19:
	.long	.LVL39
	.long	.LVL57
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+2171
	.sleb128 0
	.long	.LVL57
	.long	.LFE87
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+2401
	.sleb128 0
	.long	0
	.long	0
.LLST20:
	.long	.LVL41
	.long	.LVL42
	.word	0x3
	.byte	0x8
	.byte	0x20
	.byte	0x9f
	.long	0
	.long	0
.LLST21:
	.long	.LVL47
	.long	.LVL48
	.word	0x3
	.byte	0x8
	.byte	0x20
	.byte	0x9f
	.long	0
	.long	0
.LLST22:
	.long	.LVL49
	.long	.LVL50
	.word	0x2
	.byte	0x40
	.byte	0x9f
	.long	0
	.long	0
.LLST23:
	.long	.LVL57
	.long	.LVL58
	.word	0x1
	.byte	0x68
	.long	.LVL58
	.long	.LVL59-1
	.word	0x5
	.byte	0x3
	.long	USBtoUSART_Buffer+132
	.long	0
	.long	0
.LLST24:
	.long	.LVL55
	.long	.LVL59-1
	.word	0x1
	.byte	0x69
	.long	0
	.long	0
.LLST25:
	.long	.LVL56
	.long	.LVL57
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL57
	.long	.LFE87
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
.LLST26:
	.long	.LVL59
	.long	.LVL61
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST27:
	.long	.LVL60
	.long	.LVL61
	.word	0x2
	.byte	0x40
	.byte	0x9f
	.long	0
	.long	0
.LLST28:
	.long	.LFB91
	.long	.LCFI0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI0
	.long	.LCFI1
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI1
	.long	.LCFI2
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI2
	.long	.LCFI3
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI3
	.long	.LCFI4
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 6
	.long	.LCFI4
	.long	.LFE91
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 7
	.long	0
	.long	0
.LLST29:
	.long	.LVL66
	.long	.LVL68
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL68
	.long	.LVL77
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	.LVL77
	.long	.LFE91
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	0
	.long	0
.LLST30:
	.long	.LVL67
	.long	.LVL69
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL69
	.long	.LVL70
	.word	0x3
	.byte	0x8
	.byte	0x20
	.byte	0x9f
	.long	.LVL70
	.long	.LVL71
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL71
	.long	.LVL78
	.word	0x1
	.byte	0x6c
	.long	0
	.long	0
.LLST31:
	.long	.LVL76
	.long	.LVL79
	.word	0xc
	.byte	0x5c
	.byte	0x93
	.uleb128 0x1
	.byte	0x5d
	.byte	0x93
	.uleb128 0x1
	.byte	0x5e
	.byte	0x93
	.uleb128 0x1
	.byte	0x5f
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST32:
	.long	.LFB92
	.long	.LCFI5
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI5
	.long	.LCFI6
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI6
	.long	.LCFI7
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI7
	.long	.LCFI8
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI8
	.long	.LCFI9
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 6
	.long	.LCFI9
	.long	.LCFI10
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 7
	.long	.LCFI10
	.long	.LCFI11
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 8
	.long	.LCFI11
	.long	.LCFI12
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 9
	.long	.LCFI12
	.long	.LCFI13
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 10
	.long	.LCFI13
	.long	.LCFI14
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 11
	.long	.LCFI14
	.long	.LCFI15
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 12
	.long	.LCFI15
	.long	.LCFI16
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 13
	.long	.LCFI16
	.long	.LCFI17
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 14
	.long	.LCFI17
	.long	.LCFI18
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 15
	.long	.LCFI18
	.long	.LFE92
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 16
	.long	0
	.long	0
.LLST33:
	.long	.LVL80
	.long	.LVL81-1
	.word	0x1
	.byte	0x66
	.long	0
	.long	0
.LLST34:
	.long	.LVL82
	.long	.LVL83
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL83
	.long	.LFE93
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0x74
	.word	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.word	0
	.word	0
	.long	.LFB71
	.long	.LFE71-.LFB71
	.long	.LFB72
	.long	.LFE72-.LFB72
	.long	.LFB98
	.long	.LFE98-.LFB98
	.long	.LFB85
	.long	.LFE85-.LFB85
	.long	.LFB86
	.long	.LFE86-.LFB86
	.long	.LFB88
	.long	.LFE88-.LFB88
	.long	.LFB87
	.long	.LFE87-.LFB87
	.long	.LFB89
	.long	.LFE89-.LFB89
	.long	.LFB90
	.long	.LFE90-.LFB90
	.long	.LFB91
	.long	.LFE91-.LFB91
	.long	.LFB92
	.long	.LFE92-.LFB92
	.long	.LFB93
	.long	.LFE93-.LFB93
	.long	0
	.long	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.LFB71
	.long	.LFE71
	.long	.LFB72
	.long	.LFE72
	.long	.LFB98
	.long	.LFE98
	.long	.LFB85
	.long	.LFE85
	.long	.LFB86
	.long	.LFE86
	.long	.LFB88
	.long	.LFE88
	.long	.LFB87
	.long	.LFE87
	.long	.LFB89
	.long	.LFE89
	.long	.LFB90
	.long	.LFE90
	.long	.LFB91
	.long	.LFE91
	.long	.LFB92
	.long	.LFE92
	.long	.LFB93
	.long	.LFE93
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF112:
	.string	"RingBuffer_Remove"
.LASF94:
	.string	"VirtualSerial_CDC_Interface"
.LASF74:
	.string	"LEDs_Init"
.LASF110:
	.string	"__iCliRetVal"
.LASF101:
	.string	"Selected1200BPS"
.LASF86:
	.string	"__vector_23"
.LASF95:
	.string	"ResetTimer"
.LASF109:
	.string	"/home/pi/Arduino/LUFA-100807/Projects/atmega16u2_due"
.LASF10:
	.string	"long long unsigned int"
.LASF65:
	.string	"RingBuffer_IsEmpty"
.LASF12:
	.string	"DEVICE_STATE_Unattached"
.LASF14:
	.string	"DEVICE_STATE_Default"
.LASF3:
	.string	"int16_t"
.LASF9:
	.string	"long long int"
.LASF0:
	.string	"signed char"
.LASF43:
	.string	"BaudRateBPS"
.LASF102:
	.string	"CDC_Device_ReceiveByte"
.LASF67:
	.string	"BaudRate"
.LASF24:
	.string	"CDC_PARITY_None"
.LASF66:
	.string	"Serial_Init"
.LASF6:
	.string	"long int"
.LASF56:
	.string	"RxLEDPulse"
.LASF55:
	.string	"TxLEDPulse"
.LASF44:
	.string	"CharFormat"
.LASF36:
	.string	"DataOUTEndpointDoubleBank"
.LASF4:
	.string	"uint16_t"
.LASF18:
	.string	"USB_Device_States_t"
.LASF31:
	.string	"DataINEndpointNumber"
.LASF77:
	.string	"LEDMask"
.LASF99:
	.string	"CurrentRTSState"
.LASF42:
	.string	"DeviceToHost"
.LASF59:
	.string	"__ToDo"
.LASF98:
	.string	"PreviousDTRState"
.LASF5:
	.string	"unsigned int"
.LASF92:
	.string	"USARTtoUSB_Buffer"
.LASF103:
	.string	"CDC_Device_SendByte"
.LASF28:
	.string	"CDC_PARITY_Space"
.LASF8:
	.string	"long unsigned int"
.LASF19:
	.string	"CDC_LineEncodingFormats_t"
.LASF90:
	.string	"tmp_erase_cmd_last"
.LASF27:
	.string	"CDC_PARITY_Mark"
.LASF58:
	.string	"sreg_save"
.LASF20:
	.string	"CDC_LINEENCODING_OneStopBit"
.LASF76:
	.string	"LEDs_TurnOnLEDs"
.LASF16:
	.string	"DEVICE_STATE_Configured"
.LASF23:
	.string	"CDC_LineEncodingParity_t"
.LASF49:
	.string	"Config"
.LASF82:
	.string	"EVENT_USB_Device_UnhandledControlRequest"
.LASF111:
	.string	"RingBuffer_Insert"
.LASF35:
	.string	"DataOUTEndpointSize"
.LASF75:
	.string	"Serial_ShutDown"
.LASF17:
	.string	"DEVICE_STATE_Suspended"
.LASF30:
	.string	"ControlInterfaceNumber"
.LASF25:
	.string	"CDC_PARITY_Odd"
.LASF64:
	.string	"RingBuffer_IsFull"
.LASF32:
	.string	"DataINEndpointSize"
.LASF115:
	.string	"CDC_Device_ProcessControlRequest"
.LASF100:
	.string	"PreviousRTSState"
.LASF11:
	.string	"sizetype"
.LASF34:
	.string	"DataOUTEndpointNumber"
.LASF53:
	.string	"Count"
.LASF22:
	.string	"CDC_LINEENCODING_TwoStopBits"
.LASF104:
	.string	"USB_Init"
.LASF37:
	.string	"NotificationEndpointNumber"
.LASF15:
	.string	"DEVICE_STATE_Addressed"
.LASF13:
	.string	"DEVICE_STATE_Powered"
.LASF33:
	.string	"DataINEndpointDoubleBank"
.LASF80:
	.string	"ReceivedByte"
.LASF85:
	.string	"ConfigMask"
.LASF72:
	.string	"SetupHardware"
.LASF114:
	.string	"CDC_Device_USBTask"
.LASF79:
	.string	"BufferCount"
.LASF40:
	.string	"_Bool"
.LASF1:
	.string	"unsigned char"
.LASF96:
	.string	"tries"
.LASF89:
	.string	"tmp_erase_cmd"
.LASF68:
	.string	"DoubleSpeed"
.LASF107:
	.string	"GNU C 4.8.1 -mmcu=atmega16u2 -gdwarf-2 -Os -std=gnu99 -funsigned-char -funsigned-bitfields -ffunction-sections -fno-inline-small-functions -fpack-struct -fshort-enums -fno-strict-aliasing"
.LASF38:
	.string	"NotificationEndpointSize"
.LASF63:
	.string	"RingBuffer_GetCount"
.LASF78:
	.string	"LEDs_TurnOffLEDs"
.LASF7:
	.string	"uint32_t"
.LASF26:
	.string	"CDC_PARITY_Even"
.LASF105:
	.string	"USB_USBTask"
.LASF29:
	.string	"char"
.LASF106:
	.string	"CDC_Device_ConfigureEndpoints"
.LASF50:
	.string	"State"
.LASF97:
	.string	"CurrentDTRState"
.LASF88:
	.string	"ex_resettime"
.LASF91:
	.string	"USBtoUSART_Buffer"
.LASF21:
	.string	"CDC_LINEENCODING_OneAndAHalfStopBits"
.LASF87:
	.string	"EVENT_CDC_Device_ControLineStateChanged"
.LASF57:
	.string	"PingPongLEDPulse"
.LASF47:
	.string	"ControlLineStates"
.LASF93:
	.string	"PulseMSRemaining"
.LASF60:
	.string	"__iRestore"
.LASF73:
	.string	"RingBuffer_InitBuffer"
.LASF54:
	.string	"RingBuff_t"
.LASF108:
	.string	"Arduino-usbserial.c"
.LASF48:
	.string	"LineEncoding"
.LASF70:
	.string	"setResetPin"
.LASF52:
	.string	"Buffer"
.LASF46:
	.string	"DataBits"
.LASF2:
	.string	"uint8_t"
.LASF69:
	.string	"Data"
.LASF39:
	.string	"NotificationEndpointDoubleBank"
.LASF81:
	.string	"EVENT_USB_Device_ConfigurationChanged"
.LASF71:
	.string	"setErasePin"
.LASF84:
	.string	"CDCInterfaceInfo"
.LASF45:
	.string	"ParityType"
.LASF83:
	.string	"EVENT_CDC_Device_LineEncodingChanged"
.LASF62:
	.string	"DataByte"
.LASF113:
	.string	"main"
.LASF61:
	.string	"Serial_TxByte"
.LASF51:
	.string	"USB_ClassInfo_CDC_Device_t"
.LASF41:
	.string	"HostToDevice"
	.ident	"GCC: (GNU) 4.8.1"
.global __do_copy_data
.global __do_clear_bss
