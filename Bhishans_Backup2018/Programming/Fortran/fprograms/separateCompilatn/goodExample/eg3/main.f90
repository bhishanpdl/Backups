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
  
  
!ref: http://www.fortran.gantep.edu.tr/compiling-g95-basic-guide.html#5
  
!note: creating only object files:
! gfortran -c  sub1.f90 sub2.f90 sub3.f90

!creating a library (must start with lib  and extension is .a )
! ar rcv libsubs.a sub1.o sub2.o sub3.o
! it creates libsubs.a 


! to link with the library and compile and excute in one line
! gfortran main.f90 -o myprog -L. -lsubs  
! this creates executable myprog, to run it, ./myprog

! The -L. options tells the linker that the library can be found 
! in the current directory.

! if library is in another folder in the same directory, e.g.:
! gfortran main.f90 -o myprog -L./mylibrary/ -lsubs



! using library from different folder using environment variable:
! first set environment variable called MYLIB
! MYLIB=/home/fred/fortran/lib/

! then,
! gfortran main.f90 -o myprog -L$MYLIB -lsubs
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!notes:
! adding objects to library
! ar rcv libsubs.a another.o

! removing objects from library
! ar dv libsubs.a sub.o
