!cmd: clear; f90 main.f90 && ./a.out

include 'function.f90'
include 'simpson.f90'
Program main
implicit none

external f
double precision f, a, b, integral,error
double precision,parameter :: exact = 2.0d0 
integer n, i
integer,parameter :: kwrite = 6
double precision, parameter:: pi = 3.1415926
external f

a = 0.0d0
b = pi


write(*,100)

!do n=1,16
do n=2,16,2
   call simpson(f,a,b,integral,n) !integral and n are output, n will be even
   error = exact - integral
   write (kwrite,101) n,exact, integral, abs(error)

end do

100   format('     nint   Simpson')
101   format(i9,3(E15.6))
end
