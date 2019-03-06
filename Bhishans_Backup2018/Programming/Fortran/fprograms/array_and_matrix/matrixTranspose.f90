!Author: Bhishan Poudel
!topic : Fortran - Manipulation Functions
!cmd   : clear; gfortran matrixTranspose.f90 && ./a.out

program matrixTranspose
implicit none

    !!!!interface
    interface
        subroutine write_matrix(a)
            integer, dimension(:,:) :: a
        end subroutine write_matrix
    end interface
    !!!End of interface

   integer, dimension(3,3) :: a, b !2d arrays of shape (3,3)
   integer                 :: i, j
    
   do i = 1, 3      ! iteration i = 1 is first column
      do j = 1, 3   ! first clm is filled with 1,2,3
         a(i, j) = i
      end do
   end do
   
   print *, 'Given Matrix'
   
   call write_matrix(a)
   b = transpose(a)
   print *, 'Transposed Matrix:'
   
   call write_matrix(b)
end program matrixTranspose
!!!!!!!!!!!!!!!!!!!!!End of Main Program

subroutine write_matrix(a)

   integer, dimension(:,:) :: a
   write(*,*)
   
   do i = lbound(a,1), ubound(a,1)
      write(*,*) (a(i,j), j = lbound(a,2), ubound(a,2))
   end do
   
end subroutine write_matrix
!!!!!!!!!!!!!!!!!!!!!!!!!!!End of subroutine write_matrix

