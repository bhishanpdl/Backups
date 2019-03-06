!Author: Bhishan Poudel
!Topic : Alphabetical Character
!cmd   : clear; gfortran achar.f95 && ./a.out
!note  : This example demonstrates the use of achar function

program testingChars
implicit none

   character:: ch
   integer:: i

   do i=65, 122
      ch = achar(i)
      print*, i, ' ', ch ! prints 65 A to 122 Z
   end do

end program testingChars
