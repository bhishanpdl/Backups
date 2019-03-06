#!/usr/bin/Rscript

# Bhishan Poudel
# Jan 7, 2016

# clear; Rscript data1.r; rm *~


data <- read.csv("~/OneDrive/Programming/R/rprograms/file/datafile.csv")

# Load a CSV file that doesn't have headers

data <- read.csv("~/OneDrive/Programming/R/rprograms/file/datafile-noheader.csv", header=FALSE)


# reading using table
# for help ?read.table
data <- read.table("~/OneDrive/Programming/R/rprograms/file/datafile-noheader.csv",
                   header=FALSE,
                   sep=","         # use "\t" for tab-delimited files
)


# Treating strings as factors or characters

data <- read.csv("~/OneDrive/Programming/R/rprograms/file/datafile.csv", stringsAsFactors=FALSE)

# You might have to convert some columns to factors
data$Sex <- factor(data$Sex)

# Another alternative
data <- read.csv("~/OneDrive/Programming/R/rprograms/file/datafile.csv")

data$First <- as.character(data$First)
data$Last  <- as.character(data$Last)

# Another method: convert columns named "First" and "Last"
stringcols <- c("First","Last")
data[stringcols] <- lapply(data[stringcols], as.character)


# Assign the column names manually
df3 <- read.fwf("~/OneDrive/Programming/R/rprograms/file/myfile.txt", 
         c(7,5,-2,1,1,1,1,1,1), # Width of the columns. -2 means drop those columns
         skip=1,                # Skip the first line (contains header here)
         col.names=c("subject","sex","s1","s2","s3","s4","s5","s6"),
         strip.white=TRUE)      # Strip out leading and trailing whitespace when reading each
print(df3)
#>   subject sex s1 s2 s3 s4 s5 s6
#> 1    N  1   M  1  1  3  3  1  1
#> 2    NE 2   F  1  1  2  2  3  1
#> 3    S  3   F  1  1  1  2  2  1
#> 4    W  4   M  0  1  1  0  0  2
# subject sex s1 s2 s3 s4 s5 s6
#    N  1   M  1  1  3  3  1  1
#    NE 2   F  1  1  2  2  3  1
#    S  3   F  1  1  1  2  2  1
#    W  4   M  0  1  1  0  0  2


# If the first row looked like this:
# subject,sex,scores
# Then we could use header=TRUE:
#read.fwf("myfile.txt", c(7,5,-2,1,1,1,1,1,1), header=TRUE, strip.white=TRUE)
#> Error in read.table(file = FILE, header = header, sep = sep, row.names = row.names, : more columns than column names

