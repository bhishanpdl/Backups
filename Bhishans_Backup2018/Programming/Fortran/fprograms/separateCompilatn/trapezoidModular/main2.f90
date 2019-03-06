!cmd: clear; f90 main2.f90 && ./a.out

include 'function3.f90'
include 'trapezoid.f90'

program integration
  
  implicit none
  external f3  ! f3 is sin(x)
  double precision :: f3
  double precision :: integral
  double precision :: a,b,exact,error
  double precision, parameter :: pi = 3.14159265359d0  
  integer, parameter :: kwrite = 6
  integer :: n
  character(len=50) :: outputfile  
  double precision, parameter :: exact = 2.d0  ! for 0 to pi  sin(x)  !** CHANGE
  
  
  outputfile='trapezoid2.dat'
  open(unit=kwrite,file=outputfile,status='unknown')
  
  write(kwrite,10000) '#n','exact','trapezoid','error(diff)'
  write(kwrite,*)
  do n = 1,100  ! no. of intervals or gauss points
  
  
  !limit
  a = 0.0d0   !** CHANGE
  b = pi      !** CHANGE

 
  call trapezoid_rule(f3, a, b, n, integral)
  error = exact - integral
  

  write (kwrite,20000) n, exact,integral,error
   
  10000 format (A4, 3(A14)) 
  20000 format (I4, 3(E14.6))
  end do
  close(kwrite)
  print*, 'data saved in outputfile  ',outputfile
  
end program integration
