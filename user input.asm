.data
    prompt: .asciiz "Enter your age: "
    message: .asciiz "\nYour age is: "

.text
    #show prompt message
    li $v0, 4
    la $a0, prompt
    syscall
    
    #get user input
    li $v0, 5
    syscall
    
    #store input in t0
    move $t0, $v0
    
    #display message
    li $v0, 4
    la $a0, message
    syscall
    
    #display input
    li $v0, 1
    move $a0, $t0
    syscall
    