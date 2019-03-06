!Bhishan Poudel
! Oct 12, 2015

!cmd: clear; gfortran main.f90 sub1.f90 sub2.f90 sub3.f90 -o myprog && ./myprog

program main
implicit none


  real :: a
  a=2.0
  call sub1(a)
  call sub2(a)
  call sub3(a)
  end
