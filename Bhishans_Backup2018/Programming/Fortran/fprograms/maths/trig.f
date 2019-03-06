
! cmd: gfortran trig.f && ./a.out
! cmd: f90 trig.f && ./a.out
      program trig

C    Program to Calculate SIN and COS of ANGLE
C    Given in Degrees
c
C    angdeg - angle in degrees  (INPUT)
*    angrad - angle in radians
c    pi     -  3.14159....
c    sinang - sin ( angrad )  OUTPUT
c    cosang - cos ( angrad )  OUTPUT
 
      implicit none
      real angrad, angdeg, pi, sinang, cosang
      print *, 'Angle in Degrees?'
      read *, angdeg
c
c       Convert the Angle to Radians

          pi=asin(1.0)*2.0

          angrad=angdeg*pi/180.0
c
c       Calculate Trig Functions

      sinang=sin(angrad)

      cosang=cos(angrad)

      print *, 'ANGLE =',angdeg,' degrees =',angrad,' radians'
      print *, 'SIN(ANGLE) = ', sinang
      print *, 'COS(ANGLE) = ', cosang

      stop
      end
      
      
