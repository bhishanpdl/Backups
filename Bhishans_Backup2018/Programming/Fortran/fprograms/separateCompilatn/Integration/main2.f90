!cmd: clear; f90 main2.f90 && ./a.out

include 'function_x.f90'
include 'trapezoid.f90'
include 'simpson.f90'


      program main2
      implicit none

      external func                 ! we are using function called func
      double precision  :: func,simpsonint      
      double precision    :: a,b  ! inputs
      integer :: n    ! input
                                               
      double precision    :: sum
      integer :: kread, kwrite
      data kread/5/, kwrite/6/
      
      !**** for gauss legendre
      integer, parameter :: p = 16       ! quadruple precision
      real(kind=p)       :: z, u, v
      integer :: nmax
      real(kind=p), allocatable :: r(:,:)
      nmax =20    
      
      !*************************
      
      do n = 1,nmax
      v = 0._p
      u = 3._p
      n = 10
      
      r = gaussquad(n)
      z = (v-u)/2*dot_product(r(2,:),func((v+u)/2+r(1,:)*(v-u)/2))
      write(kwrite,*) 'n', 'z'
      write(kwrite,*) n, z
      write(*,*)
      end do


      a = 0.d0
      b = 3.d0
      n = 60
      
!        call the trapezoid  subroutine

      call trapezoid (a,b,n,func,sum)
      call simpson   (func,a,b,simpsonint,n)
      
      
      write(kwrite,10000) 'simpson_Trapezoid      =', sum
      write(kwrite,10000) 'simpson_Simpson        =', simpsonint
      
      
      10000 format (A30,F14.6)
      
      !****************************Module for gauss legendre ***************
      contains 
 
  function gaussquad(n) result(r)
  integer, parameter      :: p = 16       ! quadruple precision
  integer                 :: n,k
  real(kind=p)            :: pi
  real(kind=p)            :: r(2, n), x, f, df, dx
  integer                 :: i,  iter
  real(kind = p), allocatable :: p0(:), p1(:), tmp(:)
 
  pi = 4*atan(1._p)
  p0 = [1._p]
  p1 = [1._p, 0._p]
 
  do k = 2, n
     tmp = ((2*k-1)*[p1,0._p]-(k-1)*[0._p, 0._p,p0])/k ! recurrence relation for nPn(x)
     p0 = p1; p1 = tmp
  end do
  do i = 1, n
    x = cos(pi*(i-0.25_p)/(n+0.5_p)) ! x0 value for ith iteration
    do iter = 1, 10
      f = p1(1); df = 0._p
      do k = 2, size(p1)
        df = f + x*df
        f  = p1(k) + x * f
      end do
      dx =  f / df
      x = x - dx
      if (abs(dx)<10*epsilon(dx)) exit
    end do
    r(1,i) = x
    r(2,i) = 2/((1-x**2)*df**2)
  end do
  end function
      
      !************************************************************************
          
      
      end program main2

      
      
      
