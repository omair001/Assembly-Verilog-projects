.text
main:
	sw 	$ra, 0($sp)		
	addi 	$sp, $sp, -4


	addi	$v0, $0, 5 		# v0 = readInt 
	syscall
	add	$t0, $0, $v0	# number of integers to expect
	addi	$t1, $0, 0	#loop counter

loop:	slt	$t2, $t1, $t0
	beq	$t2, $0, leaveloop
	
	addi	$v0, $0, 5 	# v0 = readInt 
	syscall
	add	$a0, $0, $v0	# integer we get

	slti	$t3, $t1, 1	#checks if coutner less than one
	beq	$t3, $0, skip	# if it's 1 or greater skip 
	addi	$a1, $0, 0	# if last element or only one next is 0

skip:
	jal	newc
	add	$a1, $0, $a0	
	add	$s0, $0, $a1 
	addi	$t1, $t1, 1
j loop
leaveloop:	
	add	$a0, $0, $s0
	jal sumint

	addi	$sp, $sp, 4
	lw	$ra, 0($sp)

jr $ra



newc:
	add	$t5, $0, $a0 # t0 = integer
 	add	$t6, $0, $a1 # t1 = address
 	# store the attributes somewhere in memory
 	# and return a reference to where they are
	addi	$v0, $0, 9
	addi	$a0, $0, 8
	syscall
	sw	$t5, 0($v0)
	sw	$t6, 4($v0)
	add	$a0, $0, $v0

	jr	$ra
	

sumint:
	addi	$t1, $0, 0
	addi	$t5, $0, 0
newloop:
	slt	$t2, $t1, $t0
	beq	$t2, $0, leaveNL
	lw	$t2, 0($a0)
	lw	$t3, 4($a0)
	add	$t5, $t5, $t2
	add	$a0, $0, $t3
	addi	$t1, $t1, 1
	j	newloop
leaveNL:
	addi	$v0, $0, 1
	add	$a0, $0, $t5
	syscall
	
	jr $ra