  #!/usr/bin/env Rscript
  
  # Author  : Bhishan Poudel
  # Date    : Jan 8, 2016
  # Program : 
  
  # setting working directory
  this.dir <- dirname(parent.frame(2)$ofile)
  setwd(this.dir)
  
  # Start device driver to save output
  #postscript(file="figures/plot1.eps")
  
  # Define 2 vectors
  cars <- c(1, 3, 6, 4, 9)
  trucks <- c(2, 5, 4, 5, 12)
  
  # Calculate range from 0 to max value of cars and trucks
  g_range <- range(0, cars, trucks)
  
  # Graph autos using y axis that ranges from 0 to max 
  # value in cars or trucks vector.  Turn off axes and 
  # annotations (axis labels) so we can specify them ourself
  plot(cars, 
       type="o", 
       col="blue", 
       ylim=g_range, 
       axes=FALSE, 
       ann=FALSE)
  
  # Add minor tick marks
  library(Hmisc)
  minor.tick(nx=1, ny=2)
  
  # Make x axis using Mon-Fri labels
  axis(1, at=1:5, lab=c("Mon","Tue","Wed","Thu","Fri"))
  
  # Make y axis with horizontal labels that display ticks at 
  # every 4 marks. 4*0:g_range[2] is equivalent to c(0,4,8,12).
  axis(2, las=1, at=4*0:g_range[2])
  axis(4, las=1, at=4*0:g_range[2])   # right side
  
  # add solid horizontal lines at y=1,5,7
  #abline(h=c(1,5,7))
  # add dashed blue verical lines at x = 1,3,5,7,9
  #abline(v=seq(1,10,2),lty=2,col="blue")
  abline(h=6)
  
  # Create box around plot
  box()
  
  # Graph trucks with red dashed line and square points
  lines(trucks, type="o", pch=22, lty=2, col="red")
  
  # Create a title with a red, bold/italic font
  title(main="Autos", col.main="red", font.main=4)
  
  # Label the x and y axes with dark green text
  title(xlab="Days", col.lab=rgb(0,0.5,0))
  title(ylab="Total", col.lab=rgb(0,0.5,0))
  
  # Create a legend at (1, g_range[2]) that is slightly smaller 
  # (cex) and uses the same line colors and points used by 
  # the actual plots 
  legend(1, g_range[2], 
         c("cars","trucks"), 
         cex=0.8, 
         col=c("blue","red"), 
         pch=21:22, 
         lty=1:2)
  
  # Text Annotations
  # pos =	position relative to location
  # location = x,y eg. 1.5, 7
  text(1.5, 7, "this is a horizontal line", cex=0.9, pos=4, col="red") 
  mtext("side = 4", side=4, line=3,col='magenta')
     
  # Turn off device driver
  #dev.off()




