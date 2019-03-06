! Author   : Bhishan Poudel
! Date     : Oct-14-2016 Fri
! f2py -m hw -h hw.pyf hw.f90 --overwrite-signature
! f2py -c hw.pyf hw.f90

! using function
real*8 function hw1(r1, r2)
    real*8 r1, r2
    hw1 = sin(r1 + r2)
return
end

! using subroutine
subroutine hw2(r1, r2)
    real*8 r1, r2, s
    s = sin(r1 + r2)
    write(*,100) 'Hello, World! sin(',r1+r2,')=',s
    100 format(A,F6.3,A,F8.6)
return
end
