.data
	# declaraçao de um vetor de 3 posiçoes char
	vet: .byte 'a', 'b','|'		# 
	nl: .asciiz"\n"
	.text
.globl main
main: 
	la $t0,vet			# carrega o ponteiro do vetor

# laço de leitura da memoria 	
	CONST=3 			# parametro de parada do laço
	i=0
	PRINT_CHAR=11		# codigo da chamada de sistema
	PRINT_STR=4			
	li $t9, 0 			# t9 é o contador (i)
	
FOR_LOOP:
	beq $t9, CONST, END_FOR 	# testa a condiçao
	lb $a0, vet($t9) 			# carrega o char do vetor
	li $v0, PRINT_CHAR		# char deve estar em $a0
	syscall
	addi $t9, $t9, 1	# incremento do i  
	addi $t1,$t1, 1		# incrementa o endereço
	j FOR_LOOP
END_FOR:
	
	
	
	
	