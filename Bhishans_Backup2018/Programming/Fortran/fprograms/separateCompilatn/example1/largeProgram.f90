!BButhor: Bhishan Poudel
!cmd    : clear; gfortran largeProgram.f90 && ./a.out


! modules must be compiled before using them

!************** Module A ******************************************************


      subroutine mysubroutineA(input,square)
            implicit none
            double precision,intent(in)  :: input
            double precision,intent(out) :: square
            square = input * input 
      end subroutine mysubroutineA



!********* Module B ************************************************************


        subroutine mysubroutineB(input,cube)
            implicit none
            double precision, intent(in)  :: input
            double precision, intent(out) :: cube
            cube = input * input * input
        end subroutine mysubroutineB 



!******** Main Program *********************************************************

Program Test_program

    Implicit none
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

End program Test_program

