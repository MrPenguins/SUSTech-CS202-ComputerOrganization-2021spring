.include "macro_print_str.asm"
.macro print_float(%fr)
	addi $sp,$sp,-8
	swc1 $f12,4($sp)
	sw $v0,0($sp)
	mov.s $f12,%fr
	li $v0,2
	syscall
	lw $v0,0($sp)
	lwc1 $f12,4($sp)
	addi $sp,$sp,8
.end_macro

.macro print_int(%fr)
	addi $sp,$sp,-8
	swc1 $f12,4($sp)
	sw $v0,0($sp)
	mfc1 $a0,%fr
	li $v0,1
	syscall
	lw $v0,0($sp)
	lwc1 $f12,4($sp)
	addi $sp,$sp,8
.end_macro
.data
	f1: .float 12.525
.text
	lwc1 $f0,f1
	floor.w.s $f1,$f0
	ceil.w.s $f2,$f0
	round.w.s $f3,$f0
	print_string("orignal float: ")
	print_float($f0)
	print_string("\nafter floor:")
	print_int($f1)
	print_string("\nafter ceil:")
	print_int($f2)
	print_string("\nafter round:")
	print_int($f3)
	end



