!Author: Bhishan Poudel
!cmd   : clear; gfortran division.f95 && ./a.out

program division
implicit none
    
    !define real variables
    real    :: p,q,realRes    
    integer :: i,j,intRes
    character(len=40) :: name
    real, parameter :: g = 9.81
    
    print*, "g =", g        !  g =   9.81000042
    name = "Bhishan Poudel"
    print*, name            ! Bhishan Poudel
    
    
    p = 2.0
    q = 3.0
    i = 2
    j = 3
    
    realRes = p/q
    intRes  = i/j
    
    print*, "real division is: ", realRes ! 0.666666687
    print*, "integer division is:", intres! 0
end program division
    
    
