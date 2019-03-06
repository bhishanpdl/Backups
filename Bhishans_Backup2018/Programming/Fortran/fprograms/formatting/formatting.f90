!cmd: clear; gfortran -Wall formatting.f90 && ./a.out > formatting.dat

!cmd: clear; f90 formatting.f90 && ./a.out > formatting.dat

program formatting
implicit none
      
      integer          :: npoint
      integer,parameter:: kwrite = 6
      double precision :: result1,result2,result3,exact
      double precision :: error1,error2,error3

      write (kwrite,10000) '#N',  'exact',  'Simpson','Gauss-Legendre','Filon',   'eS',      'eG',        'eF'
      
      do 66 npoint=860,870
      exact   = 0.62415005d0
      result1 = exact *2
      result2 = exact *3
      result3 = exact *4
      error1  = exact *5
      error2  = exact *6
      error3  = exact *7
      
      write(kwrite,20000) npoint,exact,result1,result2,result3,error1,error2,error3
      66 end do
      
      write(kwrite,*)
      write (kwrite,10000) '#N',  'exact',  'Simpson','Gauss-Legendre','Filon',   'eS',      'eG',        'eF'
 
      
      10000 format(T1,A4,2x, 7(A13,3x)) ! NOTE: 'string length' should be less than 14 here.
      20000 format(T1,I4,2x, 7(E13.7,3x))
      
      !10000 format(        T1,A4,  T6,A6,    T19,A10,   T35,A16,         T51,A10,   T72,A4,    T90,A4,   T104,A4)


end program formatting
