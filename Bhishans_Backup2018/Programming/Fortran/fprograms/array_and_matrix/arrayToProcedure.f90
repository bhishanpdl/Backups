!Author: Bhishan Poudel
!cmd   : clear; gfortran arrayToProcedure.f90 && ./a.out
!note  : we can pass an array to a procedure as an argument. 
!        The following example demonstrates the concept: here,
!        the subroutine fillArray and printArray can 
!        only be called with arrays with dimension 5

program arrayToProcedure      
implicit none      

   integer, dimension (5) :: myArray  
   integer :: i
   
   call fillArray (myArray)      
   call printArray(myArray)
   
end program arrayToProcedure

!!!!!!!!!!!!!!!!!!!!!!!!!!End of Main Program
subroutine fillArray (a)      
implicit none      

   integer, dimension (5), intent (out) :: a
   
   ! local variables     
   integer :: i     
   do i = 1, 5         
      a(i) = i      
   end do  
   
end subroutine fillArray
!!!!!!!!!!!!!!!!!!!!!!!!!!!! 

!!!!!!!!!!!!!!!!!!!!!!!!!!!!
subroutine printArray(a)

   integer, dimension (5) :: a  
   integer::i
   
   do i = 1, 5
      Print *, a(i)
   end do
   
end subroutine printArray
!!!!!!!!!!!!!!!!!!!!!!!!!!!!
