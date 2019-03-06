! Topic : pointers
! cmd   : clear; gfortran pointer.f90 && ./a.out

program pointerExample
implicit none

   integer, pointer :: p1
   integer, target :: t1 
   integer, target :: t2
   
   p1=>t1
   p1 = 1
   
   Print *, p1 ! 1
   Print *, t1 ! 1
   
   p1 = p1 + 4
   Print *, p1 ! 5
   Print *, t1 ! 5
   
   t1 = 8
   Print *, p1 ! 8
   Print *, t1 ! 8
   
   nullify(p1)
   Print *, t1 ! 8
   
   p1=>t2
   Print *, associated(p1) ! T
   Print*, associated(p1, t1) ! F
   Print*, associated(p1, t2) ! T
   
   !what is the value of p1 at present
   Print *, p1 ! some memory value
   Print *, t2 ! some memory value
   
   p1 = 10
   Print *, p1 ! 10
   Print *, t2 ! 10
   
end program pointerExample

