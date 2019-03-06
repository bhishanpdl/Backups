!Author: Bhishan Poudel
!Topic : subroutines in Fortran
!Date  : Oct , 2015
!cmd   : clear; gfortran subroutine2.f95 && ./a.out




!*******************************
       
    module module1
    integer:: n
    contains

       recursive subroutine sub1(x)
       integer,intent(inout):: x
       if (x < n) then
         x = x + 1
         print *, 'x = ', x
         call sub1(x)
       end if
       end subroutine sub1

       end module module1

       
! ********************Main Program

program main
use module1
       
    integer:: x = 0
       
    print *, 'Enter number of repeats'
    read (*,*) n
       
    call sub1(x)
    end program main

