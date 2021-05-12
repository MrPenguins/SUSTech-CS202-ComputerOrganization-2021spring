.data
	output: .space 8	# define space in memory to store the output

.text
	li $v0,5	# read first integer 
	syscall 
	move $t1,$v0
	addi $v0,$v0,48
	sb $v0,output
	li $t3,42
	sb $t3,output+1	# store *
	li $v0,5	# read second integer
	syscall 
	move $t2,$v0
	addi $v0,$v0,48	
	sb $v0,output+2
	li $t3,61
	sb $t3,output+3	# store =
	mul $t0,$t1,$t2
	li $t3,10
	div $t0,$t3
	mfhi $t1
	mflo $t2
	beqz $t2,storeunit
	addi $t1,$t1,48
	addi $t2,$t2,48
	sb $t2,output+4
	sb $t1,output+5
	beqz $0,outputs
	storeunit:
	addi $t1,$t1,48
	sb $t1,output+4
	outputs:
	li $v0,4
	la $a0,output
	syscall
	li $v0,10
	syscall
	
