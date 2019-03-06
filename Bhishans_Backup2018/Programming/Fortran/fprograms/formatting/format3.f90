
!Author: Bhishan Poudel
!Program: File input output
!cmd    : clear; gfortran format3.f90 && ./a.out



program myformat
        implicit none
        !demonstrates use of the format statement
        integer, parameter              :: ikind=selected_real_kind(p=15)
        real , dimension(4)             :: x
        integer, dimension(4)           :: nums ! array of 4 integers
        integer                         :: i
        real(kind=ikind),dimension(4)   :: computed
        
        !fill up the arrays with something
        do i = 1,4
           nums(i)           = i * 10
           computed(i)       = cos(0.1*i)
           x(i)              = computed(i)
        end do
        
        print *,'example 1 : unformatted'
        write(*,*) nums
        write(*,*) 'nums(3)= ', nums(3)
        
        
        print *,'example2: 4 numbers in two rows'
        write(*,100) nums
        100 format(2i10)  !2i10 here 2 means 2 rows
        
        print *, 'example3: 4 numbers in four rows '
              write(*,110) x
        110 format(f6.2)  ! all data are printed in new line
        
        print *, 'example4: 4 numbers in four rows'
        write(*,120)  computed
        120 format(1f20.7)   ! all data in new lines NOT ON SINGLE ROW                
end program myformat
