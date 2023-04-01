.data

.text
    addi $s0, $zero, 4
    
    sll $a0, $s0, 5
    
    li $v0, 1
    syscall