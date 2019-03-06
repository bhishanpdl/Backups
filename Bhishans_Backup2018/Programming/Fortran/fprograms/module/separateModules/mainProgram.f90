!BButhor: Bhishan Poudel
!cmd   : clear; gfortran mainProgram.f90 && ./a.out


! modules must be compiled before using them

!************** Module A *********


!******** Main Program ********
include 'mysubroutineA.f90'
include 'mysubroutineB.f90'

!******** Main Program ********

Program Test_program

    Implicit none
    double precision :: i
    double precision :: j
    double precision :: k
    
    i = 10.
    
    call mysubroutineA(i,j)
    call mysubroutineB(i,k)
    
    write(*,*) i,j,k             ! i = 10
                  
    
    

End program Test_program

