.text
main: 
	sw $ra, 0($sp)
	addi $sp, $sp, -4

	addi $a0, $0, 3
	addi $a1, $0, 8
	jal Fraction
	add $s0, $0, $v0 # s0 holds a

	addi $a0, $0, 1
	addi $a1, $0, 2
	jal Fraction
	add $s1, $0, $v0 # s0 holds a 

	add $a0, $0, $s0
	jal getNumerator 
	add $a2, $0, $v0 # s2 holds a 
	jal getDenominator
	add $a3, $0, $v0 # s2 holds a
	jal printFraction
	jal println
	
	add $a0, $0, $s1
	jal getNumerator 
	add $a2, $0, $v0 # s2 holds a 
	jal getDenominator
	add $a3, $0, $v0 # s2 holds a
	jal printFraction

	jal println
	add $a0, $0, $s0
	add $a1, $0, $s1
	jal adding
	
	add $a0, $0, $v0
	jal getNumerator
	add $a2, $0, $v0 # s2 holds a 
	jal getDenominator
	add $a3, $0, $v0 # s2 holds a
	jal printFraction


	addi $sp, $sp, 4
	lw $ra, 0($sp)			#retreive return address

	jr 	$ra