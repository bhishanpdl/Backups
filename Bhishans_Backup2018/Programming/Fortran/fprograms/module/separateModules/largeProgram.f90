!BButhor: Bhishan Poudel
!cmd   : clear; gfortran largeProgram.f90 && ./a.out


! modules must be compiled before using them

!************** Module A *********


      subroutine mysubroutineA(i,j)
            implicit none
            double precision,intent(in) :: i
            double precision,intent(out) :: j
            j = 5.d0*i       ! eg. function_A(5) = 25.00
      end subroutine mysubroutineA   ! function return a number or may return an array ptr



!********* Module B ***********


        subroutine mysubroutineB(i,j)
            implicit none
            double precision, intent(in) :: i
            double precision, intent(out) :: j
            j = 0.5d0 * i
        end subroutine mysubroutineB  ! subroutine return nothing



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

