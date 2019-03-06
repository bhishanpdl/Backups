!Author: Bhishan Poudel
!Program: functions
!cmd    : clear; gfortran module2.f90 && ./a.out



!*********** Module ********************
module mymod
   implicit none
   private
   public :: myfunc
 contains
   function myfunc(x) result(y)
     implicit none
     integer, intent(in)  :: x
     integer              :: y
     y = x * x
   end function myfunc
 end module mymod
 

!******* Main Program******************
program advanced
   use mymod, only: myfunc
   implicit none
   integer :: x, y
   x = 5
   y = myfunc(x)
   write(*,*) x ,y
 end program advanced
