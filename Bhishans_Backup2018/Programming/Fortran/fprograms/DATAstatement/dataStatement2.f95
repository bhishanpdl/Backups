

DIMENSION A(10,10)

DATA A/100*1.0/    ! initialization by name

DATA A(1,1), A(10,1), A(3,3) /2*2.5, 2.0/ ! initialization by element

DATA ((A(I,J), I=1,5,2), J=1,5) /15*1.0/  ! initialization by implied-do list


TYPE EMPLOYEE
  INTEGER ID
  CHARACTER(LEN=40) NAME
END TYPE EMPLOYEE
TYPE(EMPLOYEE) MAN_NAME, CON_NAME
DATA MAN_NAME / EMPLOYEE(417, 'Henry Adams') /
DATA CON_NAME%ID, CON_NAME%NAME /891, "David James"/


INTEGER A(10), B(10)
CHARACTER BELL, TAB, LF, FF, STARS*6
DATA A,STARS /10*0,'****'/
DATA BELL,TAB,LF,FF /7,9,10,12/
DATA (B(I), I=1,10,2) /5*1/




