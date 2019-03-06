#!/usr/bin/Rscript

# Bhishan Poudel
# Jan 7, 2016

# clear; Rscript filewrite1.r; rm *~

# A sample data frame
data <- read.table(header=TRUE, text='
 subject sex size
       1   M    7
       2   F    NA
       3   F    9
       4   M   11
 ')


# Write to a file, suppress row names
write.csv(data, "filewrite1a.csv", row.names=FALSE)

# Same, except that instead of "NA", output blank cells
write.csv(data, "filewrite1b.csv", row.names=FALSE, na="")

# Use tabs, suppress row names and column names
write.table(data, "filewrite1c.csv", sep="\t", row.names=FALSE, col.names=FALSE)



###Saving in R data format
#method 1 of R data dumping
# Save in a text format that can be easily loaded in R
dump("data", "data.Rdmpd")
# Can save multiple objects:
#dump(c("data", "data1"), "data.Rdmpd")

# To load the data again: 
source("data.Rdmpd")
# When loaded, the original data names will automatically be used.



#method 2 of R data dumping
# Save a single object in binary RDS format
saveRDS(data, "data.rds")  # binary is more compact
# Or, using ASCII format
saveRDS(data, "data.rds", ascii=TRUE)  # ascii good for github

# To load the data again:
data <- readRDS("data.rds")

# method 3 of R data dumping
# Saving multiple objects in binary RData format
save(data, file="data.RData")
# Or, using ASCII format
save(data, file="data.RData", ascii=TRUE)
# Can save multiple objects
#save(data, data1, file="data.RData")

# To load the data again:
load("data.RData")

