.data
    message1: .asciiz "Number 1 is smaller than number 2."
    message2: .asciiz "Number 1 is greater than number 2."

.text
    main:
        #initiate the numbers
        addi $t0, $zero, 30
        addi $t1, $zero, 200
        
        #test if t0 less than t1 and show message if true
        slt $s0, $t0, $t1 #if(t0<t1) => s0=1; else => s0=0
        bne $s0, $zero, nbSmaller #if(s0!=0) => show message1
        
        #test if t0 greater than t1 and show message if true
        sgt $s0, $t0, $t1 #if(t0<t1) => s0=1; else => s0=0
        bne $s0, $zero, nbGreater #if(s0!=0) => show message2
        
        #end main
        li $v0, 10
        syscall
    
    nbSmaller:
        li $v0, 4
        la $a0, message1
        syscall
        
        li $v0, 10
        syscall
        
    nbGreater:
        li $v0, 4
        la $a0, message2
        syscall
        
        li $v0, 10
        syscall
    
