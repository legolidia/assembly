.data
	n1: .asciiz "n1:"
	n2: .asciiz "n2:"
	r: .asciiz "\nr= "
	
.text
#mensagem n1
	li $v0, 4
	la $a0, n1
	syscall
#le n1	
	li $v0, 5
	syscall
#salva
	move $t0, $v0
#mensagem n2
	li $v0, 4
	la $a0, n2
	syscall
#le n2
	li $v0, 5
	syscall
#salva
	move $t1, $v0
#soma
	add $t2, $t1, $t0
#msg resposta
	li $v0, 4
	la $a0, r
	syscall
	
#imprime r
	li $v0, 1
	move $a0, $t2
	syscall

	
	
	
	