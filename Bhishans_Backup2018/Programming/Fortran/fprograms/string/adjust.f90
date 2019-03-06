!Author: Bhishan Poudel
!cmd   : clear; gfortran adjust.f90 && ./a.out

program hello
implicit none

   character(len=15) :: surname, firstname 
   character(len=6)  :: title 
   character(len=40) :: name
   
   title     = 'Mr. ' 
   firstname = 'Rowan' 
   surname   = 'Atkinson'
   
   name = adjustl(title)//adjustl(firstname)//adjustl(surname)
   print *, 'Here is ', name
   
   name = adjustr(title)//adjustr(firstname)//adjustr(surname)
   print *, 'Here is ', name
   
   name = trim(title)//trim(firstname)//trim(surname)
   print *, 'Here is ', name
   
end program hello
