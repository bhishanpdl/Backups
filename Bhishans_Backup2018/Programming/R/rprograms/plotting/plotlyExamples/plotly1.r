

# install the new/experimental plotly R package
# devtools::install_github("ropensci/plotly@carson-dsl")

# ----------------------------------------------------------------------
# https://plot.ly/r/3d-line-plots/
# ----------------------------------------------------------------------

library(plotly)

# initiate a 100 x 3 matrix filled with zeros
m <- matrix(numeric(300), ncol = 3)

# simulate a 3D random-walk
for (i in 2:100) m[i, ] <- m[i-1, ] + rnorm(3)

# collect everything in a data-frame
df <- setNames(
  data.frame(m, seq(1, 100)), 
  c("x", "y", "z", "time")
)

# create the plotly
plot_ly(df, x = x, y = y, z = z, color = time, type = "scatter3d")