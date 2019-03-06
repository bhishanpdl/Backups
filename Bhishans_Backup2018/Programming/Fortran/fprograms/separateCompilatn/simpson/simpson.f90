

Subroutine simpson(f,a,b,integral,n)
!==========================================================
!----------------------------------------------------------
! IN:
! f   - Function to integrate (supplied by a user)
! a	  - Lower limit of integration
! b	  - Upper limit of integration
! n   - number of intervals
! OUT:
! integral - Result of integration
!==========================================================
implicit none
double precision f, a, b, integral,s
double precision h, x
integer nint
integer n, i

! if n is odd we add +1 to make it even
if((n/2)*2.ne.n) n=n+1

! loop over n (number of intervals)
s = 0.0
h = (b-a)/dfloat(n)
do i=2, n-2, 2
   x   = a+dfloat(i)*h
   s = s + 2.0*f(x) + 4.0*f(x+h)
end do
integral = (s + f(a) + f(b) + 4.0*f(a+h))*h/3.0
return
end subroutine simpson
