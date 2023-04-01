.data
    prt: .asciiz "Enter a number: "
    msg: .ascii "The factorial is "
    n: .word 0
    f: .word 0

.text
    .globl main
    main:
        #show prompt
        li $v0, 4
        la $a0, prt
        syscall
        
        #input number
        li $v0, 5
        syscall
        
        sw $v0, n #store number in n variable
        
        #calculate result
        lw $a0, n #get number from n variable
        jal fact #call fact function
        sw $v0, f #store result in f variable
        
        #show message
        li $v0, 4
        la $a0, msg
        syscall
        
        #show result
        li $v0, 1
        lw $a0, f #get result from f variable
        syscall
        
        #end main
        li $v0, 10
        syscall
    
    .globl fact
    fact:
        #load stack
        subu $sp, $sp, 8 #create the stack and allocate 3 spaces
        sw $ra, 0($sp) #store result (returning address) in stack
        sw $s0, 4($sp) #store number in stack
        
        #declare base case
        li $v0, 1
        beq $a0, 0, exit #call exit function to return current result and end the process if the number becomes 0
        
        #declare recursion case
        move $s0, $a0 #move the number to a0
        sub $a0, $a0, 1 #substract 1 from the number
        jal fact #call fact function to do these steps again until it reaches the base case
        
        mul $v0, $s0, $v0 #multiply current result with original number to create the final result
        #alternative: multiply current result with past result until you eventually reach the final result
        
        exit:
            #unload stack
            lw $ra, 0($sp) #load result(returning address) from stack
            lw $s0, 4($sp) #load number from stack
            addu $sp, $sp, 8 #destroy the stack and restore 3 spaces
            
            jr $ra #return current result