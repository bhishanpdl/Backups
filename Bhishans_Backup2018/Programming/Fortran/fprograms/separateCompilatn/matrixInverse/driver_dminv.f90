!Bhishan Poudel
!cmd: clear; gfortran driver_dminv.f90  -framework vecLib && ./a.out

!cmd: clear; gfortran driver_dminv.f90 && ./a.out  ( then we can use include 'filenames.f90')

!cmd: clear; f95 dminv.f90 print_matrix.f90 driver_dminv.f90 && ./a.out

! Purpose:
! This program is to test the suboutine dminv- a lapack routine to find the inverse of the general matrix
! Required Programs: dminv.f90
! we will use: subroutine dminv (a,n,d,l,m)

! input matrix      inverse matrix is (from wolfram alpha)
! 4  -2  1          1     52   17  2
! 3   6  -4        --     -32  30  19 
! 2   1   8        263    -9   -8  30  

program driver_dminv  
implicit none 
     

      integer,parameter :: n = 3 ! order of matrix A
      integer,parameter :: kwrite=6
      integer :: i,j

      double precision :: a,b   ! input matrix (2d array)
      double precision :: d     ! resultant determinant
      integer :: lwork ! work vector of length n (1d array)
      integer :: work  ! work vector of length n (1d array)

      
      dimension :: lwork(n)
      dimension :: work(n)
      dimension :: a(n,n),b(n,n)


! input matrix
      data a /4.d0,3.d0,2.d0,-2.d0,6.d0,1.d0,1.d0,-4.d0,8.d0/
      b=a

      write(kwrite,*) 'Input Matrix A:'
      do i=1,n
         write(kwrite,10000)(a(i,j) ,  j= 1,n)
      end do 

! call the  subroutine dminv
! original is: subroutine dminv (a,n,d,l,m)
      call dminv(a,n,d,lwork,work)
      write(kwrite,*)
      write(kwrite,*)'Determinant:',d
      
      call print_matrix('Inverse of A', n,n,a,n)
      
10000 format(3(2x,f6.3))


      end program
