!programmer: Bhishan Poudel
!date      : sep, 2015
!cmd       : clear; f90 doWhile2.f90 && ./a.out
!cmd       : clear; gfortran doWhile2.f90 && ./a.out


program change 

            integer:: amount, remainder, q, d, n, p
            amount = 47
            remainder = amount
            print*,remainder
            q = 0
            d = 0
            n = 0
            p = 0

            do while (remainder >= 25)
                    remainder = remainder - 25
                    print*,remainder
                    q = q + 1       
            end do
            do while (remainder >= 10)
                    remainder = remainder - 10
                    print*,remainder
                    d = d + 1       
            end do
            do while (remainder >= 5)
                    remainder = remainder - 5
                    print*,remainder
                    n = n + 1       
            end do
            do while (remainder >= 1)
                    remainder = remainder - 1
                    print*,remainder
                    p = p + 1       
            end do 

            print*, "# Quarters:", q
            print*, "# Dimes:", d
            print*, "# Nickels:", n
            print*, "# Pennies:", p

    end program change
