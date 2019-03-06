!cmd: clear; f90 trapmodular.f90 && ./a.out


include 'integration_methods.f90'
include 'user_functions.f90'
program integration
  use integration_methods
  use user_functions
  
  implicit none
  double precision :: integral
  double precision :: a,b,exact,error
  double precision, parameter :: pi = 3.14159265359d0
  double precision, parameter :: exact = 2.d0  ! for 0 to pi  sin(x)
  integer, parameter :: kwrite = 6
  integer :: n
  
  do 15  n = 1,1000
  a = 0.0d0
  b = pi

  ! integrating he function f1
  call trapezoid_rule(f1, a, b, n, integral)
  error = exact - integral
  write (kwrite,10000) n, exact,integral,error
   
  15 end do
  10000 format (I4, 3(E14.6))
  

!  ! integrating the function f2
!  call trapezoid_rule(f2, 0.005, 0.1, 1000, integral)
!  write (*,*) 'Trapezoid rule = ', integral
end program integration
