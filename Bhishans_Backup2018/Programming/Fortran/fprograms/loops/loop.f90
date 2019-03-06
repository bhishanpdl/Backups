
!Author: Bhishan Poudel
!Program: File input output
!cmd    : clear; gfortran loop.f90 && ./a.out

program chars
        implicit none
        character ::a*10,b*10
        a='hello'
        b='goodbye'
        write(*,10) a,b
        10    format(2a10)
        end program chars
        
        
!        General form  nAm

!    n is the number of strings to print
!    m is the maximum number of characters to output
