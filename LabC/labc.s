#-------------------------------------
# Name: Syed Omair Anwar
# Student Number: 214729131
# course: computer Organization
# Lab: Labc
#-------------------------------------

.globl fini 
#-----------------------
.text
main: 	sw $ra, 0($sp)
	addi $sp, $sp, -8		#save return address
	
	addi	$v0, $0, 5 		# v0 = readInt 
	syscall
	add	$a0, $0, $v0 		# v0 value in t7
	addi	$v0, $0, 5 		# v0 = readInt 
	syscall
	add	$a1, $0, $v0 		# v0 value in t7
	addi	$v0, $0, 5 		# v0 = readInt 
	syscall
	add	$a2, $0, $v0 		# v0 value in t7
	
	jal 	printmax		#start printmax procedure and return when done

	addi $sp, $sp, 8
	lw $ra, 0($sp)			#retreive return address

fini:	jr 	$ra