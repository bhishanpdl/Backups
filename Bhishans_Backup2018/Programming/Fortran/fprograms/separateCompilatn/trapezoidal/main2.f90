!cmd: clear; f90 main2.f90 && ./a.out

include 'function3.f90'
include 'trapezoid.f90'

program integration

  implicit none
  external f3
  double precision :: f3
  double precision :: integral
  double precision :: a,b
  integer, parameter :: kwrite = 6
  integer :: n
  character(len=50) :: outputfile


  outputfile='trapezoid.dat'
  open(unit=kwrite,file=outputfile,status='unknown')

  do n = 1,100  ! no. of intervals or gauss points


  !limit
  a = 0.0d0   !** CHANGE
  b = 1.d0      !** CHANGE


  call trapezoid_rule(f3, a, b, n, integral)


  write (kwrite,10000) n,integral

  10000 format (I4, F14.2)
  end do
  close(kwrite)
  print*, 'data saved in outputfile  ',outputfile

end program integration
