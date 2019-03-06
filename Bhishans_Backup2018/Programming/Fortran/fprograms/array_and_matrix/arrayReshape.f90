!Author: Bhishan Poudel
!topic : Fortran - Reshape Functions
!cmd   : clear; gfortran arrayReshape.f90 && ./a.out

program arrayReshape
implicit none

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    interface
        subroutine write_matrix(a)
            real, dimension(:,:) :: a
        end subroutine write_matrix
    end interface
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Main Program

   real, dimension (1:9) :: b = (/ 21, 22, 23, 24, 25, 26, 27, 28, 29 /)
   real, dimension (1:3, 1:3) :: c, d, e
   real, dimension (1:4, 1:4) :: f, g, h

   integer, dimension (1:2) :: order1 = (/ 1, 2 /)
   integer, dimension (1:2) :: order2 = (/ 2, 1 /)
   real, dimension (1:16) :: pad1 = (/ -1, -2, -3, -4, -5, -6, -7, -8, &
                                 & -9, -10, -11, -12, -13, -14, -15, -16 /)

   c = reshape( b, (/ 3, 3 /) )
   !call write_matrix(c) ! c is 3*3 matrix with elements 21 to 29

   d = reshape( b, (/ 3, 3 /), order = order1)
   !call write_matrix(d) ! c and d are same

   e = reshape( b, (/ 3, 3 /), order = order2)
   !call write_matrix(e) ! e is transpose of c or d

   f = reshape( b, (/ 4, 4 /), pad = pad1)
   !call write_matrix(f) ! f is 4*4 matrix, with -1 to -7 added in the end

   g = reshape( b, (/ 4, 4 /), pad = pad1, order = order1)
   !call write_matrix(g) ! f and g are same

   h = reshape( b, (/ 4, 4 /), pad = pad1, order = order2)
   call write_matrix(h)  ! transpose of f or g

end program arrayReshape

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!End of Main Program
subroutine write_matrix(a)
   real, dimension(:,:) :: a
   write(*,*)
   
   do i = lbound(a,1), ubound(a,1)
      write(*,*) (a(i,j), j = lbound(a,2), ubound(a,2))
   end do
end subroutine write_matrix
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


! The following table describes the reshape function:
! Function 	                        Description

! reshape(source, shape, pad, order) 	
!       It constructs an array with a specified shape shape starting from 
!       the elements in a given array source. If pad is not included 
!       then the size of source has to be at least product (shape). 
!       If pad is included, it has to have the same type as source. 
!       If order is included, it has to be an integer array with the same 
!       shape as shape and the values must be a permutation of (1,2,3,...,n), 
!       where n is the number of elements in shape , 
!       it has to be less than, or equal to 7.
