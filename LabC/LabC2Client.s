.text
main: lw $a0, MAX($0)
addi $v0, $0, 1
syscall

lbu $a0, SIZE($0)
sub $t1, $a0, 256
add  $a0, $0, $t1
addi $v0, $0, 1
syscall
jr $ra