!Author : Bhishan Poudel
!Program: File input output
!ref    : Chapman 1E page 193
!cmd    : clear; gfortran readReals.f90 && ./a.out

!Program to read an unknown number of values from a
!user-specified input disk file.

PROGRAM read

! Purpose:
! To illustrate how to read an unknown number of values from
! an input data file, detecting both any formatting errors and
! the end of file.
! program will read only the first column of the data set

implicit none

    ! Declare variables
    CHARACTER(len=20) :: filename ! Name of file to open
    INTEGER :: nvals = 0  ! Number of values read in
    INTEGER :: status     ! I/O status can  also be written as ierror
    REAL :: value         ! The real value read in


    !    Get the file name and echo it back to the user.
    !    WRITE (*,*) 'Please enter input file name: '
    !    READ (*,*) filename
    !    WRITE (*,1000) filename
    !    1000 FORMAT (' ','The input file name is: ', A)

    filename = 'read.dat'
    
    
    ! Open the file and check for errors on open.
    ! open unit must be an integer
    OPEN (UNIT=3, FILE=filename, STATUS='OLD',ACTION='READ', &
    IOSTAT=status )
    
    
    openif: IF ( status == 0 ) THEN
        readloop: DO
                      READ (3,*,IOSTAT=status) value ! Get next value
                      IF ( status /= 0 ) EXIT        ! EXIT if not valid
                      
                      nvals = nvals + 1              ! Valid: increase count
                      WRITE (*,1010) nvals, value    ! Echo to screen
                      1010 FORMAT (' ','Line ', i6, ': Value = ',F10.4) 
        END DO readloop


        ! The DO loop has terminated. Was it because of a READ
        ! error or because of the end of the input file?
        readif: IF ( status > 0 ) THEN ! a READ error occurred. Tell user
    
            WRITE (*,1020) nvals + 1
            1020 FORMAT ('An error occurred reading line ', i6)
     
            !if  the end of the data was reached. Tell user.    
            ELSE 
                WRITE (*,1030) nvals
                1030 FORMAT ( 'End of file reached. There were ', i6, ' values in the file.')

        END IF readif
   
   
    ELSE openif
        WRITE (*,1040) status
        1040 FORMAT (' ' ,'Error opening file: IOSTAT = ', i6 )
    END IF openif

    ! Close file
    CLOSE ( UNIT=8 )
    
END PROGRAM


