!Author: Bhishan Poudel
!topic : Fortran - Location Functions
!cmd   : clear; gfortran arrayLocation.f90 && ./a.out

program arrayLocation
implicit none

   real, dimension(1:6) :: a = (/ 21.0, 12.0, 33.0, 24.0, 15.0, 16.0 /)
   ! locations                    1     2     3     4     5     6
   Print *, maxloc(a) ! 3
   Print *, minloc(a) ! 2
   
end program arrayLocation   


! The following table describes the location functions:
! Function 	Description
! maxloc(array, mask) 	It returns the position of the greatest element in the 
!                        array array, if mask is included only for those which 
!                        fulfil the conditions in mask, position is returned 
!                        and the result is an integer vector.
! minloc(array, mask) 	It returns the position of the smallest element in the 
!                        array array, if mask is included only for those which 
!                        fulfil the conditions in mask, position is returned and
!                        the result is an integer vector.
