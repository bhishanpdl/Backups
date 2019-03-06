#!/usr/bin/Rscript

# Bhishan Poudel
# Jan 7, 2016

# clear; Rscript dataRecode.r

# We want to recode data or calculate new data columns from existing ones.

data <- read.table(header=T, text='
 subject sex control cond1 cond2
       1   M     7.9  12.3  10.7
       2   F     6.3  10.6  11.1
       3   F     9.5  13.1  13.8
       4   M    11.5  13.4  12.9
')

cat("\nThe easiest way is to use revalue() or mapvalues() from the plyr package.")
cat("This will code M as 1 and F as 2, and put it in a new column.\n")
library(plyr)

# The following two lines are equivalent:
data$scode <- revalue(data$sex, c("M"="1", "F"="2"))
data$scode <- mapvalues(data$sex, from = c("M", "F"), to = c("1", "2"))
data
#>   subject sex control cond1 cond2 scode
#> 1       1   M     7.9  12.3  10.7     1
#> 2       2   F     6.3  10.6  11.1     2
#> 3       3   F     9.5  13.1  13.8     2
#> 4       4   M    11.5  13.4  12.9     1

# data$sex is a factor, so data$scode is also a factor

cat("\nIf you don’t want to rely on plyr, you can do the following with R’s built-in functions:\n")
data$scode[data$sex=="M"] <- "1"
data$scode[data$sex=="F"] <- "2"

# Convert the column to a factor
data$scode <- factor(data$scode)
data
#>   subject sex control cond1 cond2 scode
#> 1       1   M     7.9  12.3  10.7     1
#> 2       2   F     6.3  10.6  11.1     2
#> 3       3   F     9.5  13.1  13.8     2
#> 4       4   M    11.5  13.4  12.9     1


cat("\n Another way to do it is to use the match function:\n")
oldvalues <- c("M", "F")
newvalues <- factor(c("g1","g2"))  # Make this a factor

data$scode <- newvalues[ match(data$sex, oldvalues) ]
data
#>   subject sex control cond1 cond2 scode
#> 1       1   M     7.9  12.3  10.7    g1
#> 2       2   F     6.3  10.6  11.1    g2
#> 3       3   F     9.5  13.1  13.8    g2
#> 4       4   M    11.5  13.4  12.9    g1


cat("\nRecoding a continuous variable into categorical variable \n")
data$category[data$control< 7] <- "low"
data$category[data$control>=7] <- "high"

# Convert the column to a factor
data$category <- factor(data$category)
data
#>   subject sex control cond1 cond2 scode category
#> 1       1   M     7.9  12.3  10.7    g1     high
#> 2       2   F     6.3  10.6  11.1    g2      low
#> 3       3   F     9.5  13.1  13.8    g2     high
#> 4       4   M    11.5  13.4  12.9    g1     high


cat("\nWith the cut function, you specify boundaries and the resulting values:\n")
data$category <- cut(data$control,
                     breaks=c(-Inf, 7, 9, Inf),
                     labels=c("low","medium","high"))
data
#>   subject sex control cond1 cond2 scode category
#> 1       1   M     7.9  12.3  10.7    g1   medium
#> 2       2   F     6.3  10.6  11.1    g2      low
#> 3       3   F     9.5  13.1  13.8    g2     high
#> 4       4   M    11.5  13.4  12.9    g1     high

#Calculating a new continuous variable
data$total <- data$control + data$cond1 + data$cond2
data
#>   subject sex control cond1 cond2 scode category total
#> 1       1   M     7.9  12.3  10.7    g1   medium  30.9
#> 2       2   F     6.3  10.6  11.1    g2      low  28.0
#> 3       3   F     9.5  13.1  13.8    g2     high  36.4
#> 4       4   M    11.5  13.4  12.9    g1     high  37.8
