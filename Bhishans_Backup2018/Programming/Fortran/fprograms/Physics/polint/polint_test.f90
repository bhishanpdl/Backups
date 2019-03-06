!Bhishan Poudel
!Oct 16, 2015 Sat

!bp: clear; gfortran -Wall polint_test.f90 && ./a.out
!bp: clear; gfortran -Wall -I /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/ polint_test.f90 -L gfortran -Wall -I /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/ polint_test.f90 && ./a.out

!bp: clear; f95 polint.f90 polint_test.f90 && ./a.out; rm -f *.o 
  
      program polint_test
      implicit none

      integer :: i, j, datmax, pdeg
      integer :: kwrite,kread
      parameter (datmax=9)    ! number of data in input file
      double precision ::  xin(datmax), yin(datmax)
      double precision ::  x, y, dy
      double precision dummy,xstart,xend,xstep

      data kwrite/7/,kread/5/
      pdeg=3 ! cubic polynomial interpolation


!     output file
      open(kwrite, File = 'polintout.dat', Status = 'Unknown')

!     read intput data      
      open (kread, File = 'crossX2.dat', Status = 'old')

      do i=1,datmax 
      read (kread,10001) xin(i),yin(i),dummy ! here input file has 3 columns so dummy is used
      end do

10001 format (1x,3f10.2)
10002 format (1x,2f10.2,1x,d15.5)


      do j=1,datmax-2,2    ! we have 9 data when j=1: j+2 =3 so 1,2,3 values are used
                           ! when j=7, j+2 = 9 : we will use 7,8,9 indexed values

        xstart = xin(j)    ! when j=1, this is first x value ( when j changes, x values changes)
        xend   = xin(j+2)  ! when j=1, this is third x value
        !xstep  = (xin(2)-xin(1)) / 4.d0
        xstep  = 5.d0

        do x = xstart,xend,xstep

       call polint (xin(j:j+2),yin(j:j+2),pdeg,x,y,dy)  !bp: we are taking 3 points each time

       write (kwrite, 10002) x, y, dy
       !print*, j,x,y,dy
       end do

      end do
      !bp: when j=1, polint was called with xin 1,2,3
      !    when j=2, polint was called with xin 2,3,4

      close (kread)
      close (kwrite)

      Stop 'data saved in output file'
      end program

!             subroutine polint (xa,ya,n,x,y,dy)

!!       given arrays xa and ya, each of length n, and given value of x,
!!       this routine returns a value y, and an error estimate dy.
!!       If P(x) is the polynomial of degree N-1 such that 
!!       P(xa_i)=ya_i, i=1,...,n, then the returned value is y=P(x).
!!

