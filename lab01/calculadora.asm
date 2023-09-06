.data
op: .asciiz "Menu: \n1. Soma \n2.Subtracao \n3. Multiplicacao \n4. Divisao \n5. Sair \nEscolha a operacao (1/2/3/4/5):"
n1: .asciiz "N1:"
n2: .asciiz "N2:"
r: .asciiz "Resultado:"

.text

#printa o menu
li $v0, 4
la $a0, op
syscall

#le o valor da operacao
li $v0, 5
syscall
move $t0, $v0


#if op == 5: sai
beq $t0, 5, fim

#exibe printf n1
li $v0, 4
la $a0, n1
syscall

#le n1
li $v0, 5
syscall
move $t1, $v0

#exibe printf n2
li $v0, 4
la $a0, n2
syscall

#le n2
li $v0, 5
syscall
move $t2, $v0

#if op == 1: soma
beq $t0, 1, soma

#if op == 2: subtrai
beq $t0, 2, subtracao

#if op == 3: multiplica
beq $t0, 3, multiplicacao

#if op == 4: divide
beq $t0, 4, divisao

soma:
add $t3, $t2, $t1
j resultado

subtracao:
sub $t3, $t1, $t2
j resultado

multiplicacao:
mul $t3, $t2, $t1
j resultado

divisao:
div $t3, $t1, $t2
j resultado

resultado:
li $v0, 4
la $a0, r
syscall

li $v0, 1
move $a0, $t3
syscall

fim:


