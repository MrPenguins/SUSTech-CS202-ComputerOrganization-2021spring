# CS202

## Homework2

11911827 张皓淇

***

**2.10** 

```c
A[1]=A;
f=A+A;
```

***

**2.12**

2.12.1 **0x00000000**

2.12.2 **No, it has been overflow.**

2.12.3 **0xb0000000**

2.12.4 **Yes, it is the desired result.**

2.12.5 **0x00000000**

2.12.6 **No, it has been overflow.**

***

**2.14** 

Type: **R-type instruction(addition)**.

Instruction: **``` add $s0, $s0, $s0```**

***

**2.16**

Type: **R-type instruction(subtraction)**.

Instruction: **```sub $v1, $v1, $v0```**

Binary: **000000 00011 00010 00011 00000 100010**

***

**2.19**

$t0 = 0xAAAAAAAA=0b1010_1010_1010_1010_1010_1010_1010_1010

$t1 = 0x12345678=0b0001_0010_0011_0100_0101_0110_0111_1000

2.19.1 After the first instruction (```sll $t2,$t0, 4```) $t2=0xAAAAAAA0

​		After the second instruction (```or $t2, $t2, $t1```) $t2=0b1011_1010_1011_1110_1111_1110_1111_1000=0xBABEFEF8

​		So the final answer is **$t2=BABEFEF8**

2.19.2 **$t2=0xAAAAAAA0**

2.19.3 After the first instruction (```srl $t2, $t0, 3```) $t2=0x15555555

​		After the second instruction (```andi $t2, $t2, 0xFFEF```) $t2=0x00005545

​		So the final answer is **$t2=0x00005545**.

***

**2.23** **$t2=0x00000003**





