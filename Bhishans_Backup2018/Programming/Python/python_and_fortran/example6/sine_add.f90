! Author   : Bhishan Poudel
! Date     : Oct-14-2016 Fri
!
! depends  : none
! outputs  : sine_add.so
! usage    : from sine_add import sine_add1
! compile  :
! f2py -m sine_add -h sine_add.pyf sine_add.f90 --overwrite-signature && f2py -c sine_add.pyf sine_add.f90 && rm sine_add.pyf

! using function
real*8 function sine_add1(r1, r2)
    real*8 r1, r2
    sine_add1 = sin(r1 + r2)
return
end

! using subroutine
subroutine sine_add2(r1, r2)
    real*8 r1, r2, s
    s = sin(r1 + r2)
    write(*,100) 'Hello, World! sin(',r1+r2,')=',s
    100 format(A,F6.3,A,F8.6)
return
end

