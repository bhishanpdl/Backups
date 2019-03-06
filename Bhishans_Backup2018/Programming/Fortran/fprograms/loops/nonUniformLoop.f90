!Bhishan Poudel
!Oct 19, 2015

!bp: clear; f95 nonUniformLoop.f90 && ./a.out
 

      program nonUniformLoop
      implicit none

      integer :: i,j
      integer :: v1,v2
      integer :: kread, kwrite
      integer :: a,b
      integer :: aa(3), bb(3)   ! 1d arrays

      data kread/5/, kwrite/6/
      
!     intialize
      aa = (/1, 3,7 /)
      bb = (/100,10000,100000/)

      

      do 10 i = 1,3
      a = aa(i)
      
      do 20 j=1,3
      b = bb(j)
      
      v1 = a*2
      v2 = b*2

      write(kwrite,10000) 'when a= ',a, 'and b= ',b, 'value1=',v1,'value2=',v2

      
      20 end do
      write(kwrite,*)
      10 end do 
      
      10000 format(4(a8,i6))
      stop 
      end

