!cmd: clear; f90 gausslegendre.f90 && ./a.out
!cmd: clear; gfortran -Wall gausslegendre.f90 && ./a.out
!
! Program to calculate integral of exp(x) from -3 to 3
! exact = exp(3) - exp(-3)
! numerical ans ~ 20.036

include 'function_x.f90'
 
program gauss
  implicit none
  
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  external func                 ! we are using function called func
  real(kind=16)  :: func
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      
  integer, parameter :: p = 16       ! quadruple precision
  integer            :: n = 10, k
  real(kind=p), allocatable :: r(:,:)
  real(kind=p)       :: z, a, b, exact
  integer,parameter  :: kread=5,kwrite=6,nmax=20
  
  write(*,*) 'func=', func(1.0_p)
  
  write(kwrite,10000) 'n-point','integral','error'
  do n = 1,nmax
    a = -3; b = 3
    r = gaussquad(n)
    
    !exp is our function exp(x)
    !r(1,:) is xi values
    !r(2,:) is wi weights
    
    
    z = (b-a)/2*dot_product(r(2,:),exp((a+b)/2+r(1,:)*(b-a)/2)) ! we get error if we replace exp by func
    exact = exp(3.0_p)-exp(-3.0_p) ! exact for exp(x)
    
    write(kwrite,20000) n, z, z-exact
    
  end do
  10000 format (A10,A30, A30)
  20000 format (I10,F30.16, E30.16)
  
  
  contains 
 
  function gaussquad(n) result(r)
  integer                 :: n
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
end program
