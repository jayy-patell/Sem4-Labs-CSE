	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x10001000
	DCD Reset_Handler
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R6, =RES
	MOV R2, #0
	LDR R0, =VAL1
	LDR R1, [R0]
UP 	CMP R1, #0XA
	BCC STORE
	SUB R1, #0XA
	ADD R2, #1
	B UP
STORE STRB R1, [R6], #1
	MOV R1, R2
	MOV R2, #0
	CMP R1, #0XA
	BCS UP
	STRB R1, [R6]
	MOV R3, R6
	LDR R2, =PACK
	LDR R6, =RES
	SUB R4, R3, R6
UP1	LDRB R0, [R6], #1
	LDRB R1, [R6], #1
	LSL R1, #4
	ORR R1, R0
	STRB R1, [R2], #1
	SUB R4, #1
	CMP R4, #2
	BCS UP1
STOP
	B STOP
VAL1 DCD 0X0035
	AREA mydata, DATA, READWRITE
RES DCD 0,0
PACK DCD 0
	END