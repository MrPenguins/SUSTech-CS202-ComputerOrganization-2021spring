.include "macro_print_str.asm"
.data
tdata: .byte 0xffffffff
.text
main:
lb $a0,tdata
li $v0,1
syscall
print_string("\n")
lb $a0,tdata
li $v0,36
syscall
end
