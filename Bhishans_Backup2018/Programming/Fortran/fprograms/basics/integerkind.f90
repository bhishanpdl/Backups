!Author: Bhishan Poudel
! cmd  : clear; gfortran integerkind.f90 && ./a.out

program testingInt
implicit none

    !kinds are 2,4,8,16 bytes
    integer(kind=2):: shortval
    integer(kind=4):: longval
    
    print*, huge(shortval) ! 32767
    print*, huge(longval)  ! 2147483647
    
end program testingInt
