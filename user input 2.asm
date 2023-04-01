.data
    prompt: .asciiz "Input value of pi: "
    message: .asciiz "\nValue of pi is: "
    zeroFloat: .float 0.0

.text
    #put zeroFloat in f4
    lwc1 $f4, zeroFloat
    
    #show prompt
    li $v0, 4
    la $a0, prompt
    syscall
    
    #get user input
    li $v0, 6
    syscall
    
    #show message
    li $v0, 4
    la $a0, message
    syscall
    
    #show user input
    li $v0, 2
    add.s $f12, $f0, $f4
    syscall