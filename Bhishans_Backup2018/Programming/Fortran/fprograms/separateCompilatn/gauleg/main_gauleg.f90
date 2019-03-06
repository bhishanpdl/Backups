!cmd: clear; gfortran -Wall main_gauleg.f90 && ./a.out

!cmd: clear; f90 main_gauleg.f90 && ./a.out
!examples: sin(x) from 0 to pi, ans=2
!          x^3    from 1 to 2,  ans=15/4=3.75

program main_gauleg
implicit none

      external f
      double precision :: f
      integer :: ng,nsxx,ngmax
      integer :: kread, kwrite
      integer :: i
      double precision :: pi,sxx,wxx,u,w,lower,upper ! pi is defined below
      double precision :: sum
      
      
            
      ! parameters
      parameter (nsxx=9000,ngmax=9000)  ! maximum no. of iterations

      dimension sxx(nsxx),wxx(nsxx)
      dimension u(ngmax),w(ngmax)

      parameter (pi=3.141592654d0)
      parameter (kread=5,kwrite=6)
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!      ng = 10        ! *** CHANGE      
!      lower = 0.d0   ! *** CHANGE
!      upper = pi     ! *** CHANGE
      
      ng = 10        ! *** CHANGE      
      lower = 1.d0   ! *** CHANGE
      upper = 2.d0   ! *** CHANGE
      
      !!!!!!!!!!!!!!!!! Calling subroutine !!!!!!!!!!!!!!!!!!!!
      !    subroutine gauleg (x1,x2,x,w,n)
      !    x(n) and w(n) are 1d arrays of n elements output
      !    x1,x2,n are inputs
      !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      
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
      
      
      write(kwrite,10000) ng,sum

      10000 format(I4, e20.6) 

      stop 'data saved in outputfile' 
      end program
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
double precision function f(r)

       implicit none
       double precision r

       f = r *r *r
       !f = sin(r)
 
       return
       end function
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!        calculate gauss points for gauss-legendre integration
!                 (numerical recipes)  
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      subroutine gauleg (x1,x2,x,w,n) 

      implicit double precision (a-h,o-z) 
!
      parameter (eps=3.d-14) 
      dimension x(n),w(n) ! x(n) and w(n) are 1d arrays of n elements
!
      m=(n+1)/2 
      xm=0.5d0*(x2+x1) 
      xl=0.5d0*(x2-x1) 

      do 12 i=1,m 
        z=cos(3.141592654d0*(i-.25d0)/(n+.5d0)) 
   1    continue 
          p1=1.d0 
          p2=0.d0 
          do 11 j=1,n 
            p3=p2 
            p2=p1 
            p1=((2.d0*j-1.d0)*z*p2-(j-1.d0)*p3)/j 
  11   continue 
       pp=n*(z*p1-p2)/(z*z-1.d0) 
       z1=z 
       z=z1-p1/pp 

       if (abs(z-z1).gt.eps) go to 1 

       x(i)=xm-xl*z 
       x(n+1-i)=xm+xl*z 
       w(i)=2.d0*xl/((1.d0-z*z)*pp*pp) 
       w(n+1-i)=w(i) 
  12  continue 

      return 
      end subroutine

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      


