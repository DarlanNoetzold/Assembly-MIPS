.data
	msg1: .asciiz"\n"

.text
.globl main
main:
	CONST=-1		#define uma constante
	li $t1, 10 		# t1 é o contador (i)
	
FOR_LOOP:
	beq $t1, CONST, END_FOR 
	li $v0, 1              # mostra valor de i
	move $a0, $t1   
	syscall         
	li $v0,4			# mostra a msg1
	la $a0,msg1
	syscall
	sub $t1, $t1, 1 	# i++
	j FOR_LOOP

END_FOR:



