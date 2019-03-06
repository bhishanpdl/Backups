!Author: Bhishan Poudel
!Program: functions
!cmd    : clear; gfortran fn1.f90 && ./a.out


function func(i) result(j)
    integer, intent(in) :: i ! input
    integer             :: j ! output
    j = i**2 + i**3
 end function func
   
 program xfunc
    implicit none
    integer :: i
    integer :: func
    i = 3
    print*,"sum of the square and cube of",i," is",func(i)
 end program xfunc
 
 
!   In Fortran, one can use a function to return a value or an array of values.
!    In Fortran, a clear difference exists between function and subroutine: 
!    functions return one value, subroutines return no value.

!    In general, the recommendation by several experts is to use 
!    functions only if they're pure, otherwise use subroutines. 
!    And, that is advice that I follow myself as well.
