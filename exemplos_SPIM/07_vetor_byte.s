	.data
	# declaraçao de um vetor  de int de 3 posiçoes
	vet: .word 3,5,0	
.text
.globl main
main: 
	
	la $t0,vet		# carrega o ponteiro do vetor
	lw $t1, 0($t0)	# carrega o primeiro elemento
	lw $t2, 4($t0)	# carrega o segundo elemento
	add $t3, $t2, $t1
	sw $t3, 8($t0)	# guarda o resultado na 3ª pos

	lw $a0, 8($t0)	# carrega do vetor para $A0
	li $v0, 1		# configura a syscal (print int)
	syscall
	
	
	
	
	