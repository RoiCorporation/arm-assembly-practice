.text
.global strcopy
.type strcopy, %function

strcopy:
1:
    ldrb    w2, [x1], #1
    strb    w2, [x0], #1
    cbnz    w2, 1b
    ret
