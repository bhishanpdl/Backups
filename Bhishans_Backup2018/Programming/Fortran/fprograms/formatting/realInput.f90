!cmd: clear; gfortran realInput.f90 && ./a.out

program realInput

    integer :: a,b,c
    
    
    read(*,*) a,b,c
    !note: DO NOT use format in reading data,
    !it may cause error
   
    
    write(*,110) a,b,c
    !110 format (3i2)   ! if we type 1 2 3 it works
                       ! if we type 10 20 30 it shows all one number
                       ! if we type 100 200 300 it shows ********
                       
                       
                       
                      !4digit wide integers at column 5,10,15 
    110 format (T5,i4,T10,i4,T15,i4)                 
                       
                       
    
end program
