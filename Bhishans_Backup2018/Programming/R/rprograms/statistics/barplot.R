#!/usr/bin/Rscript 
# Bhishan Poudel 
#  Jan 22, 2016


# setting working directory  
set_default_wd()  


library(MASS)                 # load the MASS package
head(painters,3)
school <- painters$School      # the painter schools 

school.freq <- table(school)   # apply table to get freq
school.freq

barplot(school.freq)         # apply the barplot function 

# decoration
colors = c("red", "yellow", "green", "violet", 
           "orange", "blue", "pink", "cyan") 
barplot(school.freq, col=colors)       # set the color palette 

# pie charts
pie(school.freq)                    # apply the pie function 
barplot(school.freq, col=colors)    # set the color palette              
