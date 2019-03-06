!Author: Bhishan Poudel
!cmd   : clear; gfortran arraySubsection.f90 && ./a.out

! To access an array section, you need to provide the lower 
! and the upper bound of the section, as well as a stride 
! (increment), for all the dimensions. 
! This notation is called a subscript triplet:

! array ([lower]:[upper][:stride], ...)

! When no lower and upper bounds are mentioned, 
! it defaults to the extents you declared, and stride value defaults to 1.

! The following example demonstrates the concept:

program arraySubsection
implicit none

   real, dimension(10) :: a, b
   integer             :: i, asize, bsize
   
   a(1:7)    = 5.0 ! a(1) to a(7) assigned 5.0
   a(8:)     = 0.0 ! rest are 0.0 
   b(2:10:2) = 3.9
   b(1:9:2)  = 2.5
   
   
   !display
   print*, "a(1) =", a(1)
   print*, "a(9) =", a(9)
   print*, "b(1) =", b(1)
   print*, "b(2) =", b(2)
   
!   !display all members
!   asize = size(a)
!   bsize = size(b)
!   
!   do i = 1, asize
!      Print *, a(i)
!   end do
!   
!   do i = 1, bsize
!      Print *, b(i)
!   end do
   
end program arraySubsection

! Array Intrinsic Functions

! Fortran 90/95 provides several intrinsic procedures. 
! They can be divided into 7 categories.

!    Vector and matrix multiplication

!    Reduction

!    Inquiry

!    Construction

!    Reshape

!    Manipulation

!    Location

