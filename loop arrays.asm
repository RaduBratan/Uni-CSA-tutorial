.data
    a: .space 12 #3 elements * 4 bytes per element (numbers have 4 bytes, letters have 1 byte)
    nl: .asciiz "\n"

.text
    main:
        #create array numbers
        addi $s0, $zero, 4
        addi $s1, $zero, 10
        addi $s2, $zero, 12
    
        #create index to store values in array
        addi $t0, $zero, 0
    
        sw $s0, a($t0) #load number 1 in array
            addi $t0, $t0, 4 #update index with 4 bytes
        sw $s1, a($t0) #load number 2 in array
            addi $t0, $t0, 4 #update index with 4 bytes
        sw $s2, a($t0) #load number 3 in array
        
        #clear the index to reuse it for looping
        addi $t0, $zero, 0
        
        while:
            beq $t0, 12, exit #if(t0 aka "the index" > 12 bytes aka 3 numbers) => stop loop
            lw $t6, a($t0) #load number in t6
            addi $t0, $t0, 4 #update the index with 4 bytes
            
            #print number (take it from t6 and put it in a0)
            li $v0, 1
            addi $a0, $t6, 0
            syscall
            
            #print new line
            li $v0, 4
            la $a0, nl
            syscall
            
            j while #keep looping
        
        exit:
            li $v0, 10
            syscall
    
        #end main
        li $v0, 10
        syscall