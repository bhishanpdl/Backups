!Author: Bhishan Poudel
!Program: File input output
!cmd    : clear; gfortran fileDelete.f90 && ./a.out

program fileDelete  
implicit none 

integer :: unit,stat 

open(unit=1234, iostat=stat, file='a.txt', status='old')
if (stat == 0) close(1234, status='delete')

end program fileDelete
