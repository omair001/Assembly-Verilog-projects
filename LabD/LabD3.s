.globl Fraction
.globl getNumerator
.globl getDenominator
.globl adding
 .text
Fraction:
 	#---------------------------------------------
 	add $t0, $0, $a0 # t0 = numerator
 	add $t1, $0, $a1 # t1 = denominator
 	# store the attributes somewhere in memory
 	# and return a reference to where they are
	addi $v0, $0, 9
	addi $a0, $0, 8
	syscall
	sw $t0, 0($v0)
	sw $t1, 4($v0)

	jr $ra

getNumerator:
	#---------------------------------------------

	# retrieve the numerator of this
	# fraction and return it in $v0.
 	lw $v0, 0($a0)
	
jr $ra 

getDenominator:
	#---------------------------------------------

	# retrieve the numerator of this
	# fraction and return it in $v0.
 	lw $v0, 4($a0)
	
jr $ra

adding:
 #---------------------------------------------

# Given a fraction address in $a0,
# and a second fraction address in $a1,
# mutate the fraction at $a0 so it becomes
# the sum of the two fractions
	lw $t0, 0($a0)
	lw $t1, 4($a0)
	lw $t2, 0($a1)
	lw $t3, 4($a1)

	mult	$t0, $t3
	mflo 	$t4 
	mult	$t2, $t1
	mflo 	$t5 	
	mult	$t3, $t1
	mflo 	$t6
 
	add	$t0, $t4, $t5
	
	addi $v0, $0, 9
	addi $a0, $0, 8
	syscall
	sw $t0, 0($v0)
	sw $t6, 4($v0)
	add $a0, $0, $v0


 jr $ra 