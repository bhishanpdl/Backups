!Author: Bhishan Poudel
!topic : Fortran - Inquiry Functions
!cmd   : clear; gfortran arrayInquiry.f90 && ./a.out

program arrayInquiry
implicit none

   real, dimension(3,2) :: a 
   a = reshape( (/10,20,30,40,50,60/), (/3,2/) ) 
   
   Print *, shape(a)         !3   2
   Print *, lbound(a, dim=1) !1 (ans: 1 for dim=2)(lower bound is 1)
   Print *, ubound(a, dim=1) !3 (ans: 2 for dim=2)(upper bound from dim)
   Print *, size(a,dim=1)    !3 (ans: 2 for dim=2)(upper bound from dim)
   
end program arrayInquiry



! The following table describes the inquiry functions:
! Function 	            Description
! allocated(array) 	    It is a logical function which indicates 
!                       if the array is allocated.
! lbound(array, dim) 	It returns the lower dimension limit for the array. 
!                       If dim (the dimension) is not given as an argument, 
!                       you get an integer vector, if dim is included, you get 
!                       the integer value with exactly that lower 
!                       dimension limit, for which you asked.
! shape(source) 	    It returns the shape of an array source as an integer vector.
! size(array, dim) 	    It returns the number of elements in an array. 
!                       If dim is not given, and the number of elements in the 
!                       relevant dimension if dim is included.
! ubound(array, dim)    It returns the upper dimensional limits.


