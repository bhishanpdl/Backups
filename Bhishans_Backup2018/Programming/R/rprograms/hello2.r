#!/usr/bin/env Rscript

# mehtod 1  #!/usr/bin/env Rscript    is more portable, reads first installed R script installed anywhere
# method 2  #!/usr/bin/Rscript        is official way
# mehtod 3  #!/usr/local/bin/Rscript  reads R installed inside local

# Bhishan Poudel
# Jan 7, 2016

# clear; Rscript hello.r

# to clear R console      :  ctrl L  or system('clear')
# to get current directory:  getwd()
# exectuation permission  :  chmod +x filename.r
# to get version of R     : (on the console) version
# example commands        : getwd() , setwd()
# source the code, it gives path and copy paste the path in setwd

cat("Hello World!\n")
cat("My name is Bhishan Poudel\n")
cat("The date is Jan 7, 2016 Thursday\n")

print("This is print example")

# R Style Guide
# ref: https://google.github.io/styleguide/Rguide.xml
# variable.name or variableName  e.g. avgRent
# FunctionName e.g. CalculateAvgRent
# kConstantName e.g. kMaxLimit = 1000

# total <- sum(x[ ,1])  # Needs a space after the comma, not before
# tab.prior <- table(df[df$days.from.opt < 0, "campaign.id"])
#           spaces                       spaces

# always start body in next line of { bracket
#if (is.null(ylim)) {
#  ylim <- c(0, 0.06)
#}

# surround }else{
#if (condition) {
# one or more lines
#} else {
#  one or more lines
#}

# Comment should start with one space.


