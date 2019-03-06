!cmd: clear; gfortran -Wall format2lines.f90 && ./a.out

!cmd: clear; f90 format2lines.f90 && ./a.out

program format2lines
implicit none
      
      integer          :: npoint
      integer,parameter:: kwrite = 6
      double precision :: result1,result2,result3,exact
      double precision :: error1,error2,error3



      open(kwrite,file='format2lines.dat',status='Unknown')
      write (kwrite,10000) '#N',  'exact',  'Simpson,eS','Gauss-Legendre,eG','Filon,eG'
      
      do 66 npoint=1,10
      exact   = 0.62415005d0
      result1 = exact *2
      result2 = exact *3
      result3 = exact *4
      error1  = exact *5
      error2  = exact *6
      error3  = exact *7
      
      write(kwrite,20000) npoint,exact,result1,result2,result3,error1,error2,error3
      66 end do
      close(kwrite)
      stop 'data saved in format2lines.dat'
 
      10000 format(A3, 4(A26,3x))      
      20000 format(I3, 4(E26.12,3x), /t33, 3(E26.12,3x)/)
      

end program format2lines
