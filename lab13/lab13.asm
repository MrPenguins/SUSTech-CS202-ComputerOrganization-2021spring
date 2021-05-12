.data
	array: .word 1,1,1
	tmp: .word 0 : 100
.text
	la $t0, array
	li $t1, 25
	loop:
	lw $t3, 0($t0)
	lw $t4, 4($t0)
	lw $t5, 8($t0)
	add $t2, $t3, $t4
	add $t2, $t2, $t5
	sw $t2, 12($t0)
	addi $t0, $t0, 4
	addi $t1, $t1, -1
	bgtz $t1, loop
	li $v0, 10
	syscall