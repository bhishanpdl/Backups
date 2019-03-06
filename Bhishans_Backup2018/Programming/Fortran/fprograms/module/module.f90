!Author: Bhishan Poudel
!cmd   : clear; gfortran module.f90 && ./a.out

! it is better to put your procedures into a module so that their 
! interfaces will be known to each other and any procedure or 
! program useing the module:


program tst
use MyStuff
implicit none

real z,x,y
x=10.
y=2.
call s(10.,5.,z)
print*,z

end program
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

module MyStuff

contains

function c(x,y)
implicit none
real :: c
real :: x, y
c = x*y
return
end

subroutine s(x,y,z)
implicit none
real :: x, y, z

z = c(x,y)
end

end module MyStuff

