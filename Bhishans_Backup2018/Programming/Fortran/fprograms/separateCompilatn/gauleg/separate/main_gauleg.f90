!cmd: clear; gfortran -Wall main_gauleg.f90 && ./a.out > main_gauleg.dat

!cmd: clear; f95 main_gauleg.f90 && ./a.out > main_gauleg.dat

                                        

include 'function.f90'
include 'gauleg.f90'
program main_gauleg


      implicit none
      external f

      integer :: ng,nsxx,ngmax
      integer :: kread, kwrite
      integer :: i
      double precision :: pi,sxx,wxx,u,w,lower,upper ! pi is defined below
      double precision :: sum
      double precision :: f

      double precision :: result2,exact
      double precision :: error2
      
            
      ! parameters
      parameter (nsxx=9000,ngmax=9000)  ! maximum no. of iterations

      dimension sxx(nsxx),wxx(nsxx)
      dimension u(ngmax),w(ngmax)

      parameter (pi=3.141592654d0)
      parameter (kread=5,kwrite=6)
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

      
   do 39 ng=2,90,2  !  **** CHANGE
   
      
!      lower = 0.d0   ! *** CHANGE
!      upper = pi
      
      lower = 0.d0   ! *** CHANGE
      upper = 1.d0
      
      !!!!!!!!!!!!!!!!! Calling subroutine !!!!!!!!!!!!
      !    subroutine gauleg (x1,x2,x,w,n)
      !    x(n) and w(n) are 1d arrays of n elements output
      !    x1,x2,n are inputs
      
      call gauleg (lower,upper,u,w,ng)
 
      do i=1,ng
      sxx(i)=u(i)
      wxx(i)=w(i)
      end do

      ! integrate

      sum=0.d0
      do i=1,ng 
      sum = sum + f(sxx(i))*wxx(i)
      end do
      
      
      exact   = pi/4.d0     !**** CHANGE
      !exact   = 2.d0                   !**** CHANGE
      result2 = sum
      error2  = abs(result2-exact)/ abs(exact)
      
      write(kwrite,1000) ng,result2

      
      39 end do
      1000 format(I4, 3(ES14.6)) 

      stop 'data saved in main_gauleg.dat' 
      end

