!Author: Bhishan Poudel
!cmd   : clear; gfortran format2.f90 && ./a.out


program hello
implicit none
real ::x

CHARACTER( len=lO) :: firstname = 'James'
CHARACTER :: initial = 'R'
CHARACTER(len=16) :: last_name= 'Johnson'
CHARACTER(len=9) :: class = 'COSC 2301'
INTEGER :: grade= 92

WRITE (*, 100) firstname, initial, lastname, grade, class
100 FORMAT (1X, A1O, 1X, A1,1X, A1O,4X, i3, T51, A9)
   
end program hello

