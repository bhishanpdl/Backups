!BButhor: Bhishan Poudel
!cmd   : clear; gfortran moduleB.f90 && ./a.out


! modules must be compiled before using them


!********* Module B ***********


        subroutine mysubroutineB(i,j)
            implicit none
            double precision, intent(in) :: i
            double precision, intent(out) :: j
            j = 0.5d0 * i
        end subroutine mysubroutineB  ! subroutine return nothing
