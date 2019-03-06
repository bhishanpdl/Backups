!Author : Bhishan Poudel
!Program: File input output
!cmd    : clear; gfortran fileWrite.f90 && ./a.out


program fileWrite   
implicit none

   real, dimension(10) :: x, y  
   real, dimension(10) :: p, q
   integer :: i  
   
   ! data  
   do i=1,10 
      x(i) = i * 0.1 
      y(i) = sin(x(i)) * (1-cos(x(i)/3.0))  
   end do  
   
   ! output data into a file
   ! statuses are new,old,replace,delete,scratch 
   open(1, file='data1.dat', status='replace')  
   do i=1,10  
      write(1,*) x(i), y(i)   
   end do
   
   close(1)
   
   write(*,*) 'Please see the directory for the output file'
   
end program

!open(unit = u, iostat = ios, err = errno, file = filename, 
! status = new/old/delete/scratch/replace,
! access = sequential or direct
! form = formatted/unformatted : default is unformatted
! recl = lenght of record in a direct access file

! close ([UNIT=]u[,IOSTAT=ios,ERR=err,STATUS=sta])
! clear (unit = u, iostat = ios, err = errno, status = iostatus)
