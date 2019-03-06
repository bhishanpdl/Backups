!Author: Bhishan Poudel
!cmd   : clear; gfortran arrayReduction.f90 && ./a.out

program arrayReduction

   real, dimension(3,2) :: a 
   a = reshape( (/5,9,6,10,8,12/), (/3,2/) ) 
   
   Print *, all(a>5)                ! F
   Print *, any(a>5)                ! T 
   Print *, count(a>5)              ! 5
   Print *, all(a>=5 .and. a<10)    ! F
   
   Print *, maxval(a)               ! 12.0000000 (10 spaces occupied)
   Print *, minval(a)               ! 5.00000000
   Print *, sum(a)                  ! 50.0000000
   Print *, product(a)              ! 259200.000
  
end program arrayReduction















! The following table describes the reduction functions:
! Function 	    Description

! all(mask, dim) 	            It returns a logical value that indicates whether all 
!                            relations in mask are .true., along with only the desired 
!                            dimension if the second argument is given.
! any(mask, dim) 	            It returns a logical value that indicates whether any 
!                            relation in mask is .true., along with only the desired 
!                            dimension if the second argument is given.
! count(mask, dim) 	        It returns a numerical value that is the number of 
!                            relations in mask which are .true., along with only 
!                            the desired dimension if the second argument is given.
! maxval(array, dim, mask) 	It returns the largest value in the array array, 
!                            of those that obey the relation in the third 
!                            argument mask, if that one is given, along with only 
!                            the desired dimension if the second argument dim is given.
! minval(array, dim, mask) 	It returns the smallest value in the array array, 
!                            of those that obey the relation in the third 
!                            argument mask, if that one is given, along with 
!                            only the desired dimension if the second argument DIM is given.
! product(array, dim, mask) 	It returns the product of all the elements in the 
!                            array array, of those that obey the relation in the 
!                            third argument mask, if that one is given, 
!                            along with only the desired dimension if the 
!                            second argument dim is given.
! sum (array, dim, mask) 	    It returns the sum of all the elements in the 
!                            array array, of those that obey the relation in the 
!                            third argument mask, if that one is given, 
!                            along with only the desired dimension if the 
!                            second argument dim is given.
                            
                            
