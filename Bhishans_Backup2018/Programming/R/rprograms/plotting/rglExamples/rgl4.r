#!/usr/bin/Rscript

#Bhishan Poudel
# Jan 20, 2016

library("rgl")

# Make a scatter plot
rgl_init()

data(iris)
print(head(iris))

rgl.spheres(x, y, z, r = 0.2, color = "yellow")  
# Add bounding box decoration
rgl.bbox(color=c("#333377","black"), emission="#333377",
         specular="#3333FF", shininess=5, alpha=0.8 ) 