        
        subroutine newton (f1,f2,a,b,c,delta)
        !call       newtonr (fxx(ie-1),fxx(ie),xx(ie-1),xx(ie),xx(ie+1),delta)
        !subroutine newtonr (f1       ,f2     ,a       ,b     ,c       ,delta)
        ! note: x is defined in function_x, here we define m instead of x
        
!===================================================================================
!
!   Author 		: Bhishan Poudel
!	Purpose		: This subroutine searches for the roots of an equation f(m) = 0;
!            	
!	Arguments 	: delta, a,b and f(a) = f1 and f(b) = f2  and intent in 
!				  c is intent out.

!   Note 		: This program first, search where f(m) changes sign, then
!                 search for the zero with the Newton-Raphson method.
!
!
      implicit none

      double precision,intent(in)   :: f1,f2,a,b,delta  ! f1 is f(a) 
      double precision,intent(out)  :: c
      double precision              :: sign1,sign2  ! local variables
      integer,save                  :: flag = 0 ! saving value to ensure that variables used within
       							              !a procedure preserve their values between
       							              ! successive calls to the procedure
       
!     looking for change in sign
!
      if (flag.eq.0) then
          sign1=sign(1.d0,f1)  ! sign1 = + 1.000 if f1 is +ve and so on
          sign2=sign(1.d0,f2)  ! note: arguments must be of same type for transfer of sign function
          
 
      
          if (sign1.eq.sign2) then ! flag = 0 and f1,f2 has same sign i.e. f (a) f (b) > 0
              c=b+delta          ! c=b+delta is returned
              return
      
          else               ! when flag=0, and f1,f3 has opposite signs i.e. f (a) f (b) < 0, we use secant method
              c= (f2 *a - f1*b) / (f2-f1)
              flag=1
          endif
      
 
        !Newton Raphson search
    else if (flag.eq.1) then 
        c= (f2*a - f1*b) / (f2-f1)
 
    endif
 
    return
end
!   from: Morten HJ fall 2012 page 105
!   ===================================
!	A variation of the secant method is the so-called false
!	position method (regula falsi from Latin) where the interval [a,b] 
!	is chosen so that f (a) f (b) < 0 , else there is no solution.

!	we determine c by the point where a straight line
!	from the point (a, f (a)) to (b, f (b)) crosses the x − axis , that is
!	c = f(b) a − f(a) b    = (f2 *a - f1*b) / (f2-f1)
!	    ________________
!		f(b) − f(a)
!
!
!   Newton Raphson equation 4.6 
!	x_(n+1) = x_n − f(x_n) / f′ (x_n)
!
!   Secant method eq 4.37
!
!   x_(n+1) = xn - f(xn) * (xn - xn1))
!             	    ===================  eq 4.37
!                   f(xn) -f(xn-1)
!
!           = f(xn)x(n-1) - f(xn-1)xn
!             ========================   eq 4.38
!             f(xn) - f(xn-1)
!
!
!      
      








