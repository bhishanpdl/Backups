!programmer: Bhishan Poudel
!date      : sep, 2015
!cmd       : clear; f90 doWhileLoop.f90 && ./a.out
!cmd       : clear; gfortran doWhileLoop.f90 && ./a.out



program doloop
implicit none
    real :: x,y
    
    x=1.d0
    do while (x<5.0) ! it will print 4 times (x = 1,2,3&4)
        y=1.d0
        do while (y<3.0)                ! it will print only two times
            print*,'x=',x,'  y=',y
            y=y+1.d0
        end do
        print*,'x================',x
        x=x+1.d0
    end do
    
end program 
!output:
! x= 1.0   y= 1.0
! x= 1.0   y= 2.0
! x================ 1.0
! x= 2.0   y= 1.0
! x= 2.0   y= 2.0
! x================ 2.0
! x= 3.0   y= 1.0
! x= 3.0   y= 2.0
! x================ 3.0
! x= 4.0   y= 1.0
! x= 4.0   y= 2.0
! x================ 4.0

