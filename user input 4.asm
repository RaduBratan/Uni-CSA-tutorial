.data
    prompt: .asciiz "Input your name: "
    message: .asciiz "\nHello, "
    punctuation: .asciiz "!"
    input: .space 24

.text
    main:
        #show prompt
        li $v0, 4
        la $a0, prompt
        syscall
    
        #get user input
        li $v0, 8
        la $a0, input
        li $a1, 24
        syscall
    
        #show message
        li $v0, 4
        la $a0, message
        syscall
    
        #show input
        li $v0, 4
        la $a0, input
        syscall
        
        #show punctuation
        li $v0, 4
        la $a0, punctuation
        syscall
        
        #end main
        li $v0, 10
        syscall
    