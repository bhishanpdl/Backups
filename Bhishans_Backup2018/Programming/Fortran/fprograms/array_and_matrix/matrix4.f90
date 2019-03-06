!Author: Bhishan Poudel
!topic : Fortran - Manipulation Functions
!cmd   : clear; gfortran matrix.f90 && ./a.out


program matrix
implicit none

    !!!!interface
    interface
        subroutine write_matrix(a)
            real(8), dimension(:,:) :: a
        end subroutine write_matrix
    end interface
    !!!End of interface












   integer,parameter :: n=3
   real(8), dimension(n,n) :: a !2d arrays of shape (3,3)
   integer                 :: i, j
    
   do i = 1, n      ! iteration i = 1 is first column
      do j = 1, n   ! first clm is filled with 1,2,3
      
          if(i.eq.j) then
             a(i, j) = i
          else 
              a(i,j) = 0.d0
          end if
      end do
   end do
   
   !print *, a(1,1), a(2,2), a(3,3), a(3,4)
   !call write_matrix(a)
   call print_matrix('matrix A',m,n,a,lda)
   
end program matrix
!!!!!!!!!!!!!!!!!!!!!End of Main Program




subroutine write_matrix(a)

   real(8), dimension(:,:) :: a
   write(*,*)
   
   do i = lbound(a,1), ubound(a,1)
      write(*,10000) (a(i,j), j = lbound(a,2), ubound(a,2))
   end do
10000 format(1000f10.2)   
end subroutine write_matrix
!!!!!!!!!!!!!!!!!!!!!!!!!!
!===============================================================================
!  This subroutine prints the matrix eigenvalues and eigenvectors
    subroutine print_matrix(desc,m,n,a,lda)
    
    character*(*),intent(in) :: desc ! description
    integer,intent(in) :: m,n,lda
    double precision,intent(inout):: a(lda,*)
    integer :: i,j
    
    write(*,*)
    write(*,*) desc
    
    do i=1,m
      write(*,10000) (a(i,j), j=1,n )
    end do 
    10000 format(1000(:,1x,f12.3)) 
    return
    end subroutine
!===============================================================================







