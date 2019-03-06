!Author: Bhishan Poudel
!Program: addition
!cmd    : clear; gfortran scope2.f90 && ./a.out
!ref    : http://www.cs.mtu.edu/~shene/COURSES/cs201/NOTES/F90-Subprograms.pdf


PROGRAM Global
    IMPLICIT NONE
    INTEGER ::  a = 10, b = 20
    WRITE(*,*)  Add(a,b) ! 10+20= 30 also b is changed
    write(*,*) b         ! b = x + y = 10 + 20 = 30
    write(*,*) Add(a,b)  ! 10+30 = 40
    
    Contains
        INTEGER FUNCTION Add(x,y)
            IMPLICIT NONE
            INTEGER, INTENT(IN)::x, y
            b   = x+y
            Add = b
            END FUNCTION Add
END PROGRAM Global

!  The first Add(a,b) returns 30

!  It also changes b to 30
!  The 2nd write(*,*) shows 30
!  the 2nd add(a,b) returns 40
!  this is bad side effect
!  avoid using global entities
