!Author: Bhishan Poudel
!topic : Fortran - Manipulation Functions
!cmd   : clear; gfortran arrayShift.f90 && ./a.out

program arrayShift
implicit none

   real, dimension(1:6) :: a = (/ 21.0, 22.0, 23.0, 24.0, 25.0, 26.0 /)
   real, dimension(1:6) :: x, y
   write(*,10) a
   
   x = cshift ( a, shift = 2)
   write(*,10) x
   
   y = cshift (a, shift = -2)
   write(*,10) y
   
   x = eoshift ( a, shift = 2)
   write(*,10) x
   
   y = eoshift ( a, shift = -2)
   write(*,10) y
   
   10 format(1x,6f6.1)

end program arrayShift


! Manipulation functions are shift functions. The shift functions return the 
! shape of an array unchanged, but move the elements.
! Function 	Description
! cshift(array, shift, dim) 	            It performs circular shift by shift 
!                                        positions to the left, if shift is 
!                                        positive and to the right if it is negative. 
!                                        If array is a vector the shift is being 
!                                        done in a natural way, if it is an array 
!                                        of a higher rank then the shift is in 
!                                        all sections along the dimension dim. 
!                                        If dim is missing it is considered to 
!                                        be 1, in other cases it has to be a scalar 
!                                        integer number between 1 and n 
!                                        (where n equals the rank of array ). 
!                                        The argument shift is a scalar integer 
!                                        or an integer array of rank n-1 and the 
!                                        same shape as the array, except along the 
!                                        dimension dim (which is removed because 
!                                        of the lower rank). Different sections 
!                                        can therefore be shifted in various 
!                                        directions and with various numbers of positions.
! eoshift(array, shift, boundary, dim) 	It is end-off shift. It performs shift 
!                                        to the left if shift is positive and 
!                                        to the right if it is negative. 
!                                        Instead of the elements shifted out 
!                                        new elements are taken from boundary. 
!                                        If array is a vector the shift is 
!                                        being done in a natural way, 
!                                        if it is an array of a higher rank, 
!                                        the shift on all sections is along the 
!                                        dimension dim. if dim is missing, it is 
!                                        considered to be 1, in other cases it 
!                                        has to have a scalar integer value 
!                                        between 1 and n (where n equals the 
!                                        rank of array). The argument shift is 
!                                        a scalar integer if array has rank 1, 
!                                        in the other case it can be a scalar 
!                                        integer or an integer array of rank n-1 
!                                        and with the same shape as the array 
!                                        array except along the dimension dim 
!                                        (which is removed because of the 
!                                        lower rank).
! transpose (matrix) 	                It transposes a matrix, which is an 
!                                        array of rank 2. It replaces the rows and 
!                                        columns in the matrix.
