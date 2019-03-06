module MyStuff

contains

function c(x,y)
implicit none
real :: c
real :: x, y
c = x*y
return
end

subroutine s(x,y,z)
implicit none
real :: x, y, z

z = c(x,y)
end

end module MyStuff

