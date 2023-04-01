.data

.text
    addi $t0, $zero, 31 #alternative to lw
    addi $t1, $zero, 6 #alternative to lw
    
    div $t0, $t1 #divide t0 / t1 then store the "cat" in lo and the "rest" in hi
    
    mflo $a0 #move "catul" from lo to a0
    #mfhi $a0 #move "restul" from hi to a0
    
    li $v0, 1
    syscall