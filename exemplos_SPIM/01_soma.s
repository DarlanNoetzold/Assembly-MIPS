#Exemplo 01 - soma
# f = (g + h) - (i + j);
# f, …, j  em  $s0, …, $s4
        
		.globl main
main:   
		li $s1, 0x7
        li $s2, 0x4
		li $s3, 0x3
		li $s4, 0x2
			
		add $t0, $s1, $s2   # temp t0 = g + h
		add $t1, $s3, $s4  	# temp t1 = i + j
		sub $s0, $t0, $t1	# f = t0 - t1

		
		