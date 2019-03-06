! ref : http://faculty.washington.edu/rjl/classes/am583s2013/notes/fortran_modules.html

! cmd : !$ gfortran sub1m.f90 main.f90 -o main.exe && ./main.exe
program demo
    use sub1m, only: sub1
    print *, "In main program"
    call sub1()
end program demo

!$ gfortran sub1m.f90 main.f90 -o main.exe
!$ ./main.exe

