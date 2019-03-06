!cmd: clear; gfortran -Wall largegauleg.f90 && ./a.out

!cmd: clear; f95 largegauleg.f90 && ./a.out


program largegauleg


      implicit none
      external f1,f2,f3

      integer :: ng,nsxx,ngmax
      integer :: kread, kwrite
      integer :: i
      double precision :: pi,sxx,wxx,u,w,lower,upper ! pi is defined below
      double precision :: sum1,sum2,sum3
      double precision :: f1,f2,f3

      ! parameters
      parameter (nsxx=9000,ngmax=9000)  ! maximum no. of iterations

      dimension sxx(nsxx),wxx(nsxx)
      dimension u(ngmax),w(ngmax)

      parameter (pi=3.141592654d0)
      parameter (kread=5,kwrite=6)
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

      open(unit=kwrite,file='largegauleg.dat',status='unknown')
      write(kwrite,10000)'#gauss points','1st','2nd','3rd','total'

      do 10 ng= 1,200  !  **** CHANGE


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

      sum1=0.d0
      sum2=0.d0
      sum3=0.d0
      do i=1,ng
      sum1 = sum1 + f1(sxx(i))*wxx(i)
      sum2 = sum2 + f2(sxx(i))*wxx(i)
      sum3 = sum3 + f3(sxx(i))*wxx(i)
      end do

      !write(kwrite,10000)'gauss points','1st','2nd','3rd','total'
      write(kwrite,20000) ng,sum1,sum2,sum3,sum1*sum2*sum3

      10000 format(A12, 4A10)
      20000 format(I12, 4f10.2)

      10 end do
      close(kwrite)

      stop'data saved in largegauleg.dat'
      end program

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
double precision function f1(x)

       implicit none
       double precision x

       f1 = 1.d0/(1.d0+ x*x)

       return
       end
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
double precision function f2(y)

       implicit none
       double precision y

       f2 = y*exp(-y*y)

       return
       end
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
double precision function f3(z)

       implicit none
       double precision z

       f3 = exp(-z)/sqrt(z)

       return
       end
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      subroutine gauleg (x1,x2,x,w,n)
!
!        calculate gauss points for gauss-legendre integration
!                 (numerical recipes)
!
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
