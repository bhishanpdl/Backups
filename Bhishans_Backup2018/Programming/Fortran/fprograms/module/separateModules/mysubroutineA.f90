!BButhor: Bhishan Poudel
!cmd   : clear; gfortran moduleA.f90 && ./a.out


! modules must be compiled before using them

!************** Module A *********


      subroutine mysubroutineA(i,j)
            implicit none
            double precision,intent(in) :: i
            double precision,intent(out) :: j
            j = 5.d0*i       ! eg. function_A(5) = 25.00
      end subroutine mysubroutineA   ! function return a number or may return an array ptr
