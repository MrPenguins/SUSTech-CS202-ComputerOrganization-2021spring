# **CS202: Computer Organization**

## Lab assignment1

11911827 张皓淇

***

**Q1**: The output is different from the sample picture below. 

​	Reason1: After the command 

```MIPS
nor $t1, $zero, $zero
```

 the value in t1 would be 0xffffffff.

And after command 

``` MIPD
sra $t2, $t1, 31
```

The value in t2 would also be 0xffffffff.

However we need the value in t2 to be 0x00000001,  in order to get the correct output after the bitwise and operation.

So the above two command should be modify to

```MIPS
li $t2,1
```

So that we can get the correct output in a0.	

Reason2: In the command 

```MIPS
print_string("it is an odd number (0:false,1:true) : ")
```

We actually change the value in a0 to 0x1001001b, which will result in wrong output. So we need to change the sequence of our program.

```MIPS
.include "macro_print_str.asm"
.text
main:
	print_string("please input an integer : ")
	li $v0,5
	syscall
	move $t0, $v0
	print_string("it is an odd number (0:false,1:true) : ")
	li $t2,1
	and $a0, $t2, $t0
	li $v0,1
	syscall
	end
```

***

**Q2**: 

![image-20210309215350093](C:\Users\zhq\AppData\Roaming\Typora\typora-user-images\image-20210309215350093.png)
​							*Fig.1. screenshot of data segment before running*

![image-20210309215510052](C:\Users\zhq\AppData\Roaming\Typora\typora-user-images\image-20210309215510052.png)
							*Fig.2. screenshot of data segment after running*