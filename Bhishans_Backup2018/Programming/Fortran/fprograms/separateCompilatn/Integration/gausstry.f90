  function gaussquad(n) result(r)
  integer                 :: n
  real(kind=p)            :: pi
  real(kind=p)            :: r(2, n), x, f, df, dx
  integer                 :: i,  iter
  real(kind = p), allocatable :: p0(:), p1(:), tmp(:)
 
  pi = 4*atan(1._p)
  p0 = [1._p]
  p1 = [1._p, 0._p]
 
  do k = 2, n
     tmp = ((2*k-1)*[p1,0._p]-(k-1)*[0._p, 0._p,p0])/k ! recurrence relation for nPn(x)
     p0 = p1; p1 = tmp
  end do
  do i = 1, n
    x = cos(pi*(i-0.25_p)/(n+0.5_p)) ! x0 value for ith iteration
    do iter = 1, 10
      f = p1(1); df = 0._p
      do k = 2, size(p1)
        df = f + x*df
        f  = p1(k) + x * f
      end do
      dx =  f / df
      x = x - dx
      if (abs(dx)<10*epsilon(dx)) exit
    end do
    r(1,i) = x
    r(2,i) = 2/((1-x**2)*df**2)
  end do
  end function
