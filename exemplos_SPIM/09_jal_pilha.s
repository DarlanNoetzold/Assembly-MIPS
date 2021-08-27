# Exemplo 09 - chamada de procedimento com pilha
# Chamada de procedimento
# antes da chamada, salva o estado dos registradores na pilha
# valores dos registradores sao alterados no procedimento
# ao retornar para o programa, os valores anteriores sao restaurados
		.globl main
main:   
	li $s1, 0x123
    li $t1, 0x456

	jal PROCEDIMENTO

	li $v0, 1       # syscall 1 (print_int)
	move $a0, $s1   # argument: integer
	syscall         # print the integer
	
	li $v0, 1       # syscall 1 (print_int)
	move $a0, $t1   # argument: integer
	syscall         # print the integer
	
	
	li $v0, 10 		# FIM DO PROGRAMA
	syscall

		
PROCEDIMENTO:
	# salva o estado anterior na pilha
	addi $sp, $sp, -8
	sw   $s1, 4($sp)
	sw   $t1, 0($sp)
		
	li $s1, 0
	li $t1, 0
	
	# restaura o estado anterior para retornar ao programa
	lw  $t1, 0($sp)
	lw 	$s1, 4($sp)
	
jr $ra			# retorno do procedimento
		
		