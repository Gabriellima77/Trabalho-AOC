#Fazer um algoritmo que receba um numero (1 < numero <= 50000)
#e demonstre o primeiro numero primo anterior a ele

.data
    msg1: .asciiz "\nDigite um numero (1 < num <= 50000): "
    msg2: .asciiz "\nNumero invalido! Digite novamente: "
    msg3: .asciiz "\nPrimeiro primo anterior: "

.text
main:
    #num($t0), anterior($t1), divisor($t2), resto($t3)
    #primo($t4), aux($t5)

    li $v0, 4
    la $a0, msg1
    syscall

leitura:
    li $v0, 5
    syscall
    add $t0, $v0, 0

    li $t5, 1
    ble $t0, $t5, invalido
    li $t5, 50000
    bgt $t0, $t5, invalido

    add $t1, $t0, -1

busca:
    li $t4, 1
    li $t2, 2

testa:
    mul $t6, $t2, $t2
    bgt $t6, $t1, verificar

    rem $t3, $t1, $t2

    li $t5, 0
    ble $t3, $t5, nao_primo
    bgt $t3, $t5, prox_div

nao_primo:
    li $t4, 0

prox_div:
    add $t2, $t2, 1
    j testa

verificar:
    li $t5, 1
    bne $t4, $t5, anterior

    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 1
    add $a0, $t1, 0
    syscall

    li $v0, 10
    syscall

anterior:
    add $t1, $t1, -1
    li $t5, 1
    bgt $t1, $t5, busca

    li $v0, 10
    syscall

invalido:
    li $v0, 4
    la $a0, msg2
    syscall
    j leitura