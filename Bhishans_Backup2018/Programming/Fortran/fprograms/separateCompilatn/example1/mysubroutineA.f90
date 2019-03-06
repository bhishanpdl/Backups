!BButhor: Bhishan Poudel
!cmd   : clear; gfortran moduleA.f90 && ./a.out


! modules must be compiled before using them

!************** Module A *********


      subroutine mysubroutineA(input,square)
            implicit none
            double precision,intent(in)  :: input
            double precision,intent(out) :: square
            square = input*input   
      end subroutine mysubroutineA   ! function return a number or may return an array ptr
