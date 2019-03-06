!programmer: Bhishan Poudel
!date      : sep, 2015
!cmd       : clear; f90 doLoop.f90 && ./a.out
!cmd       : clear; gfortran -Wall doLoop.f90 && ./a.out



program doloop
    integer ::i,j,k
    double precision ::a
    real :: x
    
    
    
    do 1 i = 1,10  ! label 1 is optional
        a = float(i)/10.0
        write(*,*) a
    1 end do
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!example 2
    !REAL :: x  ! variables cannot be defined here, must be defined on top

     do x = 1, 10, 2 ! step size is 2
    
         print*, x
    end do
    
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!example 3

     do 2 x = 10.0, 1.0, -0.25 ! label 2 is optional
         a = 2*x
        2 print*, 'x=', x, 'a=', a
    !end do                   ! here, we dont need end do
    
    

    
    
    
    
    
    


end program doloop

! tips:
! we can use word count instead of i 
! DO Count = 1, maxnum


! Do not change the value of any variable involved in initial-value, final-value and step-size. The following is not a good practice:

!    INTEGER :: a, b, c, d, e

!    DO a = b+c, c*d, (b+c)/e
!       READ(*,*) b          ! initial-value is changed
!       d = 5                ! final-value is changed
!       e = -3               ! step-size is changed
!    END DO

! Do not change the value of the control-var. The following is not a good practice:

!    INTEGER :: a, b, c

!    DO a = b, c, 3
!       READ(*,*)  a ! the value of a is changed
!       a = b-c      ! the value of a is changed
!    END DO

!While you can use REAL type for control-var, initial-value, final-value and step-size, it would be better not to use this feature at all since it may be dropped in future Fortran standard. In the DO-loop below, x successively receives -1.0, -0.75, -0.5, -0.25, 0.0, 0.25, 0.5, 0.75 and 1.0.

!    REAL :: x

!    DO x = -1.0, 1.0, 0.25
!       .....
!    END DO



