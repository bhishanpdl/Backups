!define the function

    
!double precision function func(x)
!    implicit none
!    double precision,intent(in) :: x
! 
!    func = x*x
!     
!    return  
!    end


real(kind=16) function func(x)
    implicit none
    real(kind=16),intent(in)       :: x
     
     func = exp(x)
     
     return  
     end
