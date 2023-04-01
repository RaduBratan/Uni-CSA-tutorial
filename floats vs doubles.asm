.data
    n1: .float 3.14
    n2: .float 2.71
    n3: .double 3.14
    n4: .double 2.71

.text
    main:
        #load floats in coproc1
        lwc1 $f2, n1
        lwc1 $f4, n2
        
        #load doubles in coproc1
        ldc1 $f6, n3
        ldc1 $f8, n4
        
        add.s $f12, $f2, $f4 #add the floats
        add.d $f14, $f6, $f8 #add the doubles
        mul.s $f16, $f2, $f4 #multiply the floats
        mul.d $f18, $f6, $f8 #multiply the doubles
        
        #notice how doubles, unlike floats, require the use of two f values. for example, if I put n3 in f6, n3 will be stored in both f6 and f7
        
        #end main
        li $v0, 10
        syscall
