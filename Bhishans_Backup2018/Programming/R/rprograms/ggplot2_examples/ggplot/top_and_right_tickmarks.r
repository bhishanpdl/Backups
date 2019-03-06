#!/usr/bin/Rscript 
# Author : Bhishan Poudel 
# Date   : Apr 17, 2016
# Program:
# Ref    : https://stackoverflow.com/questions/28949001/mirroring-axis-ticks-in-ggplot2/29023682#29023682

# Set the working directory  
this.dir <- dirname(parent.frame(2)$ofile) 
setwd(this.dir) 

# Libraries  
library(ggplot2)
library(gtable)

# Get a plot
p = ggplot(data.frame(x = 1:10, y = 1:10), aes(x,y)) + 
  geom_point() +
  theme_bw() +
  theme(panel.grid = element_blank(),
        axis.ticks.length=unit(-0.25, "cm"), 
        axis.ticks.margin=unit(0.5, "cm"))

# Convert the plot to a grob
gt <- ggplotGrob(p)

# Get the position of the panel in the layout
panel <-c(subset(gt$layout, name=="panel", se=t:r))

## For the bottom axis
# Get the row number of the bottom axis in the layout
rn <- which(gt$layout$name == "axis-b")

# Extract the axis (tick marks only)
axis.grob <- gt$grobs[[rn]]
axisb <- axis.grob$children[[2]]  # Two children - get the second
axisb  # Note: two grobs - tick marks and text

# Get the tick marks
xaxis = axisb$grobs[[1]]  # NOTE: tick marks first
xaxis$y = xaxis$y - unit(0.25, "cm")  # Position them inside the panel

# Add a new row to gt, and insert the revised xaxis grob into the new row.
gt <- gtable_add_rows(gt, unit(0, "lines"), panel$t-1)
gt <- gtable_add_grob(gt, xaxis, l = panel$l, t = panel$t, r = panel$r, name = "ticks")

## Repeat for the left axis
# Get the row number of the left axis in the layout
panel <-c(subset(gt$layout, name=="panel", se=t:r))
rn <- which(gt$layout$name == "axis-l")

# Extract the axis (tick marks and axis text)
axis.grob <- gt$grobs[[rn]]
axisl <- axis.grob$children[[2]]  # Two children - get the second
axisl  # Note: two grobs -  text and tick marks

# Get the tick marks
yaxis = axisl$grobs[[2]] # NOTE: tick marks second
yaxis$x = yaxis$x - unit(0.25, "cm") # Position them inside the panel

# Add a new column to gt, and insert the revised yaxis grob into the new column.
gt <- gtable_add_cols(gt, unit(0, "lines"), panel$r)
gt <- gtable_add_grob(gt, yaxis, t = panel$t, l = panel$r+1, name = "ticks")

# Turn clipping off
gt$layout[gt$layout$name == "ticks", ]$clip = "off"

# Draw it
grid.draw(gt)