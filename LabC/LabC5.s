.globl MAX
.globl SIZE
#-----------------------------
.data
MAX: .word 2147483647;
SIZE: .byte 32;

#-----------------------------
.globl getCount
.globl setCount
#-----------------------------
.text
getCount: #-----------------------------
lw $v0, count($0)
jr $ra

setCount: #-------------------------------------
	addi	$v0, $0, 5 		# v0 = readInt 
	syscall
	add	$a0, $0, $v0 		# v0 value in t7
.data
	count: .word a0;
.text
jr $ra