!Author: Bhishan Poudel
!cmd   : clear; gfortran substring.f90 && ./a.out

program subString

   character(len=11)::hello
   hello = "Hello World"
   print*, hello(7:11)   ! World
   
end program subString 
