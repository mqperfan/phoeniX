li a0, 13    # a = 13
li t0, 0    # j = 0

LOOP:
mul t1, t0, t0      # i = j*j
bgt t1, a0, DONE    # if(i > a)
addi t0, t0, 1      # j++
beq x0, x0, LOOP    # back to the LOOP
DONE:
addi t0, t0, -1     # it is the answer
ebreak
