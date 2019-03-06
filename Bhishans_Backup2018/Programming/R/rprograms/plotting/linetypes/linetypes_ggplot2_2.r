#!/usr/bin/Rscript 

# Author : Bhishan Poudel 
# Date   : Apr 10, 2016
# Ref    : http://www.cookbook-r.com/Graphs/Shapes_and_line_types/

# Set the working directory  
this.dir <- dirname(parent.frame(2)$ofile) 
setwd(this.dir)

# Sample data
df <- read.table(header=T, text='
                 cond xval yval
                 A    1  2.0
                 A    2  2.5
                 B    1  3.0
                 B    2  2.0
                 ')

library(ggplot2)

# Plot with standard lines and points
# group = cond tells it which points to connect with lines
g = ggplot(df, aes(x=xval, y=yval, group = cond)) +
  geom_line() +
  geom_point()
print(g)

# Set overall shapes and line type
g = ggplot(df, aes(x=xval, y=yval, group = cond)) +
  geom_line(linetype="dashed",  # Dashed line
            size = 1.5) +       # Thicker line
  geom_point(shape = 0,         # Hollow squares
             size = 4)          # Large points
#print(g)

# Condition shapes and line type on variable cond
ggplot(df, aes(x=xval, y=yval, group = cond)) +
  geom_line(aes(linetype=cond), # Line type depends on cond
            size = 1.5) +       # Thicker line
  geom_point(aes(shape=cond),   # Shape depends on cond
             size = 4)          # Large points


# Same as previous, but also change the specific linetypes and
# shapes that are used
ggplot(df, aes(x=xval, y=yval, group = cond)) +
  geom_line(aes(linetype=cond), # Line type depends on cond
            size = 1.5) +       # Thicker line
  geom_point(aes(shape=cond),   # Shape depends on cond
             size = 4) +        # Large points
  scale_shape_manual(values=c(6,5)) +                  # Change shapes
  scale_linetype_manual(values=c("dotdash", "dotted")) # Change linetypes
library(ggplot2)

# Plot with standard lines and points
# group = cond tells it which points to connect with lines
ggplot(df, aes(x=xval, y=yval, group = cond)) +
  geom_line() +
  geom_point()

# Set overall shapes and line type
ggplot(df, aes(x=xval, y=yval, group = cond)) +
  geom_line(linetype="dashed",  # Dashed line
            size = 1.5) +       # Thicker line
  geom_point(shape = 0,         # Hollow squares
             size = 4)          # Large points

# Condition shapes and line type on variable cond
ggplot(df, aes(x=xval, y=yval, group = cond)) +
  geom_line(aes(linetype=cond), # Line type depends on cond
            size = 1.5) +       # Thicker line
  geom_point(aes(shape=cond),   # Shape depends on cond
             size = 4)          # Large points


# Same as previous, but also change the specific linetypes and
# shapes that are used
g = ggplot(df, aes(x=xval, y=yval, group = cond)) +
  geom_line(aes(linetype=cond), # Line type depends on cond
            size = 1.5) +       # Thicker line
  geom_point(aes(shape=cond),   # Shape depends on cond
             size = 4) +        # Large points
  scale_shape_manual(values=c(6,5)) +                  # Change shapes
  scale_linetype_manual(values=c("dotdash", "dotted")) # Change linetypes

#print(g)

# Hollow shapes
ggplot(df, aes(x=xval, y=yval, group = cond)) +
  geom_line(aes(linetype=cond), # Line type depends on cond
            size = 1.5) +       # Thicker line
  geom_point(aes(shape=cond),   # Shape depends on cond
             size = 4)  +       # Large points
  scale_shape(solid=FALSE)

# Shapes with white fill
ggplot(df, aes(x=xval, y=yval, group = cond)) +
  geom_line(aes(linetype=cond), # Line type depends on cond
            size = 1.5) +       # Thicker line
  geom_point(aes(shape=cond),   # Shape depends on cond
             fill = "white",    # White fill
             size = 4)  +       # Large points
  scale_shape_manual(values=c(21,24))  # Shapes: Filled circle, triangle

################################################################################
## code summary
# par(mar=c(0,0,0,0))
# 
# # Set up the plotting area
# plot(NA, xlim=c(0,1), ylim=c(6.5, -0.5),
#      xaxt="n", yaxt="n",
#      xlab=NA, ylab=NA )
# 
# # Draw the lines
# for (i in 0:6) {
#   points(c(0.25,1), c(i,i), lty=i, lwd=2, type="l")
# }
# # Add labels
# text(0, 0, "0. 'blank'"   ,  adj=c(0,.5))
# text(0, 1, "1. 'solid'"   ,  adj=c(0,.5))
# text(0, 2, "2. 'dashed'"  ,  adj=c(0,.5))
# text(0, 3, "3. 'dotted'"  ,  adj=c(0,.5))
# text(0, 4, "4. 'dotdash'" ,  adj=c(0,.5))
# text(0, 5, "5. 'longdash'",  adj=c(0,.5))
# text(0, 6, "6. 'twodash'" ,  adj=c(0,.5))
################################################################################