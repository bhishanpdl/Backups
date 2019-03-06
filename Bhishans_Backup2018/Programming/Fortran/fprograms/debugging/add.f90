!Author: Bhishan Poudel
!Program: addition
!cmd    : clear; gfortran add.f90 && ./a.out


program addNumbers

! This simple program adds two numbers
   implicit none

! Type declarations
   real :: a, b, result

! Executable statements
   a = 12.0
   b = 15.0
   result = a + b
   print *, 'The total is ', result
   print*, a*2
   print*, a+6

end program addNumbers

! put 'dbxenv suppress_startup_message 7.8' in your .dbxrc

