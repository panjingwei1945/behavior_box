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
	.section	.text.setResetPin,"ax",@progbits
.global	setResetPin
	.type	setResetPin, @function
setResetPin:
.LFB85:
	.file 3 "Arduino-usbserial.c"
	.loc 3 85 0
	.cfi_startproc
.LVL11:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 3 87 0
	tst r24
	breq .L7
	.loc 3 89 0
	sbi 0x7,7
	rjmp .L9
.L7:
	.loc 3 94 0
	cbi 0x7,7
.L9:
	.loc 3 95 0
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
	.loc 3 100 0
	.cfi_startproc
.LVL12:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 3 101 0
	tst r24
	breq .L11
	.loc 3 102 0
	cbi 0x8,6
	ret
.L11:
	.loc 3 105 0
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
	.loc 3 199 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 3 201 0
	in r24,0x34
	andi r24,lo8(-9)
	out 0x34,r24
	.loc 3 202 0
	ldi r24,lo8(24)
/* #APP */
 ;  202 "Arduino-usbserial.c" 1
	in __tmp_reg__, __SREG__
	cli
	sts 96, r24
	sts 96, __zero_reg__
	out __SREG__,__tmp_reg__
	
 ;  0 "" 2
	.loc 3 204 0
/* #NOAPP */
	ldi r24,0
	call setResetPin
.LVL13:
	.loc 3 207 0
	sbi 0x8,6
	.loc 3 208 0
	sbi 0x7,6
.LVL14:
.LBB45:
.LBB46:
	.file 4 "../../LUFA/Drivers/Peripheral/Serial.h"
	.loc 4 102 0
	ldi r24,lo8(103)
	ldi r25,0
	sts 204+1,r25
	sts 204,r24
	.loc 4 104 0
	ldi r24,lo8(6)
	sts 202,r24
	.loc 4 105 0
	sts 200,__zero_reg__
	.loc 4 106 0
	ldi r24,lo8(24)
	sts 201,r24
	.loc 4 108 0
	sbi 0xa,3
	.loc 4 109 0
	sbi 0xb,2
.LBE46:
.LBE45:
.LBB47:
.LBB48:
	.file 5 "./Board/LEDs.h"
	.loc 5 69 0
	in r24,0xa
	ori r24,lo8(48)
	out 0xa,r24
	.loc 5 70 0
	in r24,0xb
	ori r24,lo8(48)
	out 0xb,r24
.LBE48:
.LBE47:
	.loc 3 213 0
	call USB_Init
.LVL15:
	.loc 3 216 0
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
	.loc 3 115 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 3 116 0
	call SetupHardware
.LVL16:
.LBB100:
.LBB101:
	.loc 1 87 0
	in r18,__SREG__
.LVL17:
.LBB102:
.LBB103:
	.loc 2 50 0
/* #APP */
 ;  50 "/usr/lib/avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
.LVL18:
/* #NOAPP */
.LBE103:
.LBE102:
	.loc 1 89 0
	ldi r24,lo8(USBtoUSART_Buffer)
	ldi r25,hi8(USBtoUSART_Buffer)
	sts USBtoUSART_Buffer+128+1,r25
	sts USBtoUSART_Buffer+128,r24
	.loc 1 90 0
	sts USBtoUSART_Buffer+130+1,r25
	sts USBtoUSART_Buffer+130,r24
.LVL19:
.LBB104:
.LBB105:
	.loc 2 70 0
	out __SREG__,r18
	.loc 2 71 0
.LVL20:
.LBE105:
.LBE104:
.LBE101:
.LBE100:
.LBB106:
.LBB107:
	.loc 1 87 0
	in r18,__SREG__
.LVL21:
.LBB108:
.LBB109:
	.loc 2 50 0
/* #APP */
 ;  50 "/usr/lib/avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
.LVL22:
/* #NOAPP */
.LBE109:
.LBE108:
	.loc 1 89 0
	ldi r24,lo8(USARTtoUSB_Buffer)
	ldi r25,hi8(USARTtoUSB_Buffer)
	sts USARTtoUSB_Buffer+128+1,r25
	sts USARTtoUSB_Buffer+128,r24
	.loc 1 90 0
	sts USARTtoUSB_Buffer+130+1,r25
	sts USARTtoUSB_Buffer+130,r24
.LVL23:
.LBB110:
.LBB111:
	.loc 2 70 0
	out __SREG__,r18
.LVL24:
	.loc 2 71 0
.LBE111:
.LBE110:
.LBE107:
.LBE106:
	.loc 3 121 0
/* #APP */
 ;  121 "Arduino-usbserial.c" 1
	sei
 ;  0 "" 2
/* #NOAPP */
.LBB112:
	.loc 3 145 0
	ldi r29,lo8(3)
.LVL25:
.L37:
.LBB113:
.LBB114:
.LBB115:
.LBB116:
	.loc 1 111 0
	in r25,__SREG__
.LVL26:
.LBB117:
.LBB118:
	.loc 2 50 0
/* #APP */
 ;  50 "/usr/lib/avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
.LVL27:
/* #NOAPP */
.LBE118:
.LBE117:
	.loc 1 113 0
	lds r24,USBtoUSART_Buffer+132
.LVL28:
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
	.loc 3 128 0
	cpi r24,lo8(-128)
	breq .L16
.LBB121:
	.loc 3 130 0
	ldi r24,lo8(VirtualSerial_CDC_Interface)
	ldi r25,hi8(VirtualSerial_CDC_Interface)
.LVL29:
	call CDC_Device_ReceiveByte
.LVL30:
	.loc 3 133 0
	sbrc r25,7
	rjmp .L16
	.loc 3 134 0
	mov r22,r24
	ldi r24,lo8(USBtoUSART_Buffer)
	ldi r25,hi8(USBtoUSART_Buffer)
.LVL31:
	call RingBuffer_Insert
.LVL32:
.L16:
.LBE121:
.LBB122:
.LBB123:
.LBB124:
	.loc 1 111 0
	in r24,__SREG__
.LVL33:
.LBB125:
.LBB126:
	.loc 2 50 0
/* #APP */
 ;  50 "/usr/lib/avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
.LVL34:
/* #NOAPP */
.LBE126:
.LBE125:
	.loc 1 113 0
	lds r28,USARTtoUSB_Buffer+132
.LVL35:
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
	.loc 3 139 0
	sbic 0x15,0
	rjmp .L18
	.loc 3 139 0 is_stmt 0 discriminator 1
	cpi r28,lo8(97)
	brsh .+2
	rjmp .L19
.L18:
	.loc 3 141 0 is_stmt 1
	sbi 0x15,0
	.loc 3 143 0
	lds r24,USARTtoUSB_Buffer+132
.LVL36:
	tst r24
	breq .L21
.LVL37:
.LBB129:
.LBB130:
	.loc 5 75 0
	cbi 0xb,5
.LBE130:
.LBE129:
	.loc 3 145 0
	sts PulseMSRemaining,r29
.LVL38:
.L21:
	.loc 3 149 0 discriminator 1
	tst r28
	breq .L46
	.loc 3 150 0
	ldi r24,lo8(USARTtoUSB_Buffer)
	ldi r25,hi8(USARTtoUSB_Buffer)
	call RingBuffer_Remove
.LVL39:
	mov r22,r24
	ldi r24,lo8(VirtualSerial_CDC_Interface)
	ldi r25,hi8(VirtualSerial_CDC_Interface)
	call CDC_Device_SendByte
.LVL40:
	subi r28,lo8(-(-1))
.LVL41:
	rjmp .L21
.LVL42:
.L46:
	.loc 3 153 0
	lds r24,PulseMSRemaining
	tst r24
	breq .L24
	.loc 3 153 0 is_stmt 0 discriminator 1
	lds r24,PulseMSRemaining
	subi r24,lo8(-(-1))
	sts PulseMSRemaining,r24
	cpse r24,__zero_reg__
	rjmp .L24
.LVL43:
.LBB131:
.LBB132:
	.loc 5 80 0 is_stmt 1
	sbi 0xb,5
.LVL44:
.L24:
.LBE132:
.LBE131:
	.loc 3 157 0
	lds r24,PulseMSRemaining+1
	tst r24
	breq .L27
	.loc 3 157 0 is_stmt 0 discriminator 1
	lds r24,PulseMSRemaining+1
	subi r24,lo8(-(-1))
	sts PulseMSRemaining+1,r24
	cpse r24,__zero_reg__
	rjmp .L27
.LVL45:
.LBB133:
.LBB134:
	.loc 5 80 0 is_stmt 1
	sbi 0xb,4
.LVL46:
.L27:
.LBE134:
.LBE133:
	.loc 3 160 0
	lds r24,ResetTimer
	lds r25,ResetTimer+1
	cp __zero_reg__,r24
	cpc __zero_reg__,r25
	brge .L29
	.loc 3 165 0
	sbiw r24,60
	sbiw r24,61
	brsh .L30
	.loc 3 166 0
	ldi r24,lo8(1)
	rjmp .L44
.L30:
	.loc 3 168 0
	ldi r24,0
.L44:
	call setErasePin
.LVL47:
	.loc 3 172 0
	lds r24,ResetTimer
	lds r25,ResetTimer+1
	sbiw r24,1
	sbiw r24,50
	brsh .L32
	.loc 3 173 0
	ldi r24,lo8(1)
	rjmp .L45
.L32:
	.loc 3 175 0
	ldi r24,0
.L45:
	call setResetPin
.LVL48:
	.loc 3 177 0
	lds r24,ResetTimer
	lds r25,ResetTimer+1
	sbiw r24,1
	sts ResetTimer+1,r25
	sts ResetTimer,r24
	rjmp .L19
.L29:
	.loc 3 179 0
	ldi r24,0
	call setErasePin
.LVL49:
	.loc 3 180 0
	ldi r24,0
	call setResetPin
.LVL50:
.L19:
.LBB135:
.LBB136:
.LBB137:
.LBB138:
	.loc 1 111 0
	in r25,__SREG__
.LVL51:
.LBB139:
.LBB140:
	.loc 2 50 0
/* #APP */
 ;  50 "/usr/lib/avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
.LVL52:
/* #NOAPP */
.LBE140:
.LBE139:
	.loc 1 113 0
	lds r24,USBtoUSART_Buffer+132
.LVL53:
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
	.loc 3 185 0
	tst r24
	breq .L34
	.loc 3 186 0
	ldi r24,lo8(USBtoUSART_Buffer)
	ldi r25,hi8(USBtoUSART_Buffer)
.LVL54:
	call RingBuffer_Remove
.LVL55:
.L36:
.LBB143:
.LBB144:
	.loc 4 142 0
	lds r25,200
	sbrs r25,5
	rjmp .L36
	.loc 4 143 0
	sts 206,r24
.LVL56:
.LBE144:
.LBE143:
.LBB145:
.LBB146:
	.loc 5 75 0
	cbi 0xb,4
.LBE146:
.LBE145:
	.loc 3 188 0
	sts PulseMSRemaining+1,r29
.LVL57:
.L34:
	.loc 3 191 0
	ldi r24,lo8(VirtualSerial_CDC_Interface)
	ldi r25,hi8(VirtualSerial_CDC_Interface)
	call CDC_Device_USBTask
.LVL58:
	.loc 3 192 0
	call USB_USBTask
.LVL59:
.LBE112:
	.loc 3 193 0
	rjmp .L37
	.cfi_endproc
.LFE87:
	.size	main, .-main
	.section	.text.EVENT_USB_Device_ConfigurationChanged,"ax",@progbits
.global	EVENT_USB_Device_ConfigurationChanged
	.type	EVENT_USB_Device_ConfigurationChanged, @function
EVENT_USB_Device_ConfigurationChanged:
.LFB89:
	.loc 3 221 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 3 222 0
	ldi r24,lo8(VirtualSerial_CDC_Interface)
	ldi r25,hi8(VirtualSerial_CDC_Interface)
	jmp CDC_Device_ConfigureEndpoints
.LVL60:
	.cfi_endproc
.LFE89:
	.size	EVENT_USB_Device_ConfigurationChanged, .-EVENT_USB_Device_ConfigurationChanged
	.section	.text.EVENT_USB_Device_UnhandledControlRequest,"ax",@progbits
.global	EVENT_USB_Device_UnhandledControlRequest
	.type	EVENT_USB_Device_UnhandledControlRequest, @function
EVENT_USB_Device_UnhandledControlRequest:
.LFB90:
	.loc 3 227 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 3 228 0
	ldi r24,lo8(VirtualSerial_CDC_Interface)
	ldi r25,hi8(VirtualSerial_CDC_Interface)
	jmp CDC_Device_ProcessControlRequest
.LVL61:
	.cfi_endproc
.LFE90:
	.size	EVENT_USB_Device_UnhandledControlRequest, .-EVENT_USB_Device_UnhandledControlRequest
	.section	.text.EVENT_CDC_Device_LineEncodingChanged,"ax",@progbits
.global	EVENT_CDC_Device_LineEncodingChanged
	.type	EVENT_CDC_Device_LineEncodingChanged, @function
EVENT_CDC_Device_LineEncodingChanged:
.LFB91:
	.loc 3 236 0
	.cfi_startproc
.LVL62:
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
.LVL63:
	.loc 3 239 0
	ldd r24,Z+20
.LVL64:
	cpi r24,lo8(1)
	breq .L59
	cpi r24,lo8(2)
	breq .L52
	.loc 3 237 0
	ldi r28,0
	rjmp .L51
.L52:
.LVL65:
	.loc 3 245 0
	ldi r28,lo8(32)
	.loc 3 246 0
	rjmp .L51
.LVL66:
.L59:
	.loc 3 242 0
	ldi r28,lo8(48)
.LVL67:
.L51:
	.loc 3 249 0
	ldd r24,Z+19
	cpi r24,lo8(2)
	brne .L53
	.loc 3 250 0
	ori r28,lo8(8)
.LVL68:
.L53:
	.loc 3 252 0
	ldd r24,Z+21
	cpi r24,lo8(7)
	breq .L55
	cpi r24,lo8(8)
	breq .L56
	cpi r24,lo8(6)
	brne .L54
	.loc 3 255 0
	ori r28,lo8(2)
.LVL69:
	.loc 3 256 0
	rjmp .L54
.L55:
	.loc 3 258 0
	ori r28,lo8(4)
.LVL70:
	.loc 3 259 0
	rjmp .L54
.L56:
	.loc 3 261 0
	ori r28,lo8(6)
.LVL71:
.L54:
	.loc 3 266 0
	sts 201,__zero_reg__
	.loc 3 267 0
	sts 200,__zero_reg__
	.loc 3 268 0
	sts 202,__zero_reg__
	.loc 3 270 0
	ldd r12,Z+15
	ldd r13,Z+16
	ldd r14,Z+17
	ldd r15,Z+18
.LVL72:
	.loc 3 271 0
	ldi r24,lo8(1)
	ldi r25,-80
	cp r12,r25
	ldi r25,4
	cpc r13,r25
	cpc r14,__zero_reg__
	cpc r15,__zero_reg__
	breq .L58
	ldi r24,0
.L58:
	sts Selected1200BPS,r24
	.loc 3 273 0
	movw r24,r14
	movw r22,r12
	ldi r18,lo8(2)
	ldi r19,0
	ldi r20,0
	ldi r21,0
	call __divmodsi4
.LVL73:
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
	.loc 3 274 0
	sts 202,r28
	.loc 3 275 0
	ldi r24,lo8(2)
	sts 200,r24
	.loc 3 276 0
	ldi r24,lo8(-104)
	sts 201,r24
/* epilogue start */
	.loc 3 277 0
	pop r28
.LVL74:
	pop r15
	pop r14
	pop r13
	pop r12
.LVL75:
	ret
	.cfi_endproc
.LFE91:
	.size	EVENT_CDC_Device_LineEncodingChanged, .-EVENT_CDC_Device_LineEncodingChanged
	.section	.text.__vector_23,"ax",@progbits
.global	__vector_23
	.type	__vector_23, @function
__vector_23:
.LFB92:
	.loc 3 283 0
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
	.loc 3 284 0
	lds r22,206
.LVL76:
	.loc 3 286 0
	in r24,0x1e
	cpi r24,lo8(4)
	brne .L63
	.loc 3 287 0
	ldi r24,lo8(USARTtoUSB_Buffer)
	ldi r25,hi8(USARTtoUSB_Buffer)
	call RingBuffer_Insert
.LVL77:
.L63:
/* epilogue start */
	.loc 3 288 0
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
	.loc 3 295 0
	.cfi_startproc
.LVL78:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 3 296 0
	lds r18,CurrentDTRState
	sts PreviousDTRState,r18
	.loc 3 297 0
	lds r19,CurrentRTSState
	sts PreviousRTSState,r19
	.loc 3 298 0
	movw r30,r24
	ldd r25,Z+13
	mov r24,r25
.LVL79:
	andi r24,lo8(1)
	sts CurrentDTRState,r24
	.loc 3 299 0
	lsr r25
	andi r25,1
	sts CurrentRTSState,r25
	.loc 3 301 0
	lds r25,Selected1200BPS
	tst r25
	breq .L66
	.loc 3 303 0
	ldi r24,lo8(120)
	ldi r25,0
	rjmp .L71
.L66:
	.loc 3 304 0
	cpse r18,__zero_reg__
	rjmp .L65
	.loc 3 304 0 is_stmt 0 discriminator 1
	tst r24
	breq .L65
	.loc 3 306 0 is_stmt 1
	ldi r24,lo8(50)
	ldi r25,0
.L71:
	sts ResetTimer+1,r25
	sts ResetTimer,r24
.L65:
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
	.long	0xce2
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF102
	.byte	0x1
	.long	.LASF103
	.long	.LASF104
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
	.byte	0x3
	.byte	0x2e
	.long	0x309
	.uleb128 0x8
	.long	.LASF55
	.byte	0x3
	.byte	0x30
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.long	.LASF56
	.byte	0x3
	.byte	0x31
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x8
	.long	.LASF57
	.byte	0x3
	.byte	0x32
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
	.long	.LASF105
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
	.byte	0x4
	.byte	0x8c
	.byte	0x1
	.byte	0x3
	.long	0x39e
	.uleb128 0x12
	.long	.LASF62
	.byte	0x4
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
	.byte	0x4
	.byte	0x63
	.byte	0x1
	.byte	0x3
	.long	0x401
	.uleb128 0x12
	.long	.LASF67
	.byte	0x4
	.byte	0x63
	.long	0x401
	.uleb128 0x12
	.long	.LASF68
	.byte	0x4
	.byte	0x64
	.long	0x406
	.byte	0
	.uleb128 0x9
	.long	0x6d
	.uleb128 0x9
	.long	0x1ab
	.uleb128 0x15
	.long	.LASF106
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
	.long	.LASF107
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
	.byte	0x1
	.long	.LASF70
	.byte	0x3
	.byte	0x55
	.byte	0x1
	.long	.LFB85
	.long	.LFE85
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x543
	.uleb128 0x20
	.string	"v"
	.byte	0x3
	.byte	0x55
	.long	0x1ab
	.byte	0x1
	.byte	0x68
	.byte	0
	.uleb128 0x1f
	.byte	0x1
	.long	.LASF71
	.byte	0x3
	.byte	0x64
	.byte	0x1
	.long	.LFB86
	.long	.LFE86
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x569
	.uleb128 0x20
	.string	"v"
	.byte	0x3
	.byte	0x64
	.long	0x1ab
	.byte	0x1
	.byte	0x68
	.byte	0
	.uleb128 0x21
	.long	.LASF108
	.byte	0x5
	.byte	0x43
	.byte	0x1
	.byte	0x3
	.uleb128 0x1f
	.byte	0x1
	.long	.LASF72
	.byte	0x3
	.byte	0xc6
	.byte	0x1
	.long	.LFB88
	.long	.LFE88
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x5d9
	.uleb128 0x22
	.long	0x3dd
	.long	.LBB45
	.long	.LBE45
	.byte	0x3
	.byte	0xd3
	.long	0x5ad
	.uleb128 0x23
	.long	0x3ea
	.word	0x2580
	.uleb128 0x24
	.long	0x3f5
	.byte	0
	.byte	0
	.uleb128 0x1b
	.long	0x569
	.long	.LBB47
	.long	.LBE47
	.byte	0x3
	.byte	0xd4
	.uleb128 0x25
	.long	.LVL13
	.long	0x51d
	.long	0x5cf
	.uleb128 0x26
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0x27
	.long	.LVL15
	.long	0xc5e
	.byte	0
	.uleb128 0xe
	.long	.LASF73
	.byte	0x1
	.byte	0x55
	.byte	0x1
	.byte	0x3
	.long	0x60a
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
	.uleb128 0xe
	.long	.LASF74
	.byte	0x5
	.byte	0x49
	.byte	0x1
	.byte	0x3
	.long	0x623
	.uleb128 0x12
	.long	.LASF75
	.byte	0x5
	.byte	0x49
	.long	0x328
	.byte	0
	.uleb128 0xe
	.long	.LASF76
	.byte	0x5
	.byte	0x4e
	.byte	0x1
	.byte	0x3
	.long	0x63c
	.uleb128 0x12
	.long	.LASF75
	.byte	0x5
	.byte	0x4e
	.long	0x328
	.byte	0
	.uleb128 0x28
	.byte	0x1
	.long	.LASF109
	.byte	0x3
	.byte	0x72
	.byte	0x1
	.long	0x4d
	.long	.LFB87
	.long	.LFE87
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0xa67
	.uleb128 0x22
	.long	0x5d9
	.long	.LBB100
	.long	.LBE100
	.byte	0x3
	.byte	0x76
	.long	0x6be
	.uleb128 0x1d
	.long	0x5e6
	.byte	0x6
	.byte	0x3
	.long	USBtoUSART_Buffer
	.byte	0x9f
	.uleb128 0x18
	.long	.LBB101
	.long	.LBE101
	.uleb128 0x29
	.long	0x5f2
	.long	.LLST4
	.uleb128 0x29
	.long	0x5fd
	.long	.LLST5
	.uleb128 0x1b
	.long	0x32d
	.long	.LBB102
	.long	.LBE102
	.byte	0x1
	.byte	0x57
	.uleb128 0x1c
	.long	0x309
	.long	.LBB104
	.long	.LBE104
	.byte	0x1
	.byte	0x57
	.uleb128 0x2a
	.long	0x316
	.long	.LLST6
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x22
	.long	0x5d9
	.long	.LBB106
	.long	.LBE106
	.byte	0x3
	.byte	0x77
	.long	0x722
	.uleb128 0x1d
	.long	0x5e6
	.byte	0x6
	.byte	0x3
	.long	USARTtoUSB_Buffer
	.byte	0x9f
	.uleb128 0x18
	.long	.LBB107
	.long	.LBE107
	.uleb128 0x29
	.long	0x5f2
	.long	.LLST7
	.uleb128 0x29
	.long	0x5fd
	.long	.LLST8
	.uleb128 0x1b
	.long	0x32d
	.long	.LBB108
	.long	.LBE108
	.byte	0x1
	.byte	0x57
	.uleb128 0x1c
	.long	0x309
	.long	.LBB110
	.long	.LBE110
	.byte	0x1
	.byte	0x57
	.uleb128 0x2a
	.long	0x316
	.long	.LLST9
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2b
	.long	.LBB112
	.long	.LBE112
	.long	0xa5d
	.uleb128 0x1a
	.long	.LASF77
	.byte	0x3
	.byte	0x8a
	.long	0x30
	.long	.LLST10
	.uleb128 0x22
	.long	0x3a3
	.long	.LBB113
	.long	.LBE113
	.byte	0x3
	.byte	0x80
	.long	0x7ca
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
	.uleb128 0x2c
	.long	0x34b
	.uleb128 0x18
	.long	.LBB115
	.long	.LBE115
	.uleb128 0x29
	.long	0x356
	.long	.LLST11
	.uleb128 0x18
	.long	.LBB116
	.long	.LBE116
	.uleb128 0x29
	.long	0x362
	.long	.LLST12
	.uleb128 0x29
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
	.uleb128 0x2a
	.long	0x316
	.long	.LLST14
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2b
	.long	.LBB121
	.long	.LBE121
	.long	0x81b
	.uleb128 0x1a
	.long	.LASF78
	.byte	0x3
	.byte	0x82
	.long	0x42
	.long	.LLST15
	.uleb128 0x25
	.long	.LVL30
	.long	0xc69
	.long	0x802
	.uleb128 0x26
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
	.uleb128 0x2d
	.long	.LVL32
	.long	0x40b
	.uleb128 0x26
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
	.uleb128 0x22
	.long	0x33a
	.long	.LBB122
	.long	.LBE122
	.byte	0x3
	.byte	0x8a
	.long	0x88b
	.uleb128 0x2c
	.long	0x34b
	.uleb128 0x18
	.long	.LBB123
	.long	.LBE123
	.uleb128 0x29
	.long	0x356
	.long	.LLST16
	.uleb128 0x18
	.long	.LBB124
	.long	.LBE124
	.uleb128 0x29
	.long	0x362
	.long	.LLST17
	.uleb128 0x29
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
	.uleb128 0x2a
	.long	0x316
	.long	.LLST19
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x22
	.long	0x60a
	.long	.LBB129
	.long	.LBE129
	.byte	0x3
	.byte	0x90
	.long	0x8a8
	.uleb128 0x2a
	.long	0x617
	.long	.LLST20
	.byte	0
	.uleb128 0x22
	.long	0x623
	.long	.LBB131
	.long	.LBE131
	.byte	0x3
	.byte	0x9a
	.long	0x8c5
	.uleb128 0x2a
	.long	0x630
	.long	.LLST21
	.byte	0
	.uleb128 0x22
	.long	0x623
	.long	.LBB133
	.long	.LBE133
	.byte	0x3
	.byte	0x9e
	.long	0x8e2
	.uleb128 0x2a
	.long	0x630
	.long	.LLST22
	.byte	0
	.uleb128 0x22
	.long	0x3c0
	.long	.LBB135
	.long	.LBE135
	.byte	0x3
	.byte	0xb9
	.long	0x971
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
	.uleb128 0x2c
	.long	0x34b
	.uleb128 0x18
	.long	.LBB137
	.long	.LBE137
	.uleb128 0x29
	.long	0x356
	.long	.LLST23
	.uleb128 0x18
	.long	.LBB138
	.long	.LBE138
	.uleb128 0x29
	.long	0x362
	.long	.LLST24
	.uleb128 0x29
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
	.long	.Ldebug_info0+2352
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x22
	.long	0x385
	.long	.LBB143
	.long	.LBE143
	.byte	0x3
	.byte	0xba
	.long	0x98e
	.uleb128 0x2a
	.long	0x392
	.long	.LLST26
	.byte	0
	.uleb128 0x22
	.long	0x60a
	.long	.LBB145
	.long	.LBE145
	.byte	0x3
	.byte	0xbb
	.long	0x9ab
	.uleb128 0x2a
	.long	0x617
	.long	.LLST27
	.byte	0
	.uleb128 0x25
	.long	.LVL39
	.long	0x492
	.long	0x9c7
	.uleb128 0x26
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
	.uleb128 0x25
	.long	.LVL40
	.long	0xc82
	.long	0x9e3
	.uleb128 0x26
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
	.uleb128 0x27
	.long	.LVL47
	.long	0x543
	.uleb128 0x27
	.long	.LVL48
	.long	0x51d
	.uleb128 0x25
	.long	.LVL49
	.long	0x543
	.long	0xa08
	.uleb128 0x26
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0x25
	.long	.LVL50
	.long	0x51d
	.long	0xa1b
	.uleb128 0x26
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0x25
	.long	.LVL55
	.long	0x492
	.long	0xa37
	.uleb128 0x26
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
	.uleb128 0x25
	.long	.LVL58
	.long	0xc9f
	.long	0xa53
	.uleb128 0x26
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
	.uleb128 0x27
	.long	.LVL59
	.long	0xcb3
	.byte	0
	.uleb128 0x27
	.long	.LVL16
	.long	0x572
	.byte	0
	.uleb128 0x1f
	.byte	0x1
	.long	.LASF79
	.byte	0x3
	.byte	0xdc
	.byte	0x1
	.long	.LFB89
	.long	.LFE89
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0xa9b
	.uleb128 0x2e
	.long	.LVL60
	.byte	0x1
	.long	0xcbd
	.uleb128 0x26
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
	.uleb128 0x1f
	.byte	0x1
	.long	.LASF80
	.byte	0x3
	.byte	0xe2
	.byte	0x1
	.long	.LFB90
	.long	.LFE90
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0xacf
	.uleb128 0x2e
	.long	.LVL61
	.byte	0x1
	.long	0xcd5
	.uleb128 0x26
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
	.uleb128 0x2f
	.byte	0x1
	.long	.LASF81
	.byte	0x3
	.byte	0xeb
	.byte	0x1
	.long	.LFB91
	.long	.LFE91
	.long	.LLST28
	.byte	0x1
	.long	0xb18
	.uleb128 0x16
	.long	.LASF82
	.byte	0x3
	.byte	0xeb
	.long	0xb18
	.long	.LLST29
	.uleb128 0x1a
	.long	.LASF83
	.byte	0x3
	.byte	0xed
	.long	0x30
	.long	.LLST30
	.uleb128 0x30
	.string	"bps"
	.byte	0x3
	.word	0x10e
	.long	0x66
	.long	.LLST31
	.byte	0
	.uleb128 0x9
	.long	0xb1d
	.uleb128 0xd
	.byte	0x2
	.long	0x267
	.uleb128 0x31
	.byte	0x1
	.long	.LASF84
	.byte	0x3
	.word	0x11a
	.byte	0x1
	.long	.LFB92
	.long	.LFE92
	.long	.LLST32
	.byte	0x1
	.long	0xb67
	.uleb128 0x32
	.long	.LASF78
	.byte	0x3
	.word	0x11c
	.long	0x30
	.long	.LLST33
	.uleb128 0x2d
	.long	.LVL77
	.long	0x40b
	.uleb128 0x26
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
	.uleb128 0x33
	.byte	0x1
	.long	.LASF85
	.byte	0x3
	.word	0x126
	.byte	0x1
	.long	.LFB93
	.long	.LFE93
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0xb93
	.uleb128 0x34
	.long	.LASF82
	.byte	0x3
	.word	0x126
	.long	0xb18
	.long	.LLST34
	.byte	0
	.uleb128 0x35
	.long	.LASF86
	.byte	0x3
	.byte	0x28
	.long	0x2cb
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	USBtoUSART_Buffer
	.uleb128 0x35
	.long	.LASF87
	.byte	0x3
	.byte	0x2b
	.long	0x2cb
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	USARTtoUSB_Buffer
	.uleb128 0x35
	.long	.LASF88
	.byte	0x3
	.byte	0x33
	.long	0xbc9
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	PulseMSRemaining
	.uleb128 0x36
	.long	0x2d6
	.uleb128 0x35
	.long	.LASF89
	.byte	0x3
	.byte	0x39
	.long	0x267
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	VirtualSerial_CDC_Interface
	.uleb128 0x35
	.long	.LASF90
	.byte	0x3
	.byte	0x4d
	.long	0x4d
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	ResetTimer
	.uleb128 0x35
	.long	.LASF91
	.byte	0x3
	.byte	0x4e
	.long	0x4d
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	tries
	.uleb128 0x35
	.long	.LASF92
	.byte	0x3
	.byte	0x4f
	.long	0x1ab
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	CurrentDTRState
	.uleb128 0x35
	.long	.LASF93
	.byte	0x3
	.byte	0x50
	.long	0x1ab
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	PreviousDTRState
	.uleb128 0x35
	.long	.LASF94
	.byte	0x3
	.byte	0x51
	.long	0x1ab
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	CurrentRTSState
	.uleb128 0x35
	.long	.LASF95
	.byte	0x3
	.byte	0x52
	.long	0x1ab
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	PreviousRTSState
	.uleb128 0x35
	.long	.LASF96
	.byte	0x3
	.byte	0x53
	.long	0x1ab
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	Selected1200BPS
	.uleb128 0x37
	.byte	0x1
	.long	.LASF99
	.byte	0xa
	.word	0x123
	.byte	0x1
	.byte	0x1
	.uleb128 0x38
	.byte	0x1
	.long	.LASF97
	.byte	0x9
	.word	0x106
	.byte	0x1
	.long	0x42
	.byte	0x1
	.long	0xc82
	.uleb128 0x39
	.long	0xb18
	.byte	0
	.uleb128 0x3a
	.byte	0x1
	.long	.LASF98
	.byte	0x9
	.byte	0xe9
	.byte	0x1
	.long	0x30
	.byte	0x1
	.long	0xc9f
	.uleb128 0x39
	.long	0xb18
	.uleb128 0x39
	.long	0x328
	.byte	0
	.uleb128 0x3b
	.byte	0x1
	.long	.LASF110
	.byte	0x9
	.byte	0xac
	.byte	0x1
	.byte	0x1
	.long	0xcb3
	.uleb128 0x39
	.long	0xb18
	.byte	0
	.uleb128 0x3c
	.byte	0x1
	.long	.LASF100
	.byte	0xb
	.byte	0xb2
	.byte	0x1
	.byte	0x1
	.uleb128 0x3a
	.byte	0x1
	.long	.LASF101
	.byte	0x9
	.byte	0x9e
	.byte	0x1
	.long	0x1ab
	.byte	0x1
	.long	0xcd5
	.uleb128 0x39
	.long	0xb18
	.byte	0
	.uleb128 0x3d
	.byte	0x1
	.long	.LASF111
	.byte	0x9
	.byte	0xa5
	.byte	0x1
	.byte	0x1
	.uleb128 0x39
	.long	0xb18
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
	.uleb128 0x20
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
	.uleb128 0x21
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
	.uleb128 0x22
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x25
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
	.uleb128 0x26
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
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
	.uleb128 0x29
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2b
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
	.uleb128 0x2c
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2e
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
	.uleb128 0x2f
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
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x30
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
	.uleb128 0x31
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
	.uleb128 0x32
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
	.uleb128 0xa
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
	.uleb128 0x36
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x37
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
	.uleb128 0x38
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
	.uleb128 0x39
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3a
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
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3c
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
	.uleb128 0x3d
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
	.long	.LVL17
	.long	.LVL21
	.word	0x1
	.byte	0x62
	.long	.LVL21
	.long	.LVL24
	.word	0x2
	.byte	0x8
	.byte	0x5f
	.long	0
	.long	0
.LLST5:
	.long	.LVL18
	.long	.LVL19
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL19
	.long	.LFE87
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
.LLST6:
	.long	.LVL19
	.long	.LVL23
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+1666
	.sleb128 0
	.long	.LVL23
	.long	.LVL25
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+1766
	.sleb128 0
	.long	.LVL28
	.long	.LVL35
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+1932
	.sleb128 0
	.long	.LVL35
	.long	.LVL53
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+2126
	.sleb128 0
	.long	.LVL53
	.long	.LFE87
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+2352
	.sleb128 0
	.long	0
	.long	0
.LLST7:
	.long	.LVL21
	.long	.LVL25
	.word	0x1
	.byte	0x62
	.long	0
	.long	0
.LLST8:
	.long	.LVL22
	.long	.LVL23
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL23
	.long	.LFE87
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
.LLST9:
	.long	.LVL23
	.long	.LVL25
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+1766
	.sleb128 0
	.long	.LVL28
	.long	.LVL35
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+1932
	.sleb128 0
	.long	.LVL35
	.long	.LVL53
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+2126
	.sleb128 0
	.long	.LVL53
	.long	.LFE87
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+2352
	.sleb128 0
	.long	0
	.long	0
.LLST10:
	.long	.LVL38
	.long	.LVL41
	.word	0x3
	.byte	0x8c
	.sleb128 -1
	.byte	0x9f
	.long	.LVL41
	.long	.LVL42
	.word	0x1
	.byte	0x6c
	.long	.LVL42
	.long	.LVL50
	.word	0x3
	.byte	0x8c
	.sleb128 -1
	.byte	0x9f
	.long	0
	.long	0
.LLST11:
	.long	.LVL28
	.long	.LVL29
	.word	0x1
	.byte	0x68
	.long	.LVL29
	.long	.LVL30-1
	.word	0x5
	.byte	0x3
	.long	USBtoUSART_Buffer+132
	.long	0
	.long	0
.LLST12:
	.long	.LVL26
	.long	.LVL30-1
	.word	0x1
	.byte	0x69
	.long	0
	.long	0
.LLST13:
	.long	.LVL27
	.long	.LVL28
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL28
	.long	.LFE87
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
.LLST14:
	.long	.LVL28
	.long	.LVL35
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+1932
	.sleb128 0
	.long	.LVL35
	.long	.LVL53
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+2126
	.sleb128 0
	.long	.LVL53
	.long	.LFE87
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+2352
	.sleb128 0
	.long	0
	.long	0
.LLST15:
	.long	.LVL30
	.long	.LVL31
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
	.long	.LVL35
	.long	.LVL38
	.word	0x1
	.byte	0x6c
	.long	0
	.long	0
.LLST17:
	.long	.LVL33
	.long	.LVL36
	.word	0x1
	.byte	0x68
	.long	.LVL36
	.long	.LVL38
	.word	0x2
	.byte	0x8
	.byte	0x5f
	.long	0
	.long	0
.LLST18:
	.long	.LVL34
	.long	.LVL35
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL35
	.long	.LFE87
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
.LLST19:
	.long	.LVL35
	.long	.LVL53
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+2126
	.sleb128 0
	.long	.LVL53
	.long	.LFE87
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+2352
	.sleb128 0
	.long	0
	.long	0
.LLST20:
	.long	.LVL37
	.long	.LVL38
	.word	0x3
	.byte	0x8
	.byte	0x20
	.byte	0x9f
	.long	0
	.long	0
.LLST21:
	.long	.LVL43
	.long	.LVL44
	.word	0x3
	.byte	0x8
	.byte	0x20
	.byte	0x9f
	.long	0
	.long	0
.LLST22:
	.long	.LVL45
	.long	.LVL46
	.word	0x2
	.byte	0x40
	.byte	0x9f
	.long	0
	.long	0
.LLST23:
	.long	.LVL53
	.long	.LVL54
	.word	0x1
	.byte	0x68
	.long	.LVL54
	.long	.LVL55-1
	.word	0x5
	.byte	0x3
	.long	USBtoUSART_Buffer+132
	.long	0
	.long	0
.LLST24:
	.long	.LVL51
	.long	.LVL55-1
	.word	0x1
	.byte	0x69
	.long	0
	.long	0
.LLST25:
	.long	.LVL52
	.long	.LVL53
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL53
	.long	.LFE87
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
.LLST26:
	.long	.LVL55
	.long	.LVL57
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST27:
	.long	.LVL56
	.long	.LVL57
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
	.long	.LVL62
	.long	.LVL64
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL64
	.long	.LVL73
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	.LVL73
	.long	.LFE91
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	0
	.long	0
.LLST30:
	.long	.LVL63
	.long	.LVL65
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL65
	.long	.LVL66
	.word	0x3
	.byte	0x8
	.byte	0x20
	.byte	0x9f
	.long	.LVL66
	.long	.LVL67
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL67
	.long	.LVL74
	.word	0x1
	.byte	0x6c
	.long	0
	.long	0
.LLST31:
	.long	.LVL72
	.long	.LVL75
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
	.long	.LVL76
	.long	.LVL77-1
	.word	0x1
	.byte	0x66
	.long	0
	.long	0
.LLST34:
	.long	.LVL78
	.long	.LVL79
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL79
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
	.long	0x6c
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
.LASF107:
	.string	"RingBuffer_Remove"
.LASF89:
	.string	"VirtualSerial_CDC_Interface"
.LASF108:
	.string	"LEDs_Init"
.LASF105:
	.string	"__iCliRetVal"
.LASF96:
	.string	"Selected1200BPS"
.LASF84:
	.string	"__vector_23"
.LASF90:
	.string	"ResetTimer"
.LASF104:
	.string	"/home/pi/Arduino/LUFA-100807/Projects/arduino-usbserial"
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
.LASF97:
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
.LASF75:
	.string	"LEDMask"
.LASF94:
	.string	"CurrentRTSState"
.LASF42:
	.string	"DeviceToHost"
.LASF59:
	.string	"__ToDo"
.LASF93:
	.string	"PreviousDTRState"
.LASF5:
	.string	"unsigned int"
.LASF87:
	.string	"USARTtoUSB_Buffer"
.LASF98:
	.string	"CDC_Device_SendByte"
.LASF28:
	.string	"CDC_PARITY_Space"
.LASF8:
	.string	"long unsigned int"
.LASF19:
	.string	"CDC_LineEncodingFormats_t"
.LASF27:
	.string	"CDC_PARITY_Mark"
.LASF58:
	.string	"sreg_save"
.LASF20:
	.string	"CDC_LINEENCODING_OneStopBit"
.LASF74:
	.string	"LEDs_TurnOnLEDs"
.LASF16:
	.string	"DEVICE_STATE_Configured"
.LASF23:
	.string	"CDC_LineEncodingParity_t"
.LASF49:
	.string	"Config"
.LASF80:
	.string	"EVENT_USB_Device_UnhandledControlRequest"
.LASF106:
	.string	"RingBuffer_Insert"
.LASF35:
	.string	"DataOUTEndpointSize"
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
.LASF111:
	.string	"CDC_Device_ProcessControlRequest"
.LASF95:
	.string	"PreviousRTSState"
.LASF11:
	.string	"sizetype"
.LASF34:
	.string	"DataOUTEndpointNumber"
.LASF53:
	.string	"Count"
.LASF22:
	.string	"CDC_LINEENCODING_TwoStopBits"
.LASF99:
	.string	"USB_Init"
.LASF37:
	.string	"NotificationEndpointNumber"
.LASF15:
	.string	"DEVICE_STATE_Addressed"
.LASF13:
	.string	"DEVICE_STATE_Powered"
.LASF33:
	.string	"DataINEndpointDoubleBank"
.LASF78:
	.string	"ReceivedByte"
.LASF83:
	.string	"ConfigMask"
.LASF72:
	.string	"SetupHardware"
.LASF110:
	.string	"CDC_Device_USBTask"
.LASF77:
	.string	"BufferCount"
.LASF40:
	.string	"_Bool"
.LASF1:
	.string	"unsigned char"
.LASF91:
	.string	"tries"
.LASF68:
	.string	"DoubleSpeed"
.LASF102:
	.string	"GNU C 4.8.1 -mmcu=atmega16u2 -gdwarf-2 -Os -std=gnu99 -funsigned-char -funsigned-bitfields -ffunction-sections -fno-inline-small-functions -fpack-struct -fshort-enums -fno-strict-aliasing"
.LASF38:
	.string	"NotificationEndpointSize"
.LASF63:
	.string	"RingBuffer_GetCount"
.LASF76:
	.string	"LEDs_TurnOffLEDs"
.LASF7:
	.string	"uint32_t"
.LASF26:
	.string	"CDC_PARITY_Even"
.LASF100:
	.string	"USB_USBTask"
.LASF29:
	.string	"char"
.LASF101:
	.string	"CDC_Device_ConfigureEndpoints"
.LASF50:
	.string	"State"
.LASF92:
	.string	"CurrentDTRState"
.LASF86:
	.string	"USBtoUSART_Buffer"
.LASF21:
	.string	"CDC_LINEENCODING_OneAndAHalfStopBits"
.LASF85:
	.string	"EVENT_CDC_Device_ControLineStateChanged"
.LASF57:
	.string	"PingPongLEDPulse"
.LASF47:
	.string	"ControlLineStates"
.LASF88:
	.string	"PulseMSRemaining"
.LASF60:
	.string	"__iRestore"
.LASF73:
	.string	"RingBuffer_InitBuffer"
.LASF54:
	.string	"RingBuff_t"
.LASF103:
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
.LASF79:
	.string	"EVENT_USB_Device_ConfigurationChanged"
.LASF71:
	.string	"setErasePin"
.LASF82:
	.string	"CDCInterfaceInfo"
.LASF45:
	.string	"ParityType"
.LASF81:
	.string	"EVENT_CDC_Device_LineEncodingChanged"
.LASF62:
	.string	"DataByte"
.LASF109:
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
