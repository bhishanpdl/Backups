!Topic     : Assign1 Q2
!Programmer: Bhishan Poudel
!cmd       : clear; gfortran -o arctan2 arctan2.f90 && ./arctan2

program qn2
implicit none
  double precision arctana, arctanb,arctan2a, arctan2b
  real  x,y
  
  y=2
  x=3

  arctana =atan(y/x)
  arctan2a=atan2(y,x)
  arctan2b=atan2(-y,-x)
  
  print*, arctana
  print*, arctan2a
  print*, arctan2b
  
  
      end program qn2

