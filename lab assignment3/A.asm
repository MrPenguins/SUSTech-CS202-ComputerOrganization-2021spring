.data
	dp1: .double 4.0
	dp2: .double 3.0
	dp3: .double 2.0

.text
	li $v0,7
	syscall
	mov.d $f2,$f0	# store the precision
	l.d $f4,dp1	# store pi
	l.d $f6,dp1	# store the numerator
	l.d $f8,dp2	# store the denominator
	l.d $f16,dp3
	l.d $f14,dp1
	
	
	li $t1,-1
	calculatePI:
	
	div.d $f12,$f6,$f8
	add.d $f8,$f8,$f16

	beq $t1,1,plus
	j minus
	plus:
	add.d $f4,$f4,$f12
	li $t1,-1
	j more
	minus:
	sub.d $f4,$f4,$f12
	li $t1,1
	j more
	more:
	c.lt.d $f12,$f2
	bc1t output
	j calculatePI
	
	
	output:
	
	mov.d $f12,$f4
	li $v0,3
	syscall
	li $v0,10
	syscall