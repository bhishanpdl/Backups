!cmd: clear; gfortran -Wall doContinue.f90 && ./a.out 
!cmd: clear; f90 doContinue.f90 && ./a.out > doContinueout.dat && xdg-open doContinueout.dat &

program doContinue
implicit none

integer :: k
integer,parameter ::kread =5,kwrite=6,M=20
double precision  ::h,F1,F2,d,r,x,a,f


      f(x) = atan(x) ! original


      print *
      print *,' #Derivative approximations: forward difference formula'
      print *,' #Section 7.1, Kincaid-Cheney'
      print *
      print 3,'#k','h','F2','F1','d','r'

      h = 1.0
      a = sqrt(2.0)
      f1 = f(a)
      
      do 2 k=0,M
         F2 = f(a+h)
         d = F2 - F1
         r = d/h
         print 4,k,h,F2,F1,d,abs(r)
         h = 0.5*h
 2    continue
 
 
 3    format(a4,a9,a16,a15,a14,a15)
 4    format(1x,i3,5(2x,e13.6))
      stop

end program doContinue
