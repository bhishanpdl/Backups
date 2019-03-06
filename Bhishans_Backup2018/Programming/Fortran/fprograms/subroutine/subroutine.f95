!Author: Bhishan Poudel
!Topic : subroutines in Fortran
!Date  : Sep 1, 2015
! cmd  : clear; gfortran subroutine.f95 && ./a.out

 PROGRAM test
      CALL print_message
   END PROGRAM test
   
   
   SUBROUTINE print_message
      PRINT *, 'Hello world!'
   END SUBROUTINE print_message
