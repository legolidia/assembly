.data
N1: .asciiz "\nPrimeiro numero:"
N2: .asciiz "\nSegundo numero:"
N3: .asciiz "\nTerceiro numero:"
maior: .asciiz "\nO maior numero eh "
menor: .asciiz "\nO menor numero eh "
meio: .asciiz "\nO numero do meio eh "

.text

#le n1
li $v0, 4
la $a0, N1
syscall

li $v0, 5
syscall
move $t0, $v0

#le n2
li $v0, 4
la $a0, N2
syscall

li $v0, 5
syscall
move $t1, $v0

#le n3
li $v0, 4
la $a0, N3
syscall

li $v0, 5
syscall
move $t2, $v0

#acha o maior
move $s0, $t0 # maior = N1

#if n2 > maior
bgt $t1, $s0, if_n2_maior # se n2 > maior, maior = n2
j if_n3_maior # se não, verificar se n3 > maior


if_n2_maior:
move $s0, $t1 # maior = n2
bgt $t2, $s0, if_n3_maior # se n3 > maior, maior = n3
j fimMaior # se não, maior = n2

if_n3_maior: 
bgt $t2, $s0, n3_maior # se n3 > maior, maior = n3
j fimMaior # se não, maior = n2

n3_maior:
move $s0, $t2 # maior = n3

fimMaior:

#imprime o maior
li $v0, 4
la $a0, maior
syscall

li $v0, 1
addi $a0, $s0, 0
syscall

#acha o menor
move $s1, $t0 # menor = N1

blt $t1, $s1, if_n2_menor # se n2 < menor, menor = n2
j if_n3_menor # se não, verificar se n3 < menor

if_n2_menor:
move $s1, $t1 # menor = n2
blt $t2, $s1, if_n3_menor # se n3 < menor, menor = n3
j fimMenor  # se não, menor = n2

if_n3_menor:
blt $t2, $s1, n3_menor # se n3 < menor, menor = n3
j fimMenor # se não, menor = n2

n3_menor:
move $s1, $t2 # menor = n3

fimMenor:

#imprime o menor
li $v0, 4
la $a0, menor
syscall

li $v0, 1
addi $a0, $s1, 0
syscall

#acha o intermediário
beq $t0, $s0, check_n2_n3 #verifica se N1 é o maior
beq $t0, $s1, check_n2_n3 #verifica se N1 é o menor

move $s2, $t0 # N1 é o número do meio
j fimMeio # imprime o número do meio

check_n2_n3:
beq $t1, $s0, n2_menor #verifica se N2 é o maior
beq $t1, $s1, n2_menor #verifica se N2 é o menor
move $s2, $t1 # N2 é o número do meio
j fimMeio 

n2_menor:
move $s2, $t2 # N3 é o número do meio

fimMeio:
li $v0, 4
la $a0, meio
syscall

li $v0, 1
addi $a0, $s2, 0
syscall
