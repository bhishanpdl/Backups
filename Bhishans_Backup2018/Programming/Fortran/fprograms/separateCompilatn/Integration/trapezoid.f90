! to call this:
! call trapezoid (a,b,n,func,sum)


subroutine trapezoid (a,b,n,func,sum)
implicit none
      
      external func                    ! we are using function called func
      double precision    :: func 
      double precision    :: a, b   ! inputs
      integer             :: n      ! input
      double precision    :: sum    ! output
      integer             :: i      ! local variables
      double precision    :: h,x

     
      
      ! algorithm for trapezoid rule
      h = (b-a)/real(n)  
      sum = 0.5*(func(a) + func(b))
          
      do  i=1,n-1
        x = a + i*h
        sum = sum + func(x)   
      end do
      sum = h*sum 
      
return 
end
