!Topic     : Sine Series
!Programmer: Bhishan Poudel
!cmd       : clear; f90 sineSeries.f90 && ./a.out
!cmd       : clear; gfortran -Wall sineSeries.f90 && ./a.out
!sin(x)    : x - x^3/3! + x^5/5! - x^7/7! + ...
!maxterm           1   2        3        4
!term2     : term1 *    -x*x/(2n*(2n+1))

program
    implicit none  
   
     integer :: ii, maxterm    
     double precision   :: x, val, mysum, term 
     

      x = 90 ! degree
      maxterm = 10
     
      val = x    
      x = x * 3.14159 / 180  ! radian
      
       
      term = x    
      mysum = x 
     
     ii = 1  
     do while ( ii < maxterm + 1)   
        
          term = term * (-1*   x * x) / (2 * ii * (2 * ii + 1))    
          mysum = mysum + term    
     ii = ii+1
     end do  
     
     print*, 'Sine value of x =',val, 'degree is= ' , mysum
       
end program 
