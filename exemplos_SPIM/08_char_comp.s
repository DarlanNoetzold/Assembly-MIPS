### utilizaçao de vetor e comparaçao com char
.data
	# declaraçao de um vetor de 3 posiçoes char
	char: .byte 'b'		# 
	errou: .asciiz"\nBurrrooooo: "
	acertou: .asciiz"\nAcertou: "
	.text
.globl main
main: 
	PRINT_CHAR=11		# codigo da chamada de sistema
	READ_CHAR=12			
	PRINT_STR=4
	li $t1, 0		
	lb $s0, char($t1)		# carrega o caractere
	
WHILE_LOOP:
	li $v0, READ_CHAR	#leitura do char do teclado
	syscall
	
	beq $v0, $s0, END_WHILE 	# testa a condiçao
	la $a0, errou			# se nao desviou, errou
	li $v0, PRINT_STR
	syscall
	
	j WHILE_LOOP
END_WHILE:
	la $a0, acertou			# se nao desviou, errou
	li $v0, PRINT_STR
	syscall
	
	
	
	
	