@ Zachary Eisenhauer Program 3 for CSCE 2610 Assembly language and Computer Organization

.global_main:
main:
	LDR R2, =Y	         @Loads the address of Y into R
  	LDR R2, [R2]         @Loads the value of Y into R
	MOV R3, #0           @Initialize Q to 0
	LDR R4, =X     		 @Loads the address of X into X reg.
	LDR R4, [R4]   		 @Loads the value of X into X reg.
	MOV R4, R4, LSL #16
	MOV R5, #1           @Movesvalue of 1 into R5
	MOV R6, #0           @Moves value of 0 into R6
	MOV R7, #0    	     @counter variable
	MOV R8, R2
	B loop               @Go to loop
	
loop:
	ADD R7, R7, #01		 @increments counter value
	CMP R7, #18			 @compare counter with its limit value
	BEQ print_INIT 		 @if out counter reaches its end, go to printing statements
	SUB R8, R8, R4       @Set R = R - X
	CMP R8, #0		     @Compares (R - X) to 0
	BGE shift     	     @If (R - X) >= 0, branch.
	ADD R8, R8, R4       @If (R - X) < 0, R = R + X
	MOV R3, R3, LSL #01  @Shift quotient the the left 1
	MOV R4, R4, LSR #01  @Shift X to the right 1
	B loop

shift:
	MOV R3, R3, LSL #01  @Shifts quotient to the left 1
	ADD R3, R3, #01		 @Set LSB to 1
	MOV R4, R4, LSR #01  @shift X to the right 1
	B loop
	
print_INIT:
	MOV R0, #1           @Print the Divide format " DIV "
	LDR R1, =D
	SWI 0x69
	
print_Q:		         @Print quotient message
	MOV R0, #1           @Print quotient format "(Q = "
	LDR R1, =Q
	SWI 0x69
	
	MOV R0, #1           @Quotient value
	MOV R1, R3
	SWI 0x6b
	
print_R:    	         @Print remainder message
	MOV R0, #1           @Remainder format ",R = "
	LDR R1, =R
	SWI 0x69
	
	MOV R0, #1           @Remainder value
	MOV R1, R8
	SWI 0x6b
	
	MOV R0, #1           @Remainder end format ")"
	LDR R1, =P
	SWI 0x69
	
	SWI 0x11
	
.data
Q: .asciz "(Q = " 		 @For printing the quotient message
R: .asciz ", R = " 		 @For printing the remainder message
P: .asciz ")"            @For the ending parenthesis 
Y: .word 12 		     @Initialize Y
D: .asciz "12 DIV 6 = "  @For print the initial divide message
X: .word 6  		     @Initialize X
.end