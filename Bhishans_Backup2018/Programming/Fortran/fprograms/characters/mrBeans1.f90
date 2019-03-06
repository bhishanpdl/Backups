!Author: Bhishan Poudel
!cmd   : clear; gfortran mrBeans1.f90 && ./a.out


program hello
implicit none

   character(len=15) :: surname, firstname 
   character(len=6) :: title 
   character(len=25)::greetings
   
   title = 'Mr. ' 
   firstname = 'Rowan ' 
   surname = 'Atkinson'
   greetings = 'A big hello from Mr. Beans'
   
   print *, 'Here is ', title, firstname, surname
   print *, greetings
   
end program hello
