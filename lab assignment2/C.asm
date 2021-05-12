.data
	apply_stack: .asciiz "apply stack\n"
	release_stack: .asciiz "release stack\nreturn:"
	#return: .asciiz "return:"
	new_line: .asciiz "\n"
	
.text
	main:
		li $v0,5	# read first integer 
		syscall 
		move $t1,$v0
		li $v0,5	# read second integer
		syscall 
		move $t2,$v0
		
		move $a0,$t1
		move $a1,$t2
		jal power
		
		#print answer
		move $a0,$v1
		li $v0,1
		syscall
		
		li $v0,10
		syscall
		
		
	power:
		addi $sp,$sp,-8
		sw $ra,($sp)
		sw $s0,4($sp)
		
		#base case
		li $v1,1
		move $t0,$a0
		la $a0,apply_stack
		li $v0,4
		syscall
		move $a0,$t0
		beq $a1,$zero,power_done
		
		sub $a1,$a1,1
		jal power
		
		mul $v1,$a0,$v1
		
	power_done:
		move $t0,$a0
		la $a0,release_stack
		li $v0,4
		syscall
		move $a0,$v1
		li $v0,1
		syscall
		la $a0,new_line
		li $v0,4
		syscall
		move $a0,$t0
		
		lw $ra,($sp)
		lw $s0,4($sp)
		addi $sp,$sp,8
		jr $ra