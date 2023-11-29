.data
N:
.word 5
M:
.word 6
matrix:
.word 0, 0, 3, 4, 5
.word -1, -2, -3, -4, -5
.word 1, 2, 3, 4, 5
.word -1, -2, -3, -4, -5
.word 1, 2, 3, 4, 5
.word -1, -2, -3, -4, -5
result:
.word 0
.word 0
.word 0
.text

main:
la a2, N
la a3, M
la a4, matrix
la a5, result
call process
la a2, M
la a3, result
call print
call exit

print:
addi t5, x0, 3
addi t2, x0, 0

print_cycle:
addi a0, x0, 1 # print_int ecall
lw a1, 0(a3)
ecall

addi a0, x0, 11 # print_char ecall
addi a1, x0, 32
ecall

addi t2, t2, 1
addi a3, a3, 4
blt t2, t5, print_cycle
ret

exit:
addi a0, x0, 10
ecall

process:
lw t1, 0(a2) # N
lw t2, 0(a3) # M

addi t4, x0, 0 # row pointer
addi t5, x0, 0 # count for numbers

init:
addi t3, x0, 0 # row element number

cycle:
lw t6, 0(a4) # load value from array
addi a4, a4, 4 # increment array pointer

# Тут делается проверка числа
bgtz t6, sw_posedge
bltz t6, sw_negedge
beqz t6, sw_zero

sw_posedge:
lw t5, 0(a5)
addi t5, t5, 1
sw t5, 0(a5)
addi t5, x5, 0
j, skip_write

sw_negedge:
lw t5, 4(a5)
addi t5, t5, 1
sw t5, 4(a5)
addi t5, x0, 0
j, skip_write

sw_zero:
lw t5, 8(a5)
addi t5, t5, 1
sw t5, 8(a5)
addi t5, x0, 0
j, skip_write

skip_write:
addi t3, t3, 1
blt t3, t1, cycle
addi t4, t4, 1
blt t4, t2, init
ret