
 Subroutine simpson(func,a,b,integral,n)
!==========================================================
! Integration of func(x) on [a,b]
! Method: Simpson rule for n intervals  
! written by: Alex Godunov (October 2009)
!----------------------------------------------------------
! IN:
! func   - Function to integrate (supplied by a user)
! a	  - Lower limit of integration
! b	  - Upper limit of integration
! n   - number of intervals
! OUT:
! integral - Result of integration
!
! simpson = h/3 *  (y0+yn)   ! n MUST be even
!                 +4*(y1+y3+....+yn-1)
!                 +2*(y2+y3+....+yn-2)
!
!==========================================================
implicit none
double precision func, a, b, integral,s
double precision h, x
integer nint
integer n, i

! if n is odd we add +1 to make it even
if((n/2)*2.ne.n) n=n+1

! loop over n (number of intervals)
s = 0.0
h = (b-a)/dfloat(n)
do i=2, n-2, 2            !i=2,4,6,8,.....,n-2
   x   = a + dfloat(i)*h
   s   = s + 2.0*func(x) + 4.0*func(x+h)  ! 2*even + 4*odd here, we miss y0,yn,and y1 values
end do
integral = (s + func(a) + func(b) + 4.0*func(a+h))*h/3.0
return
end subroutine simpson
