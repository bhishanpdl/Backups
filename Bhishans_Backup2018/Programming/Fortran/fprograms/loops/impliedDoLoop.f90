!Author: Bhishan Poudel
!Program: File input output
!note   : if we type 1 2 3 4 we will get row 1 2 and row 3 4 
!cmd    : clear; gfortran impliedDoLoop.f90 && ./a.out

program impliedDoLoop
real :: ra(2,2)
        integer :: row,col
        !use implied do
        do row = 1,2
           do col = 1,2
             read *,        ra(row,col)
           end do
        end do
        do row=1,2
           write(*,10)  (ra(row,col),col=1,2)
        end do
        10  format(10f5.1)  
        
end program impliedDoLoop
