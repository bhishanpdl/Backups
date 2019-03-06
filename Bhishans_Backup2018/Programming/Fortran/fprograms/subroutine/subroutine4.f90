!Author: Bhishan Poudel
!Program: subroutines
!cmd    : clear; gfortran subroutine4.f90 && ./a.out

!ref    : https://en.wikibooks.org/wiki/Fortran/Fortran_procedures_and_functions


!****** subroutine ***********************
subroutine square_cube(i,isquare,icube)
  integer, intent(in)  :: i             ! input
  integer, intent(out) :: isquare,icube ! output
  isquare = i**2
  icube   = i**3
end subroutine square_cube


!********** Main Program ******************
program xx
  implicit none
  integer :: i,isq,icub
  i = 4
  call square_cube(i,isq,icub)
  print*,"i,i^2,i^3=",i,isq,icub
end program xx


!	A subroutine can be used to return several values through 
!	its arguments. It is invoked with a call statement.
