.data
	fp1: .float 1.0
	fp2: .float 10.0
	fp3: .float 0.5
	ans: .space 20
	
.text
	li $v0,6
	syscall
	mov.s $f2,$f0
	li $v0,5
	syscall
	move $t1,$v0
	l.s $f4,fp2
	l.s $f6,fp3
	li $t2,0
	
	beqz $t1,floor
	times10:
	mul.s $f2,$f2,$f4
	addi $t2,$t2,1
	bne $t2,$t1,times10
	
	floor:
	add.s $f2,$f2,$f6
	floor.w.s $f8,$f2
	
	mfc1 $t3,$f8
	move $t2,$t1
	li $t4,10
	beqz $t1,print
	divide10:
	div $t3,$t4
	mflo $t3
	mfhi $t5
	addi $t5,$t5,48
	sb $t5,ans($t2)
	subi $t2,$t2,1
	bnez $t2,divide10
	
	li $t5,46
	sb $t5,ans
	print:
	move $a0,$t3
	li $v0,1
	syscall
	la $a0,ans
	li $v0,4
	syscall
	
	li $v0,10
	syscall
