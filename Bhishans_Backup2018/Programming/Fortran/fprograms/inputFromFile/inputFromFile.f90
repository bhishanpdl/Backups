! gfortran -Wall inputFromFile.f90 && ./a.out<input.dat
! f90 inputFromFile.f90 && ./a.out<input.dat

! f90 inputFromFile.f90 && ./a.out<input.dat>output.dat

! this program takes input from a file ( we dont have to type input in keyboard)
! we have also created a input file for this program

program inputFromFile  ! note after typing implicit none, type end program
implicit none
      
            
    double precision           :: x,y,z
    double precision,parameter :: tolerance = 1d-2  ! *** CHANGE
    integer,parameter          :: kread=5, kwrite=6
    integer                    :: i 
    
    !print*, tolerance

!!!!****************************************************************************
    !First, we can create a input file
    open(unit=1000,file='input.dat',status='unknown')
        x = 10  ! NOTE: x must be outside of do while loop  *** CHANGE
        y = 20
        do while (x > tolerance)
            
                write(1000,1000) x,y
                x = x*0.1          ! NOTE: update of must be below write
                y = x*2.d0
        end do
    1000 format (2E14.6)    
    close(unit=1000)
!!!!****************************************************************************


!!!!****************************************************************************
!!!!Reading from the file input.dat

    write(kwrite,2000) "x", "y", &
                      &         "z=x+y"
                      
    do i=1,4   ! there must be AT LEAST 4 rows of data in input.dat  **** CHANGE
        read(kread,*) x,y
        z=x+y
        write(kwrite,2001) x,y,z
        
    end do
    2000 format (3A14)
    2001 format (3E14.6)
      
end program inputFromFile
