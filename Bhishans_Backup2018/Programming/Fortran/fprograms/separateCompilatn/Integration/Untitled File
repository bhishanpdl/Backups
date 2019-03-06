!cmd: clear; f90 main.f90 && ./a.out

include 'function_x.f90'
include 'trapezoid.f90'
include 'simpson.f90'
include 'gauss.f90'


      program main
      implicit none

      external func         ! we are using function called func
      double precision  :: func ! to include function we need three things: include,external,type define
      double precision  :: simpsonint,gaussint8,gaussint16 
      
      double precision    :: a,b  ! inputs
      integer :: n    ! input
                                               
      double precision    :: sum
      integer :: kread, kwrite
      data kread/5/, kwrite/6/
      
      


      a = 0.d0
      b = 3.d0
      n = 60
      
      write(kwrite,*) 'func=', func(5.d0) ! trial for function func

!        call the trapezoid  subroutine

      call trapezoid (a,b,n,func,sum)
      call simpson   (func,a,b,simpsonint,n)
      call gauss8(func,a,b,gaussint8)
      call gauss16(func,a,b,gaussint16)
      
      write(kwrite,10000) 'simpson_Trapezoid      =', sum
      write(kwrite,10000) 'simpson_Simpson        =', simpsonint
      write(kwrite,10000) 'simpson_Gauss_8points  =', gaussint8
      write(kwrite,10000) 'simpson_Gauss_16points =', gaussint16
      
      10000 format (A30,F14.6)
          
      
      stop 
      end program main 

      
      
      
