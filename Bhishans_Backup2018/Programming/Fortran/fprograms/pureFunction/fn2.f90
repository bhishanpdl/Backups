!Author: Bhishan Poudel
!Program: functions
!cmd    : clear; gfortran fn2.f90 && ./a.out


program simple
   implicit none
   integer :: x, y
   x = 3
   y = myfunc(3)
   
   print*, x,y
   
 contains
   function myfunc(x) result(y)
     implicit none
     integer, intent(in)  :: x
     integer              :: y
     
     y = x *x
     
   end function myfunc
   
   
 end program
