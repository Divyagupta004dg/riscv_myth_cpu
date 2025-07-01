        .text
        .globl _start

_start:
        li x1, 0        # a = 0
        li x2, 1        # b = 1
        li x3, 10       # count = 10
        li x4, 0        # temp = 0

loop:
        add x4, x1, x2  # temp = a + b
        mv x1, x2       # a = b
        mv x2, x4       # b = temp
        addi x3, x3, -1 # count--
        bnez x3, loop   # if count != 0, loop
        nop
