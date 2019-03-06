!BButhor: Bhishan Poudel
!cmd   : clear; gfortran module3.f90 && ./a.out


! modules must be compiled before using them

!************** Module A *********

module module_A
    Implicit none
    Contains
        double precision function function_A(i)
            implicit none
            integer,intent(in) :: i
            function_A = 5.d0*i       ! eg. function_A(5) = 25.00
            end function function_A   ! function return a number or may return an array ptr

end module module_A


!********* Module B ***********

module module_B
    use module_A
    implicit none
    contains

        subroutine subroutine_B(i,j)
            implicit none
            integer, intent(in) :: i
            double precision, intent(out) :: j
            j = function_A(i) * 2
        end subroutine subroutine_B  ! subroutine return nothing

end module module_B


!******** Main Program ********

Program Test_program
    Use module_B
    Implicit none
    Integer :: i
    double precision :: j
    i = 10
    call subroutine_B(i,j)
    
    write(*,*) i             ! i = 10
    write(*,*) function_A(i) ! 5.0d * 10 = 50.00
    write(*,*) function_A(5) ! 5.d0 * 5 = 25.00
    print*, j                ! j = fnA * 2 = 50*2 = 100.00
    
    

End program Test_program

