!Author: Bhishan Poudel
!cmd   : clear; gfortran mainProgram.f90 && ./a.out


include 'mysubroutineA.f90'
include 'mysubroutineB.f90'

Program main 

    Implicit none
    !real             :: input   ! this doesnot work : we must have real(8) or real(kind=8) or double precision
    double precision :: input
    double precision :: square
    double precision :: cube
    integer,parameter:: kwrite=6
    
    input = 10.
    
    call mysubroutineA(input,square) ! now, square = 10*10
    call mysubroutineB(input,cube)   ! now, cube   = 10*10*10
    
    write(kwrite,10000) 'input', 'square', 'cube'
    write(kwrite,20000) input,square,cube
    10000 format (3A8)   ! 8 characters right aligned
    20000 format (3F8.1) ! float with width 8 and 1 number after decimal
End program main

