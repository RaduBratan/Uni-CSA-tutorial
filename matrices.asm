.data
    x: .word 2, 5, 8
       .word 3, 7, 10
       .word 1, 4, 11
    s: .word 3
    .eqv dataSize 4

.text
    main:
        la $a0, x #load matrix address in a0
        lw $a1, s #load size address in a1 (aka number of columns)
        
        jal sumMainDiag #call sumDiag function and store result in v0
        move $a0, $v0 #move rsult from v0 to a0 so you can show it on the screen
        
        #show sum on the screen
        li $v0, 1
        syscall
        
        #end main
        li $v0, 10
        syscall
    
    sumMainDiag:
        li $v0, 0 #return the sum in v0
        li $t0, 0 #load row index in t0
        
        loopSum:
            mul $t1, $t0, $a1      #t1 = (row index * number of columns
            add $t1, $t1, $t0      #t1 = (............................. + column index)
            mul $t1, $t1, dataSize #t1 = (............................................) * data size
            add $t1, $t1, $a0      #t1 = (............................................)............ + base address
            #!!!! when the matrix is squared, row index = column index
            #!!!! the data size is 4 because we are dealing with numbers = 4 bytes
            #!!!! the base address is the address of the matrix; t1 has the location in RAM for every matrix element (aka x[0][0], x[1][1], etc.)
            
            lw $t2, ($t1) #take position of matrix element and put it in t2
            add $v0, $v0, $t2 #sum = sum + x[i][i]
            addi $t0, $t0, 1 #i = i + 1
            blt $t0, $a1, loopSum #keep looping if i < max matrix size
        
        jr $ra
        
        li $v0, 10
        syscall