!ref: http://www.tutorialspoint.com/fortran/fortran_basic_input_output.htm
!cmd : clear; gfortran productDetails.f90 && ./a.out


program productDetails 
implicit none 

   character (len=15) :: name
   integer :: id 
   real :: weight
   name = 'Bhishan'
   id = 1
   weight = 0.08
   
   print *,'123456789012345678901234567890' 
   
   print 100
   100 format (7x,'Name:', 7x, 'Id:', t30, 'Weight:')
   
   print 200, name, id, weight 
   200 format(7x, a, t20, i3, t30, f5.2) 
   
end program productDetails

