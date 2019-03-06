!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!     user defined function
!!
!!
!       double precision function f(r)

!       implicit none
!       double precision r,result

!       if(abs(r).lt.1.d-2) then
!          result = 1.d0 - r*r*r/6.d0 + r**5/1.2d2  ! taylor expansion of given function to integrate
!      else
!          result=sin(r)                      ! given function to integrate
!      endif

!       f = result
! 
!       return
!       end
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
double precision function f(r)

       implicit none
       double precision r

       f = r *r *r
 
       return
       end
