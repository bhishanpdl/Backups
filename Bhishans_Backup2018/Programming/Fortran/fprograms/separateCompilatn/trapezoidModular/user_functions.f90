module user_functions
  ! Define here your own functions to be integrated 
contains
  double precision function f1(x)
    implicit none
    double precision, intent(in) :: x
    f1 = sin(x)
  end function f1

  double precision function f2(y)
    implicit none
    double precision, intent(in) :: y
    f2 = 1/(y-(0.55*y**2 + 0.0165*y + 0.00012375))
  end function f2
end module user_functions
