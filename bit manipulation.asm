.data
    nl: .asciiz "\n"

.text
    main:
        #show number
        li $a1, 11 #load number
        jal showNum #call function for showing a number
        
        #take number and clear the first bit
        li $a1, 11 #load number again
        jal clearBit0 #call function for clearing a bit
        
        #show new number
        move $a1, $v0 #move the new number in a1 so the function can show it
        jal showNum #call function for showing a number
        
        #end main
        li $v0, 10
        syscall
    
    showNum:
        #show new line
        li $v0, 4
        la $a0, nl
        syscall
        
        #show number
        li $v0, 1
        move $a0, $a1 #move the number from a1 to a0 so the function can work with it
        syscall
        
        jr $ra #return result
    
    clearBit0:
        #load stack
        addi $sp, $sp, -4 #create the stack and allocate 2 spaces
        sw $s0, 0($sp) #store number in stack
        
        #make mask
        li $s0, -1 #load value -1 (example: 111111111111111)
        sll $s0, $s0, 1 #shift number to the left by 1 (example: 111111111111110)
        and $v0, $a1, $s0
        
        #make mask - alternative:
        #li $s0, -2 #load value -2
        #no more sll!!!
        
        #unload stack
        lw $s0, 0($sp) #load number from stack
        addi $sp, $sp, 4 #destroy the stack and restore 2 spaces
        
        jr $ra #return result