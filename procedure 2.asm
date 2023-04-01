.data

.text
    main:
        addi $a1, $zero, 50
        addi $a2, $zero, 100
        
        jal addNumbers
        
        li $v0, 10
        syscall
    
    addNumbers:
        add $v1, $a1, $a2 #I can skip v1 and just use "add $a0, $a1, $a2"
        
        li $v0, 1
        addi $a0, $v1, 0 #I don't need this if I use "add $a0, $a1, $a2"
        syscall
        
        jr $ra