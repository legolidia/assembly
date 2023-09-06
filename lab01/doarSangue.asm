.data
idade: .asciiz "Sua idade:"
doenca: .asciiz "Voce tem alguma doenca? \n1. Nao \n2. Sim\n"
resposta1: .asciiz "Voce pode doar sangue!"
resposta2: .asciiz "Voce nao pode doar sangue, pois esta doente"
resposta3: .asciiz "Voce precisa ter 18 anos ou mais para doar sangue"

.text
li $v0, 4
la $a0, idade
syscall

li $v0, 5
syscall
move $s0, $v0


li $v0, 4
la $a0, doenca
syscall

li $v0, 5
syscall
move $s1, $v0


bge $s0, 18, if
blt $s0, 18, else

if:
beq $s1, 1, pode
beq $s1, 2, naoPode
j fim

pode:
li $v0, 4
la $a0, resposta1
syscall
j fim

naoPode:
li $v0, 4
la $a0, resposta2
syscall
j fim

else:
li $v0, 4
la $a0, resposta3
syscall

fim:



