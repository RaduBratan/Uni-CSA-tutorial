.data
    #a: .word 0:10 #make an array with 10 numbers and initialise every one of them with 0
    a: .word 1 2 3 4 5 6 7 8 9 10 #make an array with 10 numbers and declare their values
    nl: .asciiz "\n"

.text
    main:
        #create index
        addi $t0, $zero, 0
        
        while:
            beq $t0, 40, exit #if(t0 aka "the index" > 40 bytes aka 10 numbers) => stop loop
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