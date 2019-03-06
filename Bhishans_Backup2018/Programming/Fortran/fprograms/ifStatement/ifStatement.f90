!Author: Bhishan Poudel
!Program: ifStatement.f90
!cmd    : clear; gfortran -Wall ifStatement.f90 && ./a.out


program ifStatement
implicit none

    INTEGER          :: x
    CHARACTER(LEN=1) :: Grade
    
    x = 80

    IF (x < 50) THEN
        Grade = 'F'
    ELSE IF (x < 60) THEN
        Grade = 'D'
    ELSE IF (x < 70) THEN
        Grade = 'C'
    ELSE IF (x < 80) THEN
        Grade = 'B'
    ELSE
        Grade = 'A'
    END IF
    
    write(*,*) 'The grade is = ', grade


end program ifStatement
