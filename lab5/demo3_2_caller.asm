.data
	str_caller: .asciiz "it's in print caller."
.text
.globl main
main:
	jal print_callee
	addi $v0,$0,0x0a636261
	sw $v0,defaulte_str
	addi $v0,$zero,4
	la $a0,str_caller
	syscall
	la $a0,defaulte_str
	syscall
	li $v0,10
	syscall