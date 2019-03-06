!
!       our function is  f(x) = x^2 -7x -ln(x)
! 
 
      double precision function function_x (x)

      implicit none

      double precision x
 
      function_x = x*x - 7*x - LOG(x) ! f(0.1) = 1.60258509299
     
      return  
      end 
