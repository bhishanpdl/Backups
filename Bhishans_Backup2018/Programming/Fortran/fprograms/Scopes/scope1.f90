!Author: Bhishan Poudel
!Program: addition
!cmd    : clear; gfortran scope1.f90 && ./a.out
!ref    : http://www.cs.mtu.edu/~shene/COURSES/cs201/NOTES/F90-Subprograms.pdf


PROGRAM Scope_2 
    IMPLICIT NONE 
    INTEGER :: a = 1,b = 2, c = 3 
    WRITE(*,*) Add(a) ! 1+3 = 4   a,b,c are global
    
    c = 4             ! now we change value of global variable c
    WRITE(*,*) Add(a) ! 1+4 = 5 
    WRITE(*,*) Mul(b,c) ! 2*4=8
     
    CONTAINS 
        INTEGER FUNCTION Add(q) 
            IMPLICIT NONE 
            INTEGER, INTENT(IN) :: q 
            Add = q + c 

        END FUNCTION Add
        
        
    INTEGER FUNCTION Mul(x, y) 
        IMPLICIT NONE 
        INTEGER, INTENT(IN) :: x, y
        
        Mul = x * y 
    END FUNCTION Mul
    
END PROGRAM Scope_2

!  Description:
!  a,b,c are global.
!  the first Add(a) returns 4
!  the second Add(a) returns 5
!  mul(b,c) returns 8

!  Thus, the two Add(a)  produce different 
!  results, even though the formal arguments 
!  are the same.
!  This is usually referred to as  side effect.
!  Avoid using global entities!

! A  global entity is visibleto all contained functions.
