# CS202

## Homework5

11911827 张皓淇

***

### 5.3

**5.3.1** 

cache block size: $2^5 bytes=32 bytes=8 words$

**5.3.2** 

entries: $2^5=32$

**5.3.3** 

For a block:

valid bit + tag = 23 bits

data storage = 32 bits

$ratio=\frac{(23+32*8)}{8*32}=\frac{279}{256}\approx1.0898$

**5.3.4** 

| Address | Index | State |
| ------- | ----- | ----- |
| 0       | 00000 | miss |
| 4       | 00000 | hit |
| 16      | 00000 | hit |
| 132     | 00100 | miss |
| 232     | 00111 | miss |
| 160     | 00101 | miss |
| 1024    | 00000 | replace |
| 30      | 00000 | replace |
| 140     | 00100 | hit |
|3100|00000|replace|
|180|00101|hit|
|2180|00100|replace|

So there are two blocks replaced, block 1 and block 4.

**5.3.5**

hit ratio$=4/12=\frac13\approx33.3\%$

**5.3.6**

```
<index,		tag,	data>
<00100,		10,		32 bytes data from 2176>
<00101,		00,		32 bytes data from 160>
<00000,		11,		32 bytes data from 3072>
<00111,		00,		32 bytes data from 224>
```



***

### 5.6

**5.6.1**

P1: $1s/0.66ns=1.5GHz$

P2: $1s/0.90ns=1.11GHz$

**5.6.2**

P1: Average Memory Access Time=$0.66+0.08*70=6.26ns$

P2: Average Memory Access Time=$0.90+0.06*70=5.10ns$

**5.6.3**

P1: CPI=$1+8\%*36\%*\frac{70ns}{0.66ns}+8\%*\frac{70ns}{0.66ns}=12.539$

P2: CPI=$1+6\%*36\%*\frac{70ns}{0.90ns}+6\%*\frac{70ns}{0.90ns}=7.347$

P1: Instructions per second=$1.5GHz/12.539=119626765$

P2: Instructions per second=$1.11GHz/7.347=151082074$

So P2 is faster.

**5.6.4**

AMAT for P1 with the addition of an L2 cache=$0.66+0.08*5.62+0.08*0.95*70=6.4296ns>6.26ns$

So the AMAT is worse with the L2 cache.

**5.6.5**

CPI for P1 with the addition of an L2 cache=$1+8\%*36\%*\frac{5.62ns}{0.66ns}+8\%*36\%*95\%*\frac{70ns}{0.66ns}+8\%*\frac{70ns}{0.66ns}=12.632$

**5.6.6**

P1 with the addition of an L2 cache: Instructions per second=$1.5GHz/12.632=118746042$

So P2 is faster.

In order to match P2’s performance, P1's CPI=$1.5GHz/151082074=9.93$

P1: CPI=$1+x*36\%*\frac{5.62ns}{0.66ns}+x*36\%*95\%*\frac{70ns}{0.66ns}+x*\frac{70ns}{0.66ns}=9.93$

$x=6.78\%$

So in order to match P2’s performance, the miss rate in P1's L1 cache should be 6.78%.



