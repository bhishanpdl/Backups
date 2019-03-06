!Topic     : Assign1 Q2
!Programmer: Bhishan Poudel
!cmd       : clear; f90 doLoopAdvanced.f90 && ./a.out

program doLoopAdvanced
implicit none

      integer xx, ii
      double precision countmin,countmax,step,yy,jj,error,diff
      
      

      do ii=-4,4,1  ! eg ii = -4
      
          if(mod(ii,3) ==0) then         !eg. 3.00     
              countmin = real(ii) - 0.1  !eg. 2.90
              countmax = real(ii) + 0.1  !eg. 3.01
              step     = 0.01
              yy        = 0.0
              error    = 0.001
            
              do jj = countmin,countmax,step ! eg. jj = 2.90
          
                  yy = jj + step ! 2.90+0.01 = 2.91
                               !note that 3.00 is not exactly 3.00
                  diff = yy - real(ii) 
                  if(abs(diff)>error) then  ! excluding exact multiples of 3
                      write (*,100) yy
                  endif
                
              end do 
      
      
          else   !eg. -4 -2 -1 1 2 4
              xx = ii
              write (*,110) ii ! -4
          end if

      end do
      
      100 format(f5.2,2x,f5.2)  ! formatting for 1 integer and 9 float points
      110 format(i5,i5)  ! formatting for 1 integer and 9 float points
     
      
   
end program doLoopAdvanced
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


