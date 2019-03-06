!Author: Bhishan Poudel
!Program: functions
!cmd    : clear; gfortran pureFunction.f90 && ./a.out


pure function square(x)
  real, intent(in) :: x
  real :: square
  square = x * x
end function

program main
  real :: a, b, square
  a = 2.0
  b = square(a)
  ! After invoking the square(.) pure function, we can be sure that 
  ! besides assigning the output value of square(a) to b,
  ! nothing else has been changed.
  write(*,*) a,b
end program main


!    Both functions and subroutines can modify their input variables.
!    By necessity, subroutines modify input variables, since they do
!    not return any output value. Functions do not have to, but are 
!    allowed, by default, to modify input variables. A function can be 
!    turned into a pure function, which does not have any side-effects 
!    through the use of the intent attribute on all input variables, 
!    and further enforced through the keyword pure. (The pure keyword 
!    imposes additional restrictions, which essentially prevents the 
!    function from having any side-effects.)


!	intent(in) means that the variable value can enter, but not be changed

!	intent(out) means the variable is set inside the procedure and sent 
!	back to the main program with any initial values ignored.

!	intent(inout) means that the variable comes in with a value and leaves 
!	with a value (default).
