! ref : http://faculty.washington.edu/rjl/classes/am583s2013/notes/fortran_modules.html


! $UWHPSC/codes/fortran/circles/initialize.f90

subroutine initialize()

    ! Set the value of pi used elsewhere.
    use circle_mod, only: pi
    pi = acos(-1.d0)

end subroutine initialize

