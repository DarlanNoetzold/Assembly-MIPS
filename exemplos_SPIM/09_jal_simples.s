# Exemplo 09 - chamada de procedimento com pilha
# Chamada de procedimento
# sem salvar o estado dos registradores na pilha
# valores dos registradores sao alterados no procedimento
# ao retornar para o programa, os valores anteriores foram perdidos
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
	li $s1, 0
	li $t1, 0
jr $ra			# retorno do procedimento
		
		