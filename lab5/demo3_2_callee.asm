.data
	.extern defaulte_str 20
	str_callee: .asciiz "it's in print callee." 
	defaulte_str: .asciiz "ABC\n"
.text
.globl print_callee
print_callee: addi $sp,$sp,-4
			sw $v0,($sp)
			addi $v0,$zero,4
			la $a0,str_callee
			syscall
			la $a0,defaulte_str
			syscall
			lw $v0,($sp)
			addi $sp,$sp,4
			jr $ra
