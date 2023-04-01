.data
    number1: .word 255
    number2: .word 8

.text
    lw $s0, number1 #s0 = number1 = 20
    lw $s1, number2 #s1 = number2 = 8
    
    sub $a0, $s0, $s1 #t0 = s0 - s1 = 20 - 8
    
    li $v0, 1
    syscall
    