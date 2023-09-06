.data
entrada1: .asciiz "entrada 1:"
entrada2: .asciiz "entrada 2:"
saida: .asciiz "res: "

.text
li $v0, 4
la $a0, entrada1
syscall

li $v0, 5
syscall
move $t0, $v0 #copia do valor lido em $t0

li $v0, 4
la $a0, entrada2
syscall

li $v0, 5
syscall
move $t1, $v0 #copia do valor lido em $t0


and $t2, $t0, $t1

li $v0, 4
la $a0, saida
syscall

li $v0,1
move $a0, $t2
syscall