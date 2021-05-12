.data
	ans: .space 200
	
.text
	li $v0,5	# read first integer 
	syscall 
	move $t1,$v0
	li $v0,5	# read second integer
	syscall 
	move $t2,$v0
	
    la $s0,ans	# s0 indicate where the ascii should be store
    li $s1,42	# s1 store the ascii of *
    li $s2,61	# s2 store the ascii of =
    li $s3,32	# s3 store the ascii of (space)
    li $s4,10	# s4 store 10 and the ascii of (new line)
    

	outerloop:
	bgt $t1,$t2,output
	li $t0,1
	innerloop:
	bgt $t0,$t1,changeline
	addi $t9,$t0,48
    sb $t9,($s0)	# store the first multiplier
    addi $s0,$s0,1
    sb $s1,($s0)	# store the *
    addi $s0,$s0,1
    addi $t9,$t1,48
    sb $t9,($s0)	# store the second multiplier
    addi $s0,$s0,1
    sb $s2,($s0)	# store the =
    addi $s0,$s0,1
    mul $t3,$t0,$t1
    div $t3,$s4
    mfhi $t4	# remainder unit
    mflo $t5	# quotient tenth
    beqz $t5,storeunit
    addi $t9,$t5,48
    sb $t9,($s0)	# store tenth
    addi $s0,$s0,1
    addi $t9,$t4,48
    sb $t9,($s0)	# store unit
    addi $s0,$s0,1
    sb $s3,($s0)	# store (space)
    addi $s0,$s0,1
    addi $t0,$t0,1
    beqz $0,innerloop
    
    storeunit:
	addi $t9,$t4,48
    sb $t9,($s0)	# store unit
    addi $s0,$s0,1
    sb $s3,($s0)	# store (space)
    addi $s0,$s0,1
    sb $s3,($s0)	# store (space)
    addi $s0,$s0,1
    addi $t0,$t0,1
    beqz $0,innerloop
    
    
	output:
	li $v0,4
	la $a0,ans
	syscall
	li $v0,10
	syscall
	
	changeline:
	sb $s4,($s0)
	addi $s0,$s0,1
	addi $t1,$t1,1
	beqz $0,outerloop