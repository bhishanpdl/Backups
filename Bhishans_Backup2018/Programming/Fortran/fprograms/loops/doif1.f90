!Topic     : Assign1 Q2
!Programmer: Bhishan Poudel
!cmd       : clear; f90 doif1.f90 && ./a.out

program ifDoLoop
implicit none

      integer x, i
      double precision countmin,countmax,step,y,j
      
      

      do i=-4,4,1
      
          if(mod(i,3) /=0) then
              x = i
              write (*,100) i,x
          end if

      end do
      100 format(2i5) 
     
      
   
end program ifDoLoop
!Required output:

!                                -3.10
!                                -3.02
!-4      -3.1 = counter - 0.1    -3.01
!-3      -3.0 = counter         *******  
!-2      -2.9 = counter +0.1     -2.99
!-1                              -2.98
!0                               -2.97
!1                               -2.90
!2
!3
!4


