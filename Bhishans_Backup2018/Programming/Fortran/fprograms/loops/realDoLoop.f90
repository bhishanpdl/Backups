!cmd: clear; gfortran realDoLoop.f90 && ./a.out          ! warning only
!cmd: clear; gfortran -Wall realDoLoop.f90 && ./a.out    ! warning only
!cmd: clear; f90 realDoLoop.f90 && ./a.out               ! warning only
!cmd: clear; gfortran -std=f95 realDoLoop.f90 && ./a.out ! DOESNOT work

!Error: Deleted feature: Loop variable at (1) must be integer

program real_step
implicit none
  
  real :: x, x_min, x_max, step
  character(len=50) :: myformat
  integer::i
  x_min = 0.
  x_max = 1.1
  step = 0.1

  do x = x_min, x_max, step
  
    myformat = '(a5,f3.1)'
    write(*,myformat) " x = ", x
  end do
  
  
  
  x = -10. 
 do i=1,201
 
 
 write(6,10000) i,x
 
 x=x+0.1

 end do
 10000 format(i4, f10.2)
  
  
end program real_step
