program test_dble
              real    :: x = 2.18
              integer :: i = 5
              complex :: z = (2.3,1.14)
              print *, x, i, z
              print *, dble(x), dble(i), dble(z)
              print *, dble(1), dble(1.0)
          end program test_dble
