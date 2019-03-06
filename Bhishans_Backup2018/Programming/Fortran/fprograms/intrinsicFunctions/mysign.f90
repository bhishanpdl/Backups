!cmd  : clear; gfortran -Wall mysign.f90 && ./a.out


program mysign

double precision   :: f1 = 5.0, f2 = -3.0
double precision   :: v1,v2,v3,v4  ! local variables

v1=sign(1.d0,f1)  ! Transfer of sign function, v1 = + 1.000 if f1 is +ve and vice versa
v2=sign(1.d0,f2)
v3=sign(2.0,-3.2)  
v4=sign(3,5)    ! arguments must be of same type 3.0 doesnot work
 
write(*,*) v1,v2,v3,v4 
 
end program mysign


!    Note: The sign transfer function SIGN(X,Y) takes the sign of the second argument and puts it on 
!    	   the first argument, ABS(X) if Y >= 0 and -ABS(X) if Y < 0. 

