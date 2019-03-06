!ref: http://web.stanford.edu/class/me200c/tutorial_77/14_data.html

!ref: http://h21007.www2.hp.com/portal/download/files/unprot/fortran/docs/lrm/lrm0095.html
 

!cmd: clear; gfortran dataStatement.f95 && ./a.out
!syntax: data list-of-variables/ list-of-values/, ...

program dataStatement
implicit none
  integer:: m,n
  real:: x,y
  
  data m,n/10,20/, x,y/2*2.5/
  !data m/10/, n/20/, x/2.5/, y/2.5/
  !      m = 10
  !      n = 20
  !      x = 2.5
  !      y = 2.5
  !  
  
  print*, m
  
  !example2
      integer v(5)
      real B(2,2)
      data v/10,20,30,40,50/, B/1.0,-3.7,4.3,0.0/
      
      
  
      

  
end program
