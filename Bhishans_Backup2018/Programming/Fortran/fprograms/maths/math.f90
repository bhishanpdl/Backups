!cmd: clear; f90 math.f90 && ./a.out
! note : power is **

program math
! -10 -9 -8 -7 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6 7 8 9 10
!  *               *             *         *         *

write(*,*) mod(8,5)   ,modulo (8,5)    ! 3,3
write(*,*) mod(-8,5)  ,modulo (-8,5)   ! -3,2
write(*,*) mod(8,-5)  ,modulo (8,-5)   ! 3,-2
write(*,*) mod(-8,-5) ,modulo (-8,-5)  ! -3,-3
write(*,*) mod(5,8)   ,modulo (5,8)    ! 5,5

!!logarithmic and exponentials
write(*,*) 'logarithmic and exponentials'
write(*,*) log10 (10.)            !1.0
write(*,*) exp (3.)               !20.085537
write(*,*) sinh (2.73)            !7.6338343
write(*,*) cosh (-1.32)           !2.0052783

!!ARITHMETIC
write(*,*) 'ARITHMETIC'
write(*,*) max(1,2,3,0.4)  
write(*,*) min(1,2,0.3)

!TYPE CONVERSION
write(*,*)    'TYPE CONVERSION'
write(*,*)    real(3)      !  3.0
write(*,*)    real(4/3)    !  1.0
write(*,*)    real(5/2*2)  !  4.0
write(*,*)    ifix(10.32)  !  10
write(*,*)    ifix(10.97)  !  10

! Notes:

! If the function name begins with i-n, an 
! integer is generally returned.
! If the function name begins with a-h, 
! or o-z, a real is generally returned.

! This is useful to know to avoid mixed mode arithmetic.
! However, there are some functions, 
! called generic functions, which return a value of 
! the type of the argument. For example, 
! a real argument results in a real value. 

end program math

!	Some Comments on Speed
!   1.sin0p1 = sin(0.1)
!   =========================

!   
!	Now, use the new variable sin0p1 wherever "sin(0.1)" is needed.

!   2. x*x better than x**2 better than x**2.0
!   ================================================

!	The high cost of "exp" and "log" is also reflected in the 
!	use of the operator "**". Usually an expression like "x**y" 
!	results in the compiler inserting code equivalent to "exp(y*log(x))". 
!	However, most compilers are smart enough to realize that if y is an 
!	integer, they can use one or more multiplications 
!	(x**2=x*x, x**3=x*x*x, etc.). Such compilers contain the 
!	logic to know the break-even point, in terms of size of y, 
!	between such multiplication and the combination of "exp" and 
!	"log". It is always faster to program "x**2" than "x**2.0", 
!	so be careful in your choice of types for exponents.
!	
!	3. "sqrt(x)" rather than "x**0.5"
!   ==================================

!	Speed is also a factor in the existence of the "sqrt" 
!	intrinsic function. This is a special algorithm for 
!	computing the square root of a number, that is always 
!	faster than raising the number to the 0.5 power. 
!	When the option exists use "sqrt(x)" rather than "x**0.5". 
!	In my experience "sqrt(sqrt(x))" is faster than "x**0.25".

!   4. multiply instead of divide
!   ===============================

!   instead of y/x : define "rx=1./x", then multiply y*rx

!	While we are on the subject of speed, we should review the 
!	relative speed of other operations. Add and subtract are 
!	always the fastest. Multiply comes second. Divide is 
!	slower than multiply, but significantly faster than sqrt. 
!	If you are going to divide by a variable x frequently 
!	(more than 2 or 3 times), it is a good idea to define 
!	another variable say rx with the equation "rx=1./x", 
!	then multiply by rx where you would have divided by x.
!	
!	
