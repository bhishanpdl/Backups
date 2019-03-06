!Author: Bhishan Poudel
!cmd   : clear; gfortran array.f90 && ./a.out

program arrayProg
implicit none

   real             :: numbers(5)   !1d real    array
   integer          :: matrix(3,3)  !2d integer array
   integer          :: i,j
   double precision :: numbers2(5)  !one dim array
   
   
   
print*,    
   
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   
   !assigning some values to the array 'numbers'
   do i=1,5
      numbers(i) = i * 2.0
   end do
   
   !display first value
   print*, "first element is 1*2.0 = ", numbers(1)
   
!   !display all the values
!   do i = 1, 5
!      Print *, numbers(i)
!   end do


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   
   !assigning some values to the 2d array 'matrix'
   do i=1,3
      do j = 1, 3
         matrix(i, j) = i+j
      end do
   end do
   
   !display some elements
   print*, "row 1 clm 1 is 1+1 ", matrix(1,1)
   print*, "row 1 clm 2 is 1+2 ", matrix(1,2)
   print*, "row 3 clm 1 is 3+1 ", matrix(3,1)
    
   
!   !display the values
!   do i=1,3
!      do j = 1, 3
!         Print *, matrix(i,j)
!      end do
!   end do


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!   
   !short hand assignment
   numbers = (/1.5, 3.2,4.5,0.9,7.2 /)
   print*, "4th element is ", numbers(4)  ! ans = 0.899999976
   
   numbers2 = (/1.5, 3.2,4.5,0.9,7.2 /)
   print*, "4th element is ", numbers2(4)  ! ans= 0.89999997615814209
   
!   !display all the values
!   do i = 1, 5
!      Print *, numbers(i)
!   end do

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   
end program arrayProg

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

! Some Array Related Terms

! Term 	    Meaning
! Rank 	    It is the number of dimensions an array has. For example, 
!           for the array named matrix, rank is 2, and for the array 
!           named numbers, rank is 1.
! Extent 	It is the number of elements along a dimension. For example, the array 
!           numbers has extent 5 and the array named matrix has 
!           extent 3 in both dimensions.
! Shape 	    The shape of an array is a one-dimensional integer array, 
!           containing the number of elements (the extent) in each dimension.
!           For example, for the array matrix, shape is (3, 3) and 
!           the array numbers it is (5).
! Size 	    It is the number of elements an array contains. 
!           For the array matrix, it is 9, and for the array numbers, it is 5.



