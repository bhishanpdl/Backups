!Bhishan Poudel
! Oct 12, 2015

!cmd: clear; gfortran mod.f90 main2.f90 -o myprog && ./myprog



  USE mod
  real :: a
  a=2.0
  call sub1(a)
  call sub2(a)
  call sub3(a)
  end
