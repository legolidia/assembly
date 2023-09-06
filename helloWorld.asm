.data
	msg: .asciiz "Hello World!"
.text
	li $v0, 4
	la $a0, msg
	syscall
