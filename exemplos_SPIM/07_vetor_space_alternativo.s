# exemplo de manipulaçao de vetor de forma alternativa
# neste caso, o endereço todo fica em $t9
.data
	# declaraçao de um vetor de 3 posiçoes int
	vet: .space 3*4		
	spc:   .asciiz " ,"

.text
.globl main
main: 
	N_VET=3*4 		# tamanho do vetor 3 posiçoes x 4 bytes cada
	PRINT_INT=1		# parametros das chamadas de sistema
	PRINT_STR=4		
	
	la $t9,vet		# carrega o ponteiro do vetor
	li $t0, 0 		# $t0 é o contador (i)
WRITE_LOOP:
	bge $t0, N_VET, END_WRITE 	# testa a condiçao
	addi $t0, $t0, 4	# incremento do i de 4 em 4 
	sw $t0, ($t9)		# grava i na memoria
	addi $t9, $t9, 4	# incremento do end de 4 em 4 
	j WRITE_LOOP
END_WRITE:

	la $t9,vet			# carrega o ponteiro do vetor
	li $t0, 0 			# t0 é o contador (i)
PRINT_LOOP:
	lw $a0, ($t9)		# le o dado do vetor
	li $v0, PRINT_INT   # mostra o valor lido
	syscall         	# 

	li $v0, PRINT_STR	# mostra " ,"
	la $a0, spc    		 
	syscall         	

	bge $t0, N_VET-4, END_PRINT 	# testa a condiçao
	addi $t0, $t0, 4		# incremento do i de 4 em 4 
	addi $t9, $t9, 4		# incremento do end de 4 em 4 
	
	j PRINT_LOOP
END_PRINT:

	
	
	
	
	