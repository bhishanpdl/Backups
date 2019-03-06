# save plotting parameters
pm   <- par("mfrow")
pmar <- par("mar")

par(mar = c(1, 1, 1, 1))

## =======================================================================
## A three-dimensional shape 
## (ala http://docs.enthought.com/mayavi/mayavi/mlab.html)
## =======================================================================

par(mfrow = c(2, 2))
# create grid matrices
X       <- seq(0, pi, length.out = 50)
Y       <- seq(0, 2*pi, length.out = 50)
M       <- mesh(X, Y)
phi     <- M$x
theta   <- M$y

# x, y and z grids
r <- sin(4*phi)^3 + cos(2*phi)^3 + sin(6*theta)^2 + cos(6*theta)^4
x <- r * sin(phi) * cos(theta)
y <- r * cos(phi)
z <- r * sin(phi) * sin(theta)

# full colored image
surf3D(x, y, z, colvar = y, colkey = FALSE, shade = 0.5,
       box = FALSE, theta = 60)

# same, but just facets
surf3D(x, y, z, colvar = y, colkey = FALSE, box = FALSE, 
       theta = 60, facets = FALSE)

# with colors and border, AND increasing the size
# (by reducing the x- y and z- ranges
surf3D(x, y, z, colvar = y, colkey = FALSE, box = FALSE, 
       theta = 60, border = "black", xlim = range(x)*0.8, 
       ylim = range(y)*0.8, zlim = range(z)*0.8)

# Now with one color and shading
surf3D(x, y, z, box = FALSE,
       theta = 60, col = "lightblue", shade = 0.9)

## Not run:  # rotation
for (angle in seq(0, 360, by = 10))
  plotdev(theta = angle)


## End(Not run)
