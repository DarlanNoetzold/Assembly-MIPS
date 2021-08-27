.data
	msg1: .asciiz"Informe um numero par e primo: "
	erro: .asciiz"\nErrroooouuu \nTente novamente: "
	certo: .asciiz"\nAcertou mizeravi!!!\n"
.text
.globl main
main: 
	li $v0,4		# mostra a msg1
	la $a0,msg1
	syscall
	SENHA=2 		
	li $t1, 0 		# t1 é o digitado
		
WHILE_LOOP:
	li $v0, 5       # syscall 5 (read_int)
	syscall         # read int
	move $t1, $v0	# salva lido em $t1
	beq $t1, SENHA, END_WHILE 	# if t1 == 2, sai
	li $v0,4	# ERRROOOOOUUUUUU
	la $a0,erro
	syscall
	j WHILE_LOOP
END_WHILE:
	li $v0,4	# mostra a msg1
	la $a0,certo
	syscall	


