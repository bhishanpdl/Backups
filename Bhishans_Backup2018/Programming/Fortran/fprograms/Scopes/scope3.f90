!Author: Bhishan Poudel
!Program: addition
!cmd    : clear; gfortran scope3.f90 && ./a.out
!ref    : http://www.cs.mtu.edu/~shene/COURSES/cs201/NOTES/F90-Subprograms.pdf


PROGRAM Scope_3 
    IMPLICIT NONE 
    INTEGER :: i, Max = 5 
    
    DO i = 1,  Max 
        Write(*,*) Sum(i) 
    END DO 

    CONTAINS
        INTEGER FUNCTION Sum(n) 
            IMPLICIT NONE 
            INTEGER, INTENT(IN) :: n 
            INTEGER :: i, s ! NEVER USE SAME VARIABLE
 
            s = 0
            ! do other computations
            Sum = s 
        END FUNCTION Sum
         
END PROGRAM Scope_3 

!    Description:
!    Although program and function sum() both
!    have integer vairable i, They are Two different entities.
!    
!    Hence, any changes to i in sum() will NOT affect the i in 
!    program
