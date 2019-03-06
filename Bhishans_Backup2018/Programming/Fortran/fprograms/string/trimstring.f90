!Author: Bhishan Poudel
!cmd   : clear; gfortran trimstring.f90 && ./a.out

program trimString
implicit none

   character (len=*), parameter :: fname="Bhishan", sname="Poudel"
   character (len=20) :: fullname 
   
   fullname=fname//" "//sname !concatenating the strings
   
   print*,fullname,", A physics student!"
   print*,trim(fullname),", A physics student!"
   
end program trimString
