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
