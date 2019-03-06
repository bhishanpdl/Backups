!Author: Bhishan Poudel
!cmd   : clear; gfortran arrayToProcedure2.f90 && ./a.out
!note  : to write subroutines that can be used for 
!        arrays of any size, we can rewrite it using 
!        the following technique:

program arrayToProcedure      
implicit  none    

   integer, dimension (6)   :: myArray  
   integer                  :: i
   
   !!!!!!!!!!!!!!!!!!!!!!!!!
   interface 
      subroutine fillArray (a)
         integer, dimension(:), intent (out) :: a 
         integer :: i         
      end subroutine fillArray      

      subroutine printArray (a)
         integer, dimension(:) :: a 
         integer :: i         
      end subroutine printArray   
   end interface
   !!!!!!!!!!!End of interface
   
   call fillArray (myArray)      
   call printArray(myArray)
   
end program arrayToProcedure
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!End of Main Program

subroutine fillArray (a)      
implicit none      
   integer,dimension (:), intent (out) :: a      
   
   ! local variables     
   integer :: i, arraySize  
   arraySize = size(a)
   
   do i = 1, arraySize         
      a(i) = i      
   end do  
   
end subroutine fillArray
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!End of subroutine fillArray

subroutine printArray(a)
implicit none

   integer,dimension (:) :: a  
   integer::i, arraySize
   arraySize = size(a)
   
   do i = 1, arraySize
     Print *, a(i)
   end do
   
end subroutine printArray
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!End of subroutine printArray
