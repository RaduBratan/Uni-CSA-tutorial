.data
    message1: .asciiz "no1 < no2"
    message2: .asciiz "no1 > no2"

.text
    main:
        #load numbers
        addi $s0, $zero, 1
        addi $s1, $zero, 10
        
        #compare numbers and show message - warning! those are pseudoinstructions!
        blt $s0, $s1, msgLT
        bgt $s0, $s1, msgGT
        
        #end main
        li $v0, 10
        syscall
    
    msgLT:
        li $v0, 4
        la $a0, message1
        syscall
        
        li $v0, 10
        syscall
        
    msgGT:
        li $v0, 4
        la $a0, message2
        syscall
        
        li $v0, 10
        syscall