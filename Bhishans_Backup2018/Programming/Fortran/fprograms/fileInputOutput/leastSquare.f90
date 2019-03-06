!Author : Bhishan Poudel
!Program: File input output
!ref    : Chapman 1E page 201
!cmd    : clear; gfortran leastSquare.f90 && ./a.out

PROGRAM least_squares_fit
! Purpose:
! To perform a least-squares fit of an input data set
! to a straight line and then print out the resulting slope
! and intercept values. The input data for this fit
! comes from a user-specified input data file

implicit none

    ! List of parameters:
    INTEGER, PARAMETER :: lu = 18 ! I/o unit for disk I/O
    
    ! List of variables. Note that cumulative variables are all
    ! initialized to zero.
    
    CHARACTER(LEN=24):: filename !Input file name (<= 24 chars)
    INTEGER :: ierror            !Status flag from I/O statements
    INTEGER :: n = 0     !Number of input data pairs (x,y)
    REAL :: slope        !Slope of the line
    REAL :: sum_x = 0.   !Sum of all input X values
    REAL :: sum_x2 = 0.  !Sum of all input X values squared
    REAL :: sum_xy = 0.  !Sum of all input X*Y values
    REAL :: sum_y = 0.   !Sum of all input Y values
    REAL :: x            !An input X value
    REAL :: x_bar        !Average X value
    REAL :: y            !An input Y value
    REAL :: y_bar        !Average Y value        
    REAL :: y_int        !Y-axis intercept of the line
    

!    ! Prompt user and get the name of the input file.
!    WRITE (*,1000)
!    1000 FORMAT (IX,'This program performs a least-squares fit of an ',/, &
!                 IX,'input data set to a straight line. Enter the name',/ &
!                 IX,'of the file containing the input (x,y) pairs: '
!                 )
!                 
!    READ (*,'(A)') filename

    filename = 'input1.dat'
    
    ! Open the input file
    OPEN (UNIT=lu, FILE=filename, STATUS='OLD', ACTION='READ',&
          IOSTAT=ierror )
          
    ! Check to see if the OPEN failed,
    errorcheck: IF ( ierror > 0 ) THEN
        WRITE (*,1020) filename
        1020 FORMAT (1X,'ERROR: File ' ,A, 'does not exist!')
    ELSE
    
    ! File opened successfully. Read the (x,y) pairs from
    ! the input file.
        DO
            READ (lu,*,IOSTAT=ierror) x, y ! Get pair
            IF ( ierror /= 0 ) EXIT

            n      = n + 1
            sum_x  = sum_x + x
            sum_y  = sum_y + y
            sum_x2 = sum_x2 + x**2
            sum_xy = sum_xy + x
        END DO
        
    ! Now calculate the slope and intercept.
    x_bar = sum_x / real(n)
    y_bar = sum_y / real(n)
    slope = (sum_xy - sum_x * y_bar) / ( sum_x2 - sum_x * x_bar)
    y_int = y_bar - slope * x_bar
    
    ! Tell user.
    WRITE (*, 1030 ) slope, y_int, n
    1030 FORMAT ('Regression coefficients for the least-squares line :', &
    /,1X,    ' slope (m) = '     , F12.3 &
    /,1X,    ' Intercept (b) = ' , F12.3, &
    /,1X,    ' No of points = '  , I12 )
    
    
    ! Close input file, and quit.
    CLOSE (UNIT=lu)
    END IF errorcheck
END PROGRAM
