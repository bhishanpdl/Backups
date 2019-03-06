!programmer: Bhishan Poudel
!date      : sep, 2015
!cmd       : clear; f90 do1.f90 && ./a.out
!cmd       : clear; gfortran do1.f90 && ./a.out



program doloop
    double precision:: x,xmin,xmax,xstep
    integer :: i,imin,imax
    
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!example 4   for real loop from -ve to positive  i.e. 2n+1 values (1 is for zero)
    
    x = -10.d0
    xstep= 0.1d0
    xmax = 2.d0 * abs(x)/ xstep + 1.d0
    
 do i=1,int(xmax)
 !bhishan: do i=1,int(xmax)
  do 10 i=1,int(xmax)
 
 
 write(6,10000) i,x
 
 x=x+xstep

 end do
 !end do bhishan
 !10 end do
 
 
 10000 format(i4, f10.2)
 
 end program
    
