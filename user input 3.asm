.data
    prompt: .asciiz "Input your double: "
    message: .asciiz "\nYour double is: "
    zeroDouble: .double 0.0
    
.text
    #put zeroDouble in f2
    lwc1 $f2, zeroDouble
    
    #display prompt
    li $v0, 4
    la $a0, prompt
    syscall
    
    #get user input
    li $v0, 7
    syscall
    
    #display message
    li $v0, 4
    la $a0, message
    syscall
    
    #display input
    li $v0, 3
    add.d $f12, $f0, $f2
    syscall
