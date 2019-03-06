!Author: Bhishan Poudel
!cmd   : clear; gfortran trim.f90 && ./a.out
!note  : This example demonstrates the use of the trim function

program hello
implicit none

   character(len=15) :: surname, firstname 
   character(len=6)  :: title 
   character(len=25) :: greetings
   
   title     = 'Mr.' 
   firstname = 'Rowan' 
   surname   = 'Atkinson'
   
   print *, 'Here is ', title, firstname, surname
   print *, 'Here is ', trim(title),' ',trim(firstname),' ', trim(surname)
   
end program hello

