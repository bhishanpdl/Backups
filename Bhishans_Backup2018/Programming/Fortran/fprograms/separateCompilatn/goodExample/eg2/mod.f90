MODULE mod

CONTAINS

  subroutine sub1(x)
  real :: x
  print *, x
  end subroutine sub1

  subroutine sub2(x)
  real :: x
  print *, x**2
  end subroutine sub2

  subroutine sub3(x)
  real :: x
  print *, x**3
  end subroutine sub3

END MODULE mod
