.data
    a: .space 12

.text
    main:
        #create array numbers
        addi $s0, $zero, 4
        addi $s1, $zero, 10
        addi $s2, $zero, 12
    
        #create index
        addi $t0, $zero, 0
    
        sw $s0, a($t0) #load number 1 in array
            addi $t0, $t0, 4 #update index
        sw $s1, a($t0) #load number 2 in array
            addi $t0, $t0, 4 #update index
        sw $s2, a($t0) #load number 3 in array
        
        #display first array value
        lw $t6, a($zero)
        li $v0, 1
        addi $a0, $t6, 0
        syscall
    
        #end main
        li $v0, 10
        syscall
    
    
    