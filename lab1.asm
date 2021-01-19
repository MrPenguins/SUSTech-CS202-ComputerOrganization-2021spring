	.text
	.globl main
main:
	li $v0,5 #read an integer
	syscall
	move $t0,$v0 #move the input integer to regester t0
	la $a0,name
	li $a1,32
	li $v0,8 #read an string
	syscall
	move $a0,$t0
	li $v0,1
	syscall
	la $a0,name
	li $v0,4
	syscall 
	
	.data
		name: .space 32 #define a space in memory to store the input name