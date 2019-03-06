
!cmd: clear; f90 main_gaulag.f90 && ./a.out

! given integral =  x^3/(e^x-1) from 0 to infinity
! Laguerre       = (0 to infinity) x^alpha exp(-x) f(x) dx
! here, alpha    = 3, and f(x) = 1/ (1- exp(-x))

!      from Wolfram Alpha:
!      exact = pi**4.d0/15.d0
!      exact = 6.49393940227

include 'function.f90'
include 'gaulag.f90'

      program hw5qn3a
      implicit none
      external f
      double precision::f
      
      integer :: ng,nsxx,ngp    !ng is no. of gauss points, ngp is paramter (max n-points)
      integer :: kread, kwrite
      integer :: i
      double precision :: pi,sxx,wxx,u,w
      double precision :: sum3,error3,exact,alpha
      character(len=50):: filename
      
      
 
!        integration points

      parameter (nsxx=2000)
      parameter (ngp=64)
      parameter (pi=3.141592654d0)
      parameter (kread=5,kwrite=6)
 
      dimension sxx(nsxx),wxx(nsxx)
      dimension u(ngp),w(ngp)
      
        ng = 20
        alpha = 3.d0
        call gaulag (u,w,ng,alpha)
 
 
 
      do i=1,ng
      sxx(i)=u(i)
      wxx(i)=w(i)
      end do
!
!
!       integrate
!
      sum3=0.d0
      do  i=1,ng
      !sum3=sum3 + 1/(1- exp(-sxx(i)) )*wxx(i)  !f(x)
      sum3=sum3 + f(sxx(i))  *wxx(i)  !f(x)
      end do
 
 
      write(kwrite,*) sum3    
      
      end program



