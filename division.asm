.data
    n1: .word 30
    n2: .word 5

.text
    #addi $t0, $zero, 30
    #addi $t1, $zero, 5
    
    lw $t0, n1
    lw $t1, n2
    
    div $a0, $t0, $t1
    
    li $v0, 1
    syscall