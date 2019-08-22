#-------------------------------------
# Name: Syed Omair Anwar
# Student Number: 214729131
# course: computer Organization
# Lab: Labc
#-------------------------------------

.globl	printmax
.globl	lnprint

.text
#-------------------------
printmax: 

	sw 	$ra, 0($sp)		
	addi 	$sp, $sp, -4		

	addi	$t1, $0, 0		# set t1 to 0 
	add	$t2, $0, $a0		# initialize loop value to 0
	add	$t3, $0, $a1		# set t1 to 0 
	add	$t4, $0, $a2		# initialize loop value to 0

	slt	$t6, $t1, $t2 		# checks if t1 is smaller than current smallest
	beq	$t6, $0, skip1		# if larger, skips editing of t1	
	add	$t1, $0, $t2
skip1:
	slt	$t6, $t1, $t3 		# checks if t1 is smaller than current smallest
	beq	$t6, $0, skip2		# if larger, skips editing of t1
	add	$t1, $0, $t3
skip2:
	slt	$t6, $t1, $t4 		# checks if recieved is smaller than current smallest
	beq	$t6, $0, skip3		# if larger, skips editing of t1
	add	$t1, $0, $t4
skip3:
	add	$a3, $0, $t1
	jal	lnprint			#starts print procedure and returns when done
	
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	jr $ra				#gets the return address and returns
#--------------------------
lnprint:
	addi $a0, $0, 10 
       	addi $v0, $0, 11 
        syscall				#adds new line

	add $a0, $0, $a3 
       	addi $v0, $0, 1 
        syscall				#prints the largest value
	jr $ra
	
