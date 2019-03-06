!Topic: character input  - the descriptor A
!cmd: clear; gfortran slashDescriptor.f90 && ./a.out


program slash_descriptor

   real :: a,b,c,d
   
   read(*,300) a,b,c,d
   300 format (2f10.2,//,2f10.2)
   
   !input is
!   1.0 2.0 3.0
!   4.0 5.0 6.0
!   7.0 8.0 9.0

    print*, 'a = ', a
    print*, 'b = ', b
    print*, 'c = ', c
    print*, 'd = ', d
    
   

end program
