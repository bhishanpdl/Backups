!cmd: clear; f90 main3.f90 && ./a.out

include 'function4.f90'
include 'trapezoid.f90'

program integration
  
  implicit none
  external f4  ! f4 is sqrt(1-x*x)
  double precision :: f4
  double precision :: integral
  double precision :: a,b,exact,error
  double precision, parameter :: pi = 3.14159265359d0
  double precision, parameter :: exact = 2.d0 
  integer, parameter :: kwrite = 6
  integer :: n
  
  n = 10
  !do 15  n = 1,1000
  a = -1.d0
  b = 1.d0

 
  call trapezoid_rule(f4, a, b, n, integral)
  error = exact - integral
  
  write(kwrite,10000) '#n','exact','trapezoid','error(diff)'
  write(kwrite,*)
  write (kwrite,20000) n, exact,integral,error
   
  10000 format (A4, 3(A14)) 
  20000 format (I4, 3(E14.6))
  
end program integration
