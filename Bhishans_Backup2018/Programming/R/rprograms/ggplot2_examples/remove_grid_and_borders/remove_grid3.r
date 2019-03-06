#!/usr/bin/Rscript 
# Author : Bhishan Poudel 
# Date   : 
# Program: 
# Ref    : http://stackoverflow.com/questions/10861773/remove-grid-background-color-and-top-and-right-borders-from-ggplot2

# Set working directory
this.dir <- dirname(parent.frame(2)$ofile) # frame(3) also works.
setwd(this.dir)

# Libraries  
library(ggplot2)


# An alternative to theme_classic() is the theme that comes with the 
# cowplot package, theme_cowplot() (loaded automatically with the package). 
# It looks similar to theme_classic(), with a few subtle differences. 
# Most importantly, the default label sizes are larger, so the resulting 
# figures can be used in publications without further modifications needed 
# (in particular if you save them with save_plot() instead of ggsave()). 
# Also, the background is transparent, not white, which may be useful 
# if you want to edit the figure in illustrator. Finally, faceted plots look better.
  
library(cowplot)
a <- seq(1,20)
b <- a^0.25
df <- as.data.frame(cbind(a,b))

p <- ggplot(df, aes(x = a, y = b)) + geom_point()
#save_plot('plot.png', p) 
# alternative to ggsave, with default settings that work well with the theme
print(p)