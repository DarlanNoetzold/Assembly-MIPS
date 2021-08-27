.data
msg1:   .asciiz "\nDigite um numero (int): "
msg2:   .asciiz "\nO numero lido foi: "
msg3:   .asciiz " eh maior"
msg4:   .asciiz " \n"

    .text
    .globl main
main:
	li $v0, 4       # syscall 4 (print_str)
	la $a0, msg1    # argument: string
	syscall         # print the string

	li $v0, 5       # syscall 5 (read_int)
	syscall         # read int
	move $t0, $v0	# store number in $t0
	
	li $v0, 4       # syscall 4 (print_str)
	la $a0, msg2    # argument: string
	syscall         # print the string

	li $v0, 1       # syscall 1 (print_int)
	move $a0, $t0   # argument: integer
	syscall         # print the integer

	li $v0, 4       # syscall 4 (print_str)
	la $a0, msg1    # argument: string
	syscall         # print the string

	li $v0, 5       # syscall 5 (read_int)
	syscall         # read int
	move $t1, $v0	# store number in $t1
	
	li $v0, 4       # syscall 4 (print_str)
	la $a0, msg2    # argument: string
	syscall         # print the string

	li $v0, 1       # syscall 1 (print_int)
	move $a0, $t1   # argument: integer
	syscall        # print the integer

    bgt $t1, $t0, MAIOR

    li $v0, 4       # syscall 4 (print_str)
	la $a0, msg4    # argument: string
	syscall

    li $v0, 1       # syscall 1 (print_int)
	move $a0, $t0   # argument: integer
	syscall        # print the integer

    li $v0, 4       # syscall 4 (print_str)
	la $a0, msg3    # argument: string
	syscall

    li $v0, 10	# código para encerrar o programa
	syscall		# executa a chamada do SO para encerrar

MAIOR:
    li $v0, 4       # syscall 4 (print_str)
	la $a0, msg4    # argument: string
	syscall

    li $v0, 1       # syscall 1 (print_int)
	move $a0, $t1   # argument: integer
	syscall        # print the integer

    li $v0, 4       # syscall 4 (print_str)
	la $a0, msg3    # argument: string
	syscall         # print the string