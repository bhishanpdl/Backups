! cmd : clear; gfortran -Wall precision.f90 && ./a.out

program myprecision

implicit none

real               :: a          !single precision kind=4
double precision   :: b          !double precision kind=8
integer, parameter :: p = 16     ! quadruple precision kind=16
real(kind=p)       :: d


a=3.77
write(6,10000) 2.0 * a

b=3.77d0
write(6,10000) 2.d0 * b

d=3.77_p
write(6,10000) 2.0_p * d


10000 format(f40.30)

end program

