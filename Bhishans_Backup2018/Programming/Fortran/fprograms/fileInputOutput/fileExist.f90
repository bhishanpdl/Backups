!Author: Bhishan Poudel
!Program: File input output
!cmd    : clear; gfortran fileExist.f90 && ./a.out

program file4  
implicit none 

logical :: file_exists
! ...

inquire(file='data12.dat',exist=file_exists)
if ( file_exists ) then
  ! Do stuff
  write(*,*) 'the file data1.dat exists'
else
  ! Do other stuff
  write(*,*) 'the file data1.dat doesnot exitsts'
endif

end program file4
