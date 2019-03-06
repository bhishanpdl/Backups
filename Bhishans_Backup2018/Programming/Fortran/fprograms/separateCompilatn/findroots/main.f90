! cmd : clear; gfortran -Wall function_x.f90 bisect.f90 newton.f90 main.f90 -o main.out && ./main.out
!       clear; f90 function_x.f90 bisect.f90 newton.f90 main.f90 -o main.out && ./main.out > main.dat
! note: if we do not include anything we use this method.

!cmd   : clear; gfortran -Wall main.f90 && ./a.out
!cmd   : clear; f90 main.f90 && ./a.out > main.dat

include 'function_x.f90'
include 'bisect.f90'
include 'newton.f90'


      program main
!
!       find root of function function_x
!
      implicit none

      external function_x  ! we have written this function in the same directory

      double precision x
      double precision function_x
      double precision xinitial,xfinal ! these are given to bisect
      double precision root            ! root is obtained from bisect
      double precision delta
      double precision tolnr   ! tolerance number

      double precision xx(50)  ! array for x values
      double precision fxx(50) ! array for f(x) values
      integer ie, iemax        ! ie means iteration

      integer kread, kwrite
      data kread/5/, kwrite/6/
      data iemax/30/
      
      ! print*, fxx(0) array starts with 1 in fortran
!
      xinitial = 0.1d0  ! NOTE: we should exclude zero, log(0) is not defined
      xfinal   = 1.0d0  ! f(0.1) = 1.60258509299  and f(1) = -6 so root lies in between 0.1 and 1.0
      delta    = 0.1d0
      tolnr    = 1.d-10

      write (kwrite,*)
      write (kwrite,*) 'Search Root via Bisection Method: '
      write (kwrite,*)

      write (kwrite,*) 'left bound :',xinitial,'  right bound :',xfinal

!        call the bisection routine

      call bisect (xinitial,xfinal,root,function_x)  ! root is output all rest are inputs

      write (kwrite,*) 'root found at :',root

      write (kwrite,*)
      write (kwrite,*) 'Search Root via Newton-Raphson Secant Method : '
      write (kwrite,*)
 
!        do newton search
!        starting from xinitial

      xx(1)  = xinitial  ! xx first element is 0.1
      fxx(1) = function_x(xx(1))  !fxx(1) is  f(0.1)
      
      xx(2)  = xx(1) + delta      ! xx(2) is now (first element + delta) = 0.1 + 0.1 = 0.2
      fxx(2) = function_x(xx(2))  ! f(0.2) value

      ie     = 1 ! ie is iteration, will be updated just below.

 61   ie=ie+1    ! now, ie = 2, this is like do loop
 
      if (ie.gt.iemax) stop  ! iemax = max iterations = 30

          write (kwrite,*) ' f(',xx(ie-1),') = ',fxx(ie-1),ie-1   ! xx(ie) and and its function value
     
          call newton (fxx(ie-1),fxx(ie),xx(ie-1),xx(ie),xx(ie+1),delta) ! fxx(1), fxx(2), xx(1), xx(2),delta
      
          fxx(ie+1) = function_x(xx(ie+1))  ! fxx(2) updated

          if (abs(fxx(ie+1)).lt.tolnr) then

              write(6,100) ' the root of f(x) = ',fxx(ie),'  at x = ',xx(ie)
              100 format (A25, E20.5, A10, F10.5)

      else 
          go to 61
      endif

 
      stop 
      end 

      
      
      
