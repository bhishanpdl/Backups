!cmd: clear; gfortran -Wall main_gauleg.f90 && ./a.out

!cmd: clear; f90 main_gauleg.f90 && ./a.out
                                        

include 'function.f90'
include 'gauleg.f90'
program main_gauleg


      implicit none
      external f

      integer,parameter :: p=16                ! quadruple precision
      integer :: ng,nsxx,ngmax
      integer :: kread, kwrite
      integer :: i
      real(kind=16) :: pi,sxx,wxx,u,w,lower,upper ! pi is defined below
      real(kind=16) :: sum
      real(kind=16) :: f

      real(kind=16) :: result2
      real(kind=16) :: error2
      
            
      ! parameters
      parameter (nsxx=9000,ngmax=9000)  ! maximum no. of iterations

      dimension sxx(nsxx),wxx(nsxx)
      dimension u(ngmax),w(ngmax)

      parameter (pi=3.141592654d0)
      parameter (kread=5,kwrite=6)
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

      
      ng=20
   
      
    
      lower = 0._p   ! *** CHANGE
      upper = 1._p
      

      call gauleg (lower,upper,u,w,ng)
 
      do i=1,ng
      sxx(i)=u(i)
      wxx(i)=w(i)
      end do

      ! integrate

      sum=0._p
      do i=1,ng 
      sum = sum + f(sxx(i))*wxx(i)
      end do
      
      
      result2 = sum
      
      write(kwrite,10000) ng,result2
      10000 format(i4,f20.10)

      end

