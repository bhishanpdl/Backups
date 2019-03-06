! ref : http://faculty.washington.edu/rjl/classes/am583s2013/notes/fortran_modules.html

! cmd : clear; gfortran circle_mod.f90 initialize.f90 main.f90 -o main.exe && ./main.exe
! clear; make main.exe && ./main.exe

program main

    use circle_mod, only: pi, area
    implicit none
    real(kind=8) :: a

    call initialize()   ! sets pi

    ! print module variable pi:
    print *, 'pi = ', pi

    ! test the area function from module:
    a = area(2.d0)
    print *, 'area for a circle of radius 2: ', a

end program main

!	This example can be compiled and executed by going into the 
!	directory $UWHPSC/fortran/circles2/ and typing:

! 	gfortran circle_mod.f90 initialize.f90 main.f90 -o main.exe
! 	./main.exe

!	Or by using the Makefile in this directory:

!	make main.exe
!	./main.exe


