#!/usr/bin/Rscript 

# Author : Bhishan Poudel 
# Date   : Apr 10, 2016
# Program: ggplot shading
# Ref    : https://learnr.wordpress.com/2009/10/22/ggplot2-two-color-xy-area-combo-chart/

# Set the working directory  
this.dir <- dirname(parent.frame(2)$ofile) 
setwd(this.dir)  

library(ggplot2)

cross <- data.frame(x1 = c(2, 3.27, 6.26, 7.58,
                           8.33, 9.79, 11.2, 13.86), y1 = c(13, 14,
                                                            15, 42, 10, 41, 23, 20), y2 = c(37, 18,
                                                                                            19, 28, 14, 21, 29, 25))

p1 = ggplot(cross, aes(x1, ymin = y1, ymax = y2)) +
    geom_ribbon()

print(p1)

################################################################################
# example 2
# In order to change the fill colour at each point where two lines cross, 
# the points of intersection need to be calculated.

cross$slope1 <- c(NA, with(cross, diff(y1)/diff(x1)))
cross$slope2 <- c(NA, with(cross, diff(y2)/diff(x1)))
cross$intcpt1 <- with(cross, y1 - slope1 * x1)
cross$intcpt2 <- with(cross, y2 - slope2 * x1)
cross$x2 <- with(cross, (intcpt1 - intcpt2)/(slope2 - slope1))
cross$y3 <- with(cross, slope1 * x2 + intcpt1)
cross <- cross[, c(-4:-7)]

# Now, just as an extra precaution and to make sure that calculations are correct,
# we check visually the location of the points of intersection:
#   
p2 =  ggplot(cross) + geom_line(aes(x1, y1), colour = "red") +
  geom_line(aes(x1, y2), colour = "darkblue") +
  geom_point(aes(x2, y3), colour = "lightgreen", size = 4)

print(p2)
################################################################################
# As I am planning to colour the plot above generated using geom_ribbon the 
# points of intersection need also to be presented in the form expected by 
# geom_ribbon (x, ymin, ymax) – a simple copy of y3 accomplishes this.

cross$y4 <- cross$y3

# Additional error-checking is also obviously needed, as is indicated by 
# the position of the left and rightmost green dots on the above graph – 
# any two lines can have a point of intersection which falls outside the 
# limits of the particular plot.

cross[which(cross$x2 > cross$x1), c("x2", "y3",
                                      "y4")] <- NA
cross$segment <- findInterval(cross$x1, c(cross$x2[which(!is.na(cross$x2))]))

# For ggplot2 to be able to vary the fill colour at each crossing of the lines 
# it needs to know the start and end point of each coloured area. 
# This means that the middle points of intersection need to be duplicated, 
# as they would be part of two adjacent areas filled with different colours.

cross$x3 <- c(tail(cross$x2, -1), NA)
cross$y5 <- c(tail(cross$y3, -1), NA)
cross$y6 <- cross$y5

# Now the coordinates of two lines and the start/end points of coloured areas 
# need to be combined into one dataframe in a long format.

cross1 <- cross[, c(1:3, 7)]
cross2 <- cross[!is.na(cross$x2), c(4:6, 7)]
cross3 <- cross[!is.na(cross$x3), c(8:10, 7)]

names(cross2) <- names(cross1)
names(cross3) <- names(cross1)

combo <- rbind(cross1, cross2)
combo <- rbind(combo, cross3)
combo <- combo[is.finite(combo$y1), ]
combo <- combo[order(combo$x1), ]

p2 = ggplot(combo, aes(x1, ymin = y1, ymax = y2)) +
  geom_ribbon(aes(fill = factor(segment)))

print(p2)
################################################################################
# Each segment is filled with a different colour, but we want to limit the number 
# of fill colours to two.

p3 =  ggplot(combo, aes(x1, ymin = y1, ymax = y2 )) 
    + geom_ribbon(aes(fill = factor(segment%%2))) +
    geom_path(aes(y = y1), colour = "red",
            size = 1) + geom_path(aes(y = y2),
                                  colour = "darkblue", size = 1) + opts(legend.position = "none")

print(p3)
################################################################################

