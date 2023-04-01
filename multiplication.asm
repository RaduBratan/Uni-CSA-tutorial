.data

.text
    li $t0, 10 #load immediate 10
    li $t1, 4 #load immediate 4
    mul $a0, $t0, $t1 #multiply s0 and s1 and store the result directly in a0
    
    #addi $s0, $zero, 10 #add immediate 10 + 0 and store it in s0 - alternative for loading it immediately
    #addi $s1, $zero, 4 #add immediate 4 + 0 and store it in s1 - alternative for loading it immediately
    #mul $t0, $s0, $s1 #multiply s0 and s1 and store the result in t0 - alternative for storing it directly in a0
    
    li $v0, 1
    #add $a0, $zero, $t0 #add t0 and zero and store the result in a0 - use only when storing mul result elswhere than a0
    #move $a0, $t0 #move t0 directly into a0 - use only when storing mul result elswhere than a0
    syscall
    
    li $v0, 10
    li $a0, 0
    syscall