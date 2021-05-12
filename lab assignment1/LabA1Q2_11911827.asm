.include "macro_print_str.asm"
.data
#distribute two integers for immediate value addressing method
#define all the labels of address in memory in which operands and results are stored
	operand1: .word 1000000	#the first operand
	operand2: .word 99999	#the second operand
	result1: .word 0    #the result of addition
	result2: .word 0	#the result of subtraction
	result3: .word 0    #the result of multiplication(hi)
	result4: .word 0    #the result of multiplication(lo)
	result5: .word 0    #the result of division(hi):remainder
	result6: .word 0    #the result of division(lo):quotient
	op1add: .word 0x10010000	#the address of the first operand
	op2add: .word 0x10010004	#the address of the second operand
	
.text
	lw $t4,op1add	#register t4 contains the address of the first operand
	lw $t5,op2add	#register t5 contains the address of the second operand

	#addition(immediate value addressing)
	li $t2,1000000	#fetch the operands
	li $t3,99999
	add $t1,$t2,$t3	#calculate
	sw $t1,result1	#store the result at address 0x10010008
	li $a0,1000000	#print the equation on screen in the form of A + B = C
	li $v0,1
	syscall
	print_string(" + ")
	li $a0,99999
	li $v0,1
	syscall
	print_string(" = ")
	move $a0,$t1
	li $v0,1
	syscall
	print_string("\n")
	
	#subtraction(direct addressing)
	lw $t2,operand1	#fetch the operands
	lw $t3,operand2
	sub $t1,$t2,$t3	#calculate
	sw $t1,result2	#store the result at address 0x1001000C
	lw $a0,operand1	#print the equation on screen in the form of A - B = C
	li $v0,1
	syscall
	print_string(" - ")
	lw $a0,operand2
	li $v0,1
	syscall
	print_string(" = ")
	move $a0,$t1
	li $v0,1
	syscall
	print_string("\n")
	
	#multiplication(indirect addressing)
	lw $t2,($t4)	#fetch the operands
	lw $t3,($t5)
	mult $t2,$t3	#calculate
	mfhi $t0
	sw $t0,result3	#store the result at address 0x10010010
	mflo $t1
	sw $t1,result4	#store the result at address 0x10010014
	lw $a0,($t4)	#print the equation on screen in the form of A * B = C
	li $v0,1
	syscall
	print_string(" * ")
	lw $a0,($t5)
	li $v0,1
	syscall
	print_string(" = hi:(hexadecimal) ")
	move $a0,$t0
	li $v0,34
	syscall
	print_string(" lo:(hexadecimal) ")
	move $a0,$t1
	li $v0,34
	syscall
	print_string("\n")
	
	#division(#baseline addressing)
	lw $t2,0($t4)	#fetch the operands
	lw $t3,4($t4)
	div $t2,$t3	#calculate
	mfhi $t0
	sw $t0,result5	#store the result at address 0x10010018
	mflo $t1
	sw $t1,result6	#store the result at address 0x1001001C
	lw $a0,0($t4)	#print the equation on screen in the form of A / B = C
	li $v0,1
	syscall
	print_string(" / ")
	lw $a0,4($t4)
	li $v0,1
	syscall
	print_string(" = ")
	move $a0,$t1
	li $v0,1
	syscall
	print_string(" remainder ")
	move $a0,$t0
	li $v0,1
	syscall
	print_string("\n")
