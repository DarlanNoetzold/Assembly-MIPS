.data
	vet: .space 4*4		
	spc:   .asciiz " ,"
	msg1:   .asciiz "\nDigite um numero (int): " 
    msg2:   .asciiz "\nO maior numero eh: : " 

.text
.globl main
main: 
	N_VET=4*4 		# tamanho do vetor 4 posiçoes x 4 bytes cada	
	PRINT_INT=1		# parametros das chamadas de sistema
	PRINT_STR=4

	li $t0, 0 		# $t0 é o contador (i)
WRITE_LOOP:
	bge $t0, N_VET, END_WRITE 	# testa a condiçao 

	li $v0, 4       # syscall 4 (print_str)
	la $a0, msg1    # argument: string
	syscall         # print the string

	li $v0, 5       # syscall 5 (read_int)
	syscall         # read int
	move $t1, $v0	# store number in $t1

	sw $t1, vet($t0)			# grava na memoria
    addi $t0, $t0, 4	# incremento do i de 4 em 4
	j WRITE_LOOP
END_WRITE:

	li $t0, 0 			# t0 é o contador (i)
    li $t6, 0 			# t0 é o contador (i)
PRINT_LOOP:
    lw $t5, vet($t0)
    bgt $t5, $t6, MAIOR         	       	

	bge $t0, N_VET-4, END_PRINT 	# testa a condiçao
	addi $t0, $t0, 4		# incremento do i de 4 em 4 
	addi $t9, $t9, 4		# incremento do end de 4 em 4 
	
	j PRINT_LOOP

MAIOR:
    lw $t6, vet($t0)
    j PRINT_LOOP

END_PRINT:

    li $v0, PRINT_STR       # syscall 4 (print_str)
	la $a0, msg2    # argument: string
	syscall         # print the string

    li $v0, 1     # syscall 1 (print_int)
	move $a0, $t6   # argument: integer
	syscall        # print the integer


