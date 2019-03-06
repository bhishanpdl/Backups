!cmd: clear; gfortran -Wall main_gauleg.f90 && ./a.out

!cmd: clear; f90 main_gauleg.f90 && ./a.out

                                        

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

      double precision :: result2
      
            
      ! parameters
      parameter (nsxx=9000,ngmax=9000)  ! maximum no. of iterations

      dimension sxx(nsxx),wxx(nsxx)
      dimension u(ngmax),w(ngmax)

      parameter (pi=3.141592654d0)
      parameter (kread=5,kwrite=6)
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

      
       ng = 20
      
      lower = 0.d0   ! *** CHANGE
      upper = 1.d0
      
      
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
      
      
      result2 = sum
      
      write(kwrite,1000) ng,result2

      1000 format(I4, 3(ES14.6)) 

      end

