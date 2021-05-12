.data
	name:	.space 16
	mick:	.ascii "mick\n"
	alice:	.asciiz "alice\n"
	tony:	.asciiz "tony\n"
	chen:	.asciiz "chen\n"
.text
main:
	la $t0,name
	
	la $t1 ,mick
	sw $t1,($t0)
	la $t1 ,alice
	sw $t1,4($t0)
	la $t1 ,tony
	sw $t1,8($t0)
	la $t1 ,chen
	sw $t1,12($t0)
	
	li $v0,4
	lw $a0,0($t0)
	syscall
	
	li $v0,4	#the first approach print alice
	la $a0,alice
	syscall
	
	li $v0,4	#the second approach
	lw $a0, 4($t0)
	syscall
	
	
	
	li $v0,10
	syscall
	
syscall