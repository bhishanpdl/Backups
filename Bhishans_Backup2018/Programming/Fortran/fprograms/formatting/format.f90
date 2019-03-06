!Author: Bhishan Poudel
!cmd   : clear; gfortran format.f90 && ./a.out
!note  : This example demonstrates the use of the trim function
!NOTE  : Look at end of this program
PROGRAM table
IMPLICIT NONE

INTEGER  :: i
INTEGER :: square,cube
REAL     :: square_root



print*, '123456789012345678901234567890123456789'

! Print the column headings after skipping one line.
WRITE (*,110)
110 FORMAT (T4,'Number',T13,'Square Root',T29,'Square',T39,'Cube')
! T4 means the letter N of Number is at clm 4
! T13 means the letter S is at clm 13
! CHARACTERS are LEFT  adjusted
! FLOATS     are RIGHT adjusted



WRITE (*,120)
120 FORMAT (1X,T4, '======' ,T13, '===========' ,T29, '======' ,T39, '====' /)
! the last slash / means one line escape


! Generate the required values, and print them out.
DO i=1, 10
    square_root = SQRT ( REAL( i))
    square= i**2
    cube = i**3

    WRITE (*,130) i, square_root, square, cube
     130 FORMAT (1X, T4, I2, T13, F6.4, T27, I6, T37, I6 )
     !item               int      sqrt     sq     cube
     ! T4 means 4th column is I2
     ! i2 means i should be less than 99, otherwise * is shown
     ! f4.2/1 means last digit of sqrt is at clm 16 = 14+4-2
     ! f5.3/2/1 means last digit of sqrt is at clm 17 = 14+5-2
     ! f6.4/3/2/1 means last digit of sqrt is at clm 18 =14+6-2
                    

END DO
print*, '123456789012345678901234567890123456789'
END PROGRAM table




! Format descriptor   Usage
! Aw                  Character data.
! Ew.d                Real data in exponential notation.
! ESw.d               Real data in scientific notation.
! Fw.d                Real data in decimal notation.
! Iw.m                Integer data.
! Lw                  Logical data.
! Tc                  Tab: move to column c of current line.
! nX                  Horizontal spacing: skip n spaces.
! /                   Vertical spacing: move down one line.

!where:

! c                   column number
! d                   number of digits to right of decimal place     
! m                   minimum number of digits to be displayed
! n                   number of spaces to skip
! w                   field width in characters
