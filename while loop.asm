.data
    message: .asciiz "end"
    space: .asciiz " "

.text
    main:
        #init number
        addi $t0, $zero, 0
    
        whileLoop:
            bgt $t0, 10, exitLoop #if(t0>10) => stop loop
            jal print
            addi $t0, $t0, 1 #t0 = t0 + 1
            j whileLoop #keep looping
    
        exitLoop:
            li $v0, 4
            la $a0, message
            syscall
        
        #end main
        li $v0, 10
        syscall
    
    print:
        li $v0, 1
        add $a0, $t0, $zero
        syscall
        
        li $v0, 4
        la $a0, space
        syscall
        
        jr $ra
            