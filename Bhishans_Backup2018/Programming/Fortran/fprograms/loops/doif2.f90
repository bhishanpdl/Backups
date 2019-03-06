!cmd : clear; gfortran -Wall doif2.f90 && ./a.out
!cmd : clear; f90 doif2.f90 && ./a.out
!cmd : clear; f90 doif2.f90 && ./a.out > doif2output.dat

program doif2
implicit none

    double precision           :: x,y,z
    double precision,parameter :: tolerance = 1d-2 
    integer,parameter          :: kread=5, kwrite=6
    integer                    :: i 
        
        
        write(kwrite,10000)    "#x", &
                        &  "y" 
        x = 10 ! initialize both x and y (first terms of loop)
        y = 20
        do i=1,4
      
          if(x>tolerance) then
              write (kwrite,10001) x,y  ! if we write this line below x,y first terms will not be 10 and 20
              x = x*0.1
              y = x*2.d0
          end if

      end do
      10000 format(2A14)
      10001 format(2F14.2)
      !10001 format(2ES14.2)
    
end program doif2
