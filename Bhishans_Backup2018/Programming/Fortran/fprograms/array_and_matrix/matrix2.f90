!Bhishan Poudel
!Oct 16, 2015


!bp: clear; gfortran -Wall hw7qn2.f90 && ./a.out

program hw7qn2
implicit none
 
 !!!!interface
    interface
        subroutine write_matrix(a)
            real(8), dimension(:,:) :: a
        end subroutine write_matrix
    end interface
    !!!End of interface
 
    
    
    
    external potential
    real(8) :: potential
    integer, parameter:: nstep=4, rmin=-10, rmax=10, kwrite=6
    real(8):: h,hinv,x,const2
    real(8):: xk(0:nstep),  vk(0:nstep)
    real(8):: dk(1:nstep-1), ek(1:nstep-1)
    
    
   real(8), dimension(nstep,nstep) :: a 
   integer                 :: i, j
    
    h= dble(rmax)-dble(rmin)
    h = h/dble(nstep)
    hinv = 1.d0 / h
    !write(kwrite,*) h,hinv  ! h= 0.1
    
    
    x=rmin
    do i= 0,nstep
        xk(i) = rmin + dble(i) * h
        vk(i) = potential(xk(i))
        write(kwrite,10000) i,xk(i), vk(i)
        
    end do
    
    
    
    const2= -1.d0/(h*h)
    write(*,*) 'cosnt2=', const2
    
    do i= 1,nstep
        dk(i) = 2.d0 * hinv * hinv + vk(i)  ! dk = (2/ h^2) + Vk
        ek(i) = const2
        write(kwrite,10000) i,dk(i), ek(i)
        
    end do
    
    
    
    
    
    
    do i = 1, nstep      ! iteration i = 1 is first column
      do j = 1, nstep   ! first clm is filled with 1,2,3
      
          if(i.eq.j) then
             a(i, j) = dk(i)
          else 
              a(i,j) = const2
          end if
      end do
   end do
   
   !print *, a(1,1), a(2,2), a(3,3), a(3,4)
   call write_matrix(a)
    
    
    
    
      
    
    
10000 format(i4,2x,2f10.2)    
end program    
        
    
    
    
    
    
    
!*******************************************************************************
! harmonic oscillator potential
real(8) function potential(x)
implicit none
    real(8),intent(in)::x
    
    potential= x*x*0.5d0

end function potential

!*******************************************************************************
subroutine write_matrix(a)

   real(8), dimension(:,:) :: a
   write(*,*)
   
   do i = lbound(a,1), ubound(a,1)
      write(*,10000) (a(i,j), j = lbound(a,2), ubound(a,2))
   end do
10000 format(1000f20.6)   
end subroutine write_matrix



!*******************************************************************************




!*******************************************************************************




!*******************************************************************************
