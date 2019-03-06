!Author: Bhishan Poudel
!Topic : subroutines in Fortran
!Date  : Sep 1, 2015
! cmd  : clear; gfortran subroutine3.f90 && ./a.out


PROGRAM SUBDEM
IMPLICIT NONE 
    REAL A,B,C,SUM,SUMSQ 
    CALL INPUT( A,B,C)
    CALL CALC(A,B,C,SUM,SUMSQ)
    CALL OUTPUT(SUM,SUMSQ)
   	END

   	SUBROUTINE INPUT(X, Y, Z)
   	REAL X,Y,Z
   	PRINT *,'ENTER THREE NUMBERS => '
 	READ *,X,Y,Z
 	RETURN
 	END

 	SUBROUTINE CALC(A,B,C, SUM,SUMSQ)
   	REAL A,B,C,SUM,SUMSQ
   	SUM = A + B + C
   	SUMSQ = SUM **2
   	RETURN
   	END

   	SUBROUTINE OUTPUT(SUM,SUMSQ)
   	REAL SUM, SUMSQ
   	PRINT *,'The sum of the numbers you entered are: ',SUM
   	PRINT *,'And the square of the sum is:',SUMSQ
   	RETURN
   	END
