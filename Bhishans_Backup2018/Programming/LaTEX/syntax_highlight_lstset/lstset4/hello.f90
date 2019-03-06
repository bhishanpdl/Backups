! Author: Bhishan Poudel
! to compile: gfortran -o hello hello.f90

! clear; gfortran hello.f90 && ./a.out
! clear; f95 hello.f90 && ./a.out

! This program print the hello world

program hello
implicit none

    print *, "Hello World!"
    write(*,*) "Greetings, denizens of planet Earth!"
end program hello
