.data
    mess1: .asciiz "It's true. The numbers are equal.\n"
    mess2: .asciiz "It's false. The numbers aren't equal.\n"
    n1: .float 1.4
    n2: .float 1.5

.text
    main:
        #load numbers
        lwc1 $f0, n1
        lwc1 $f1, n2
        
        c.eq.s $f0, $f1 #test if f0 = f1
        bc1t true #run function "true" if c.eq.s returns true
        bc1f false #run function "false" if c.eq.s returns false
        
        #end main
        li $v0, 10
        syscall
        
    true:
        li $v0, 4
        la $a0, mess1
        syscall
        
        li $v0, 10
        syscall
    
    false:
        li $v0, 4
        la $a0, mess2
        syscall
        
        li $v0, 10
        syscall