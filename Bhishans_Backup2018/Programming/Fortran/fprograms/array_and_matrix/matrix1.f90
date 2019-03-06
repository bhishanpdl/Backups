!Bhishan Poudel
!Oct 17, 2015 Sat

!bp: clear; f95 matrix1.f90 && ./a.out
!bp: clear; gfortran -Wall matrix1.f90 && ./a.out


program matrix
implicit none

   integer,parameter         :: n=3,kwrite=6
   real(8), dimension(n,n)   :: a
   integer                   :: i, j

!   initialize matrix a(i,j) to all zeros   
    do i = 1, n      ! iteration i = 1 is first column
      do j = 1, n    
          a(i, j) =0.d0    
      end do
   end do
   
!!  filling elements to matrix a(i,j) for example diagonal elements are i, and others are zeros   
!   do i = 1, n 
!      do j = 1, n   
!      
!          if(i.eq.j) then
!             a(i, j) = dble(i)
!          else 
!              a(i,j) = 0.d0
!          end if
!      end do
!   end do

!  filling simple values
   a(1,:) = (/11,12,13/)
   a(2,:) = (/21,22,23/)
   a(3,:) = (/31,32,33/)
   
!  printing first row
   write(kwrite,*)
   write(kwrite,*) 'first row'
   write(kwrite,*) a(1,1), a(1,2), a(1,3)
   
!  printing first row using subroutine
   call print_matrix('first row',1,n,a,n)
   
!  printing first column
   write(kwrite,*)
   write(kwrite,*) 'first column'
   write(kwrite,*) a(1,1), a(2,1), a(3,1)
   
!  printing first row using subroutine
   call print_matrix('first column',n,1,a,n)   
   
!  printing the input matrix
   call print_matrix('input matrix',n,n,a,n)
   
   
   
end program matrix
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
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
    write(*,*)
     
    10000 format(1000(:,1x,f12.3)) 
    return
    end subroutine
!===============================================================================







