!Saroj Dhakal
!July 3, 2015


!  This program is to to find eigen values and eigen vector of real non-symmetric matrix. Using this we try to find eigen-vaues of simple shell model.
      
      program eigenvalue
  
      implicit none 
     
      integer :: kwrite=6,kwrite1=7,kread=5,kwrite2=8
      integer :: i,j,k,n
      double precision :: del_e(4),e(1000),temp
!quantities for input file      
      character(20) :: car 
      integer :: nn,ndim
      parameter (ndim=3)
      double precision :: a(ndim,ndim),d,ini_g,max_g,del_g,g      
      
!quantities used by lapack subroutine dgeev     
      character:: jobvl='N',jobvr='V' 
      double precision :: wr(ndim),wi(ndim),vl(ndim,ndim), &
                             vr(ndim,ndim),work(4*ndim)
      integer :: info,lwork=4*ndim
      

!open input file
      open (kread, File='data.dat', status='old',form='formatted', &
            action='read' )
      
       
         read(5,*)car,nn
         read(5,*)car,d
         read(5,*)car,ini_g
         read(5,*)car,max_g
         read(5,*)car,del_g
       
        
        
!open a separate data file to plot the values.    
      open(kwrite1,File='shellmodeldata3.out',form = 'formatted', &
           status = 'unknown')
          write(kwrite1,*)'#      d       g     g/d      GS        FS  &
                           &  SS'

!open file to print the output.
       open(kwrite,File='shellmodel3.out',form = 'formatted', &
             status = 'unknown')
 
 !open file to print the energy difference.
       open(kwrite2,File='shellmodeldiff3.out',form = 'formatted', &
             status = 'unknown')            

!Computing matrix element        
         do g =ini_g,max_g,del_g

           do i=1,nn

           do j=1,nn
              if(i.eq.j)then
                 a(i,j)=2*i*d-g
              else
                a(i,j)=-g
              end if 
         end do
        end do 

        write(kwrite,*)'d:',d
        write(kwrite,*)'g:',g
        write(kwrite,*)'ratio:',g/d
        write(kwrite,*)
        write(kwrite,*)'Hamiltonian H'
        do i=1,nn
          write(kwrite,10000)(a(i,j),j=1,nn)
        end do
       write(*,*)
       
!call for inverse subroutine dminv
       call dgeev(jobvl,jobvr,nn,a,nn,wr,wi,vl,nn,vr,nn,work,lwork,info)
     
!check sucessfull exit 
        if(info.ne.0) then
         write(kwrite,*)'info=',info
        end if  
 


!finding out the eigenvalue, related to p=1,2,3
      do i=1,nn
         do j=1,nn
          if(wr(i).lt.wr(j)) then
            temp = wr(i)
            wr(i)=wr(j)
            wr(j)= temp
            end if 
         end do 
      end do


 
!Printing Eigen Values
      write(kwrite,*)''
      write(kwrite,*)'Real Eigen values wr:'
      write(kwrite,10000)(wr(j), j=1,nn)
      write(kwrite,*)'Imaginary Eigen values wi:'
      write(kwrite,10000)(wi(j),j=1,nn)
      write(kwrite,*)''

         
!Printing Right Eigen Vectors
        write(kwrite,*)
        write(kwrite,*)'Right Eigen Vector:'
         do i=1,nn
            write(kwrite,10000)(vr(i,j), j=1,nn)
         end do
         write(kwrite,*)
         write(kwrite,*)'********************************************'
         
           

  
       write(kwrite1,10001)d,g,g/d,(wr(i),i=1,nn)    
       write(kwrite2,10002)g/d,wr(2)-wr(1),wr(3)-wr(1),wr(3)-wr(2)
      
      
      end do
      close(kwrite2)
      close(kwrite)
      close(kwrite1)
10000 format(1x,3(f8.3))
10001 format (1x,3(xf8.3),3(xf8.3))     
10002 format (1x,f8.3,3(f10.3))
       
      end program eigenvalue
      

