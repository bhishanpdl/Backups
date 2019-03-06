!Topic     : Assign1 Q2
!Programmer: Bhishan Poudel
!cmd       : clear; f90 doAdvClear.f90 && ./a.out > a.dat

program a
implicit none

    integer xx, ii
    double precision countmin,countmax,step,yy,jj,error,diff
      
      

      do ii=-16,16,1
      
          if(mod(ii,2) ==0) then              
              countmin = real(ii) - 0.1  
              countmax = real(ii) + 0.1  
              step     = 0.01
              yy        = 0.0
              error    = 0.001
            
              do jj = countmin,countmax,step ! eg. jj = 
          
                  yy = jj + step ! 
                              
                  diff = yy - real(ii) 
                  if(abs(diff)>error) then  ! excluding multiples
                      write (*,100) yy
                  endif
                
              end do 
      
      
          else
              
              write (*,110) ii
          end if

      end do
      
      100 format(f7.2,2x,f7.2)
      110 format(i5,i5)  
     
      
   
end program a

