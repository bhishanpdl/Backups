!Author: Bhishan Poudel
!cmd   : clear; gfortran achar.f90 && ./a.out
!note  :This example demonstrates the use of achar function

program testingChars
implicit none

   character:: ch
   integer:: i
   
   do i=65, 90
      ch = achar(i)
      print*, i, ' ', ch
   end do
   
end program testingChars
