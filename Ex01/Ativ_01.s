    .data
msg1:   .asciiz "\nDigite um numero (int): "
msg2:   .asciiz "\nO numero lido foi: "
msg3:   .asciiz "\nSoma: "
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
	move $a0, $t2   # argument: integer
	syscall        # print the integer

	li $v0, 4       # syscall 4 (print_str)
	la $a0, msg1    # argument: string
	syscall         # print the string

	li $v0, 5       # syscall 5 (read_int)
	syscall         # read int
	move $t2, $v0	# store number in $t0
	
	li $v0, 4       # syscall 4 (print_str)
	la $a0, msg2    # argument: string
	syscall         # print the string

	li $v0, 1       # syscall 1 (print_int)
	move $a0, $t2   # argument: integer
	syscall         # print the integer
	
	add $t3, $t1, $t0 # add two numbers into $t3
	add $t3, $t3, $t2

	li $v0, 4       # syscall 4 (print_str)
	la $a0, msg3    # argument: string
	syscall         # print the string

	li $v0, 1       # syscall 1 (print_int)
	move $a0, $t3   # argument: integer
	syscall         # print the integer

	li $v0, 10 		# terminate program
	syscall
		
		
		
		
		