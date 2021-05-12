.include "macro_print_str.asm"
.data
	str1: .asciiz "str1:"
	fd1: .float 1.0
	dd1: .double 2.0
.text
	lwc1 $f12,fd1
	li $v0,2
	syscall
	lwc1 $f1,fd1
	lwc1 $f2,dd1
	cvt.d.s $f4,$f1
	c.le.d $f2,$f4

	bc1t printLe
	j printGt

printLe:
	print_string("is less or equal than ")
	j printSecondData

printGt:
	print_string(" is larger than")

printSecondData:
	lwc1 $f12,dd1
	li $v0,3
	syscall
end