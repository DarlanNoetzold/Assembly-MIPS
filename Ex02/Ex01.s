.data
	msg4: .asciiz"\n"
	msg1:   .asciiz "\nDigite um numero (int): "
	msg2:   .asciiz "\nO numero lido foi: "
	msg3:   .asciiz "\nSoma: "
.text
.globl main
main:
	CONST=10		#define uma constante
	li $t1, 0 		# t1 é o contador (i)
	
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
	la $a0, msg4    # argument: string
	syscall         # print the string

FOR_LOOP:
	bgt $t1, $t0, END_FOR  
	li $v0, 1              # mostra valor de i
	move $a0, $t1   
	syscall         
	li $v0,4			# mostra a msg4
	la $a0,msg4
	syscall

	add $t3, $t1, $t3
	addi $t1, $t1, 1 	# i++
	j FOR_LOOP

END_FOR:
	li $v0, 4       # syscall 4 (print_str)
	la $a0, msg3    # argument: string
	syscall         # print the string

	li $v0, 1       # syscall 1 (print_int)
	move $a0, $t3   # argument: integer
	syscall         # print the integer

	li $v0, 10 		# terminate program
	syscall


