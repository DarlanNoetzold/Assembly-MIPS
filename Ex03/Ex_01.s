.data
	msg1: .asciiz"Informe um numero: "
	erro: .asciiz"\nErrou \nTente novamente: "
	certo: .asciiz"\nAcertou\n"
	msg3:   .asciiz " eh maior"
	msg4:   .asciiz " eh menor"
	msg5:   .asciiz "\n" 
.text
.globl main
main:
	li $v0,4		# mostra a msg1
	la $a0,msg1
	syscall
	SENHA=10		
		
WHILE_LOOP:
	li $t1, 0 		# t1 é o digitado
	li $v0, 5       # syscall 5 (read_int)
	syscall         # read int
	move $t1, $v0	# salva lido em $t1

	beq $t1, SENHA, END_WHILE 
	

	bgt $t1, SENHA, MAIOR

	li $v0, 4       # syscall 4 (print_str)
	la $a0, msg5    # argument: string
	syscall

    li $v0, 1       # syscall 1 (print_int)
	move $a0, $t1   # argument: integer
	syscall        # print the integer

    li $v0, 4       # syscall 4 (print_str)
	la $a0, msg4    # argument: string
	syscall         # print the string

	li $v0, 4       # syscall 4 (print_str)
	la $a0, msg5    # argument: string
	syscall

	li $v0,4
	la $a0,erro
	syscall

	j WHILE_LOOP

MAIOR:
	li $v0, 4       # syscall 4 (print_str)
	la $a0, msg5    # argument: string
	syscall

    li $v0, 1       # syscall 1 (print_int)
	move $a0, $t1   # argument: integer
	syscall        # print the integer

    li $v0, 4       # syscall 4 (print_str)
	la $a0, msg3    # argument: string
	syscall         # print the string

	li $v0, 4       # syscall 4 (print_str)
	la $a0, msg5    # argument: string
	syscall

	li $v0,4
	la $a0,erro
	syscall

	j WHILE_LOOP

	
END_WHILE:
	li $v0,4	# mostra a msg1
	la $a0,certo
	syscall	


