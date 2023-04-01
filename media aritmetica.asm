.data
    a: .word 10, 2, 9
    l: .word 3
    s: .word 0
    ma: .word 0

.text
    main:
        la $t0, a #load array
        li $t1, 0 #load array index (initially is 0)
        lw $t2, l #load array max length
        li $t3, 0 #load sum
        
        loopSum:
            lw $t4, ($t0) #load one element in array
            add $t3, $t3, $t4 #add element to sum (sum=sum+a[i])
            add $t1, $t1, 1 #increment index (i=i+1)
            add $t0, $t0, 4 #add 4 bytes to the array to make space for the next element to be loaded
            blt $t1, $t2, loopSum #keep looping if i<max length (basically, this is the "while()" segement of the loop)
        
        sw $t3, s #store the new sum in t3
        div $t5, $t3, $t2 #calculate the medie aritmetica and load it
        sw $t5, ma #store the new medie aritmetica in t5
        
        #display medie
        li $v0, 1
        move $a0, $t5
        syscall
        
        #end main
        li $v0, 10
        syscall
