!BButhor: Bhishan Poudel
!cmd   : clear; gfortran moduleB.f90 && ./a.out


! modules must be compiled before using them


!********* Module B ***********


        subroutine mysubroutineB(input,cube)
            implicit none
            double precision, intent(in)  :: input
            double precision, intent(out) :: cube
            cube = input * input * input
        end subroutine mysubroutineB  ! subroutine returns cube
