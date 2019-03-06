!cmd: clear; gfortran tableFormatting.f90 && ./a.out
!cmd: clear; f90 tableFormatting.f90 && ./a.out &

! this program calculates forward,central,and extrapolated differentiation of given functions


      program tableFormatting

!        calculate forward, central, and extrapolated differentiation
!        of a given function

      implicit none
      
      real,parameter    :: x = 0.1d0  ! **** CHANGE value of x and filename
      real,parameter    :: tol = 1d-7  ! tolerance
      real              :: fcos,fexp,fsq, h, hd2, hd4
      real              :: result(9)
      !integer :: kread = 5, kwrite=6
      
      
      !!!!!!!!!!!!for cosine x !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

      open(1000, File = 'cos01.dat', Status = 'Unknown')  ! **** CHANGE
      
      h = 50.d0       ! h can not be made parameter since h = h*0.1 is changing

      hd2 = h*0.5d0  ! h/2
      hd4 = h*0.25d0 ! h/4
      
      write(1000,1000) "#h", "forward_diff",  "rel_error", & 
                         &   " central_diff", "rel_error", &
                         &   "extrapol_diff", "rel_error"
      
      do while (h.gt.tol)
     

      result(1) = (fcos(x+h) - fcos(x))/h
      result(2) = (fcos(x+hd2) - fcos(x-hd2))/h
      result(3) = (8.d0 *(fcos(x+hd4)-fcos(x-hd4)) - &
                   &     (fcos(x+hd2)-fcos(x-hd2)))/(3.d0*h)

      ! relative error    = |(true - observed) / true |
      ! here, d/dx (cosx) = -sinx
      
      write (1000,1001) h, result(1), abs((result(1)+sin(x))/(sin(x))), &
                        &  result(2), abs((result(2)+sin(x))/(sin(x))), &
	                    &  result(3), abs((result(3)+sin(x))/(sin(x)))
	
      h = h*0.1d0 ! decreasing value of step size h
      
      end do
      
      
      1000 format (7A16)
      1001 format(7E16.6)
      ! E12.6 means : total width 12, after decimal 6 numbers, good for +ve and less than power 99
      ! E16.6 menas : total width 16, 4 spaces left at left side
      
      

      close(1000)

      
      

      
      end program tableFormatting
!--------------------------------------------------------------------------

!      double precision function fcos(x)
      real function fcos(x)

      implicit none

!      double precision ::  x
      real ::  x

      fcos = cos(x)

      return
      end
