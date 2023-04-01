.data

.text
    addi $t0, $zero, 2000 #add 0 + 2000 and store the result in t0
    addi $t1, $zero, 10 #same thing here, but the result is stored in t1
    
    mult $t0, $t1 #multiply t0 * t1 and store the result in hi and lo
    
    mflo $a0 #move the result from lo to a0
    
    li $v0, 1
    syscall