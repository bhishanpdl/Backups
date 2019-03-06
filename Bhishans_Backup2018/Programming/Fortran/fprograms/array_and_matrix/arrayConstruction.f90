!Author: Bhishan Poudel
!topic : Fortran - Construction Functions
!cmd   : clear; gfortran arrayConstruction.f90 && ./a.out

program arrayConstruction
implicit none

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   interface
      subroutine write_array (a) ! array
         real :: a(:,:)
      end subroutine write_array
      
      subroutine write_l_array (a) ! logical array
         logical :: a(:,:)
      end subroutine write_l_array
   end interface
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

   real, dimension(2,3)     :: tsource, fsource, result !2d arrays
   logical, dimension(2,3)  :: mask !2d array with extent 2 and 3
   
   !reshape to increase no. elements in the given dimension
   !tsource,fsource and mask all must have same shape ie.here: 6,2
   !if mask is true, true source is given, otherwise false source is given
   !2 rows, 3 columns 
   tsource  = reshape( (/ 10, 20, 30, 40, 50, 60 /), &
                    (/ 2, 3 /) )
   fsource  = reshape( (/ -10, -20, -30, -40, -50, -60 /), &
                    (/ 2,3 /) )
   mask     = reshape( (/ .true., .true., .true., .false., &
                 .false., .false. /), (/ 2,3 /) )

   result = merge(tsource, fsource, mask)
   call write_array(tsource)
   call write_array(fsource)
   call write_l_array(mask)
   call write_array(result)
   
end program arrayConstruction


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
subroutine write_array (a)

   real :: a(:,:)
   do i = lbound(a,1), ubound(a,1)
      write(*,*) (a(i, j), j = lbound(a,2), ubound(a,2) )
   end do
   return
   
end subroutine write_array
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
subroutine write_l_array (a)

   logical :: a(:,:)
   do i = lbound(a,1), ubound(a,1)
      write(*,*) (a(i, j), j= lbound(a,2), ubound(a,2))
   end do
   return
   
end subroutine write_l_array
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

! The following table describes the construction functions:
! Function 	                        Description

! merge(tsource, fsource, mask) 	This function joins two arrays. It gives the 
!                                elements in tsource if the condition in mask 
!                                is .true. and fsource if the condition in mask 
!                                is .false. The two fields tsource and fsource 
!                                have to be of the same type and the same shape. 
!                                The result also is of this type and shape. 
!                                Also mask must have the same shape.
!                                
! pack(array, mask, vector) 	    It packs an array to a vector with the control 
!                                of mask. The shape of the logical array mask, 
!                                has to agree with the one for array, or else 
!                                mask must be a scalar. If vector is included, 
!                                it has to be an array of rank 1 (i.e. a vector) 
!                                with at least as many elements as those that 
!                                are true in mask, and have the same type as 
!                                array. If mask is a scalar with the value 
!                                .true. then vector instead must have the same 
!                                number of elements as array.
! spread(source, dim, ncopies) 	It returns an array of the same type as the 
!                                argument source with the rank increased by one. 
!                                The parameters dim and ncopies are integer. 
!                                if ncopies is negative the value zero is used 
!                                instead. If source is a scalar, then spread 
!                                becomes a vector with ncopies elements that all 
!                                have the same value as source. The parameter 
!                                dim indicates which index is to be extended. 
!                                it has to be within the range 1 and 1+(rank of source), 
!                                if source is a scalar then dim has to be one. 
!                                The parameter ncopies is the number of elements 
!                                in the new dimensions.
! unpack(vector, mask, array) 	It scatters a vector to an array under control 
!                                of mask. The shape of the logical array mask has 
!                                to agree with the one for array. The array vector 
!                                has to have the rank 1 (i.e. it is a vector) 
!                                with at least as many elements as those that 
!                                are true in mask, and also has to have the 
!                                same type as array. If array is given as a 
!                                scalar then it is considered to be an array 
!                                with the same shape as mask and the same 
!                                scalar elements everywhere.

! The result will be an array with the same shape as mask and the same type as 
! vector. The values will be those from vector that are accepted, 
! while in the remaining positions in array the old values are kept.
