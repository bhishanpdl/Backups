      subroutine bisect (left,right,middle,function_x)

      implicit none

      external function_x            ! we are using function called function_x
      double precision function_x    ! intent(in)
      double precision  left,right ! intent (in)
      double precision middle      ! intent (out)

      double precision tol   !!! tolerance, delta 
      parameter (tol=5.d-2)
      double precision x
      double precision fleft,fright,fmiddle
      double precision error   !!! error epsilon
      integer kread, kwrite
      data kread/5/, kwrite/6/
!
!        initialize variables
!
      fleft  = function_x(left)   ! f(a) value
      fright = function_x(right)  ! f(b) value

 32  continue

      middle  = (left+right)*0.5d0
      fmiddle = function_x(middle)

!       determine which half contains the root

      if (fleft*fmiddle .le. 0) then  ! f(a)f(c) < 0

!        root is located in the left subinterval

        right=middle
        fright=fmiddle

      else

!        root is located in the right subinterval

        left=middle
        fleft=fmiddle

      endif

!        check for relative error

      error = abs ( (right-left)/middle )
      if (error .gt. tol ) go to 32

      return 
      end 
      
!
!       first bisection subroutine
!       c = (a+b)/ 2, find c so that f(c) = 0
!       if f(a)f(c)<0, then root lies in [a,c] i.e our left subinterval
!       make b is new c,i.e b =c and continue
!
!       if f(a)f(c)>0, then root lies in [c,b] i.e. right subinterval
!       make a new c, i.e a =c
