	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0X10001000
	DCD Reset_Handler
	ALIGN
	AREA Mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R1, =ARRAY
	LDR R2, =SUM
	MOV R0, #0
	MOV R6, #10
LOOP LDR R3, [R1]
	 ADD R5,R5,R3
	 SUBS R6, #1
	 ADD R1,#4
	 BNE LOOP
	STR R5, [R2]
STOP B STOP
ARRAY DCD 1,2,3,4,5,6,7,8,9,10
	AREA mydata, DATA, READWRITE
SUM DCD 0
	END
	
	 