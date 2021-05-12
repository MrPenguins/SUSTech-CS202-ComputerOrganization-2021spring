.include "macro_print_str.asm"
.text
main:
print_string("please input an integer : ")
li $v0,5
syscall
move $t0, $v0
nor $t1, $zero, $zero
sra $t2, $t1, 31
and $a0, $t2, $t0
print_string("it is an odd number (0:false,1:true) : ")
li $v0,1
syscall
end

