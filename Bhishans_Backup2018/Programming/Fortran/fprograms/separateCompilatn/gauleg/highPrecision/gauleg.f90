      subroutine gauleg (x1,x2,x,w,n) 
!
!        calculate gauss points for gauss-legendre integration
!                 (numerical recipes)  
!
      implicit real(kind=16) (a-h,o-z) 
      integer,parameter :: p=16                ! quadruple precision
      parameter (eps=3.d-14) 
      dimension x(n),w(n) ! x(n) and w(n) are 1d arrays of n elements
!
      m=(n+1)/2 
      xm=0.5d0*(x2+x1) 
      xl=0.5d0*(x2-x1) 

      do 12 i=1,m 
        z=cos(3.141592654d0*(i-.25d0)/(n+.5d0)) 
   1    continue 
          p1=1._p 
          p2=0._p 
          do 11 j=1,n 
            p3=p2 
            p2=p1 
            p1=((2._p*j-1._p)*z*p2-(j-1._p)*p3)/j 
  11   continue 
       pp=n*(z*p1-p2)/(z*z-1._p) 
       z1=z 
       z=z1-p1/pp 

       if (abs(z-z1).gt.eps) go to 1 

       x(i)=xm-xl*z 
       x(n+1-i)=xm+xl*z 
       w(i)=2._p*xl/((1._p-z*z)*pp*pp) 
       w(n+1-i)=w(i) 
  12  continue 

      return 
      end 
