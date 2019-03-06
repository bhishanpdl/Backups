! ref : https://en.wikibooks.org/wiki/Fortran/Fortran_examples


subroutine swap_real(a1, a2)

   implicit none

!  Input/Output
   real, intent(inout) :: a1(:), a2(:)

!  Locals
   integer :: i
   real :: a

!  Swap
   do i = 1, min(size(a1), size(a2))
      a = a1(i)
      a1(i) = a2(i)
      a2(i) = a
   enddo

end subroutine swap_real

!!!!!! This must be in the main program!!!!!!!!!!!!!!!!!!!!!!
!!   explicit interface to the swap_real subroutine
!    interface							
!        subroutine swap_real(a1, a2)			
!            real, intent(inout) :: a1(:), a2(:)
!        end subroutine swap_real                   
!    end interface
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1

