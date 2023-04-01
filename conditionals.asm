.data
    prompt1: .asciiz "Input first number: "
    prompt2: .asciiz "Input second number: "
    message1: .asciiz "The numbers are equal."
    message2: .asciiz "The numbers are different."
    message3: .asciiz "Nothing happened."
    zeroDouble: .double 0.0
    input1: .space 9
    input2: .space 9

.text
    main:
        #load zero double
        lwc1 $f2, zeroDouble
        
        #show prompt1
        li $v0, 4
        la $a0, prompt1
        syscall
        
        #get user input 1
        li $v0, 7
        syscall
        
        #show prompt2
        li $v0, 4
        la $a0, prompt2
        syscall
        
        #get user input 2
        li $v0, 7
        syscall
        
        #load numbers
        addi $t0, $zero, 5
        addi $t1, $zero, 20
        
        #test if equal and run function
        beq $t0, $t1, nbEqual
        
        #test if different and run function
        bne $t0, $t1, nbDiff
        
        #show default message
        b message3
        
        #end main
        li $v0, 10
        syscall
    
    nbEqual:
        li $v0, 4
        la $a0, message1
        syscall
        
        li $v0, 10
        syscall
    
    nbDiff:
        li $v0, 4
        la $a0, message2
        syscall
        
        li $v0, 10
        syscall