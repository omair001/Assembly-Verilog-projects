.globl printFraction
.globl println
.text

printFraction:
	add $a0, $0, $a2 
       	addi $v0, $0, 1 
        syscall
		
	li $a0, '/'
	li $v0, 11    # print_character
	syscall

	add $a0, $0, $a3 
       	addi $v0, $0, 1 
        syscall



jr $ra


println:
	addi $a0, $0, 10 
       	addi $v0, $0, 11 
        syscall				#adds new line

jr $ra 