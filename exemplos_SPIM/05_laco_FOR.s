.data
	msg1: .asciiz"\n"

.text
.globl main
main:
	CONST=10		#define uma constante
	li $t1, 0 		# t1 é o contador (i)
	
FOR_LOOP:
	beq $t1, CONST, END_FOR  # if t1 == 10 sai
	li $v0, 1              # mostra valor de i
	move $a0, $t1   
	syscall         
	li $v0,4			# mostra a msg1
	la $a0,msg1
	syscall
	addi $t1, $t1, 1 	# i++
	j FOR_LOOP

END_FOR:



