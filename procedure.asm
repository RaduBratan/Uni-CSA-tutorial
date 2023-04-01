.data
    message: .asciiz "Hi everybody! \nMy name is Radu. \n"

.text
    main:
        jal displayMessage
        
        addi $a0, $zero, 5
        
        li $v0, 1
        syscall
    
    displayMessage:
        li $v0, 4
        la $a0, message
        syscall
        
        jr $ra
