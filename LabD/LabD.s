#-------------------------------------
# Name: Syed Omair Anwar
# Student Number: 214729131
# course: computer Organization
# Lab: LabD
#-------------------------------------

.text
main:
	sw 	$ra, 0($sp)		
	addi 	$sp, $sp, -4		# save stack pointer
	addi	$v0, $0, 5 		# v0 = readInt 
	syscall
	add	$t0, $0, $v0		# number of integers to expect
	addi	$t1, $0, 0		# loop counter

loop:	slt	$t2, $t1, $t0
	beq	$t2, $0, leaveloop	# checks if the right number of integers are collected
	addi	$v0, $0, 5 		# v0 = readInt 
	syscall
	add	$a0, $0, $v0		# integer we get
	slti	$t3, $t1, 1		# checks if coutner less than one
	beq	$t3, $0, skip		# if it's 1 or greater skip 
	addi	$a1, $0, 0		# if last element or only one next is 0
skip:
	jal	newc			# creates a node for the list
	add	$a1, $0, $a0		# changes the address for next entry
	add	$s0, $0, $a1 		# update the start of the list
	addi	$t1, $t1, 1		# increase loop counter
j loop
					
leaveloop:	
	add	$a0, $0, $s0		# add address of list in parameter
	jal 	sumint			# adds the list together

	addi	$sp, $sp, 4
	lw	$ra, 0($sp)		# retrieves pointer

	jr	$ra


#------------------------------------------------------------------------------------
newc:
	add	$t5, $0, $a0 		# t5 = integer
 	add	$t6, $0, $a1 		# t6 = address
	addi	$v0, $0, 9		# allocate memory for node
	addi	$a0, $0, 8
	syscall
	sw	$t5, 0($v0)		# save values for value and address 
	sw	$t6, 4($v0)
	add	$a0, $0, $v0		# address of current node

	jr	$ra
	
#------------------------------------------------------------------------------------
sumint:
	addi	$t1, $0, 0		# loop counter
	addi	$t5, $0, 0		# calculated value
newloop:
	slt	$t2, $t1, $t0		# checks if we need to continue with loop or not
	beq	$t2, $0, leaveNL	
	lw	$t2, 0($a0)		# get value at node
	lw	$t3, 4($a0)		# get address of next node
	add	$t5, $t5, $t2		# add value to sum
	add	$a0, $0, $t3		# update the address of node
	addi	$t1, $t1, 1		# increment counter
	j	newloop	
leaveNL:
	addi	$v0, $0, 1		
	add	$a0, $0, $t5
	syscall				# print calculated value
	jr	$ra