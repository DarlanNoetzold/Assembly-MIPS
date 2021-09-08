.data
	vet: .space 5*4		
	spc:   .asciiz " ,"
	msg1:   .asciiz "\nDigite um numero (int): " 
    msg2:   .asciiz "\nSoma: " 

.text
.globl main
main: 
	N_VET=5*4 		# tamanho do vetor 5 posiçoes x 4 bytes cada	
	PRINT_INT=1		# parametros das chamadas de sistema
	PRINT_STR=4

	li $t0, 0 		# $t0 é o contador (i)
    li $t3, 0
WRITE_LOOP:
	bge $t0, N_VET, END_WRITE 	# testa a condiçao 

	li $v0, 4       # syscall 4 (print_str)
	la $a0, msg1    # argument: string
	syscall         # print the string

	li $v0, 5       # syscall 5 (read_int)
	syscall         # read int
	move $t1, $v0	# store number in $t0

    add $t3, $t3, $t1
	sw $t1, vet($t0)			# grava na memoria
 
    addi $t0, $t0, 4	# incremento do i de 4 em 4
	j WRITE_LOOP
END_WRITE:

	li $t0, 0 			# t0 é o contador (i)
PRINT_LOOP:
	lw $a0, vet($t0)		# le o dado do vetor
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

    li $v0, PRINT_STR       # syscall 4 (print_str)
	la $a0, msg2    # argument: string
	syscall         # print the string

    li $v0, 1     # syscall 1 (print_int)
	move $a0, $t3   # argument: integer
	syscall        # print the integer