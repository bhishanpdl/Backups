# Author    : Bhishan Poudel
# Date      : May 25, 2016
# ifelse(test, yes, no)  yes=values for true, no = values for false test
# paste (..., sep = " ", collapse = NULL)


# logical function to find TRUE or, FALSE for leap year
isLeapYear <- function(year) {
    ifelse(year%%100==0, year%%400==0, year%%4==0)
}


# implementing the function
for (y in c(1900, 1994, 1996, 1997, 2000)) {
    print(paste(y, " is ", ifelse(isLeapYear(y), "", "not "), "a leap year.", sep=""))
}

# output:  "1900 is not a leap year."   and so on.


##-----------------------------------------------------------------------------
# description
# ifelse condition
cat("\nifelse condition example\n")
x <- 1:10
ifelse(x<5 , x, 0) # the false values are replaced by 0
# [1]  1 2 3 4 0 0 0 0 0 0


cat("\nifelse description\n")
year = 2000
logic = ifelse(year%%100==0, year%%400==0, year%%4==0)
print(logic)
ifelse(year%%100==0, year%%400==0, year%%4==0)

cat("\nifelse description\n")
logic2 = isLeapYear(2000)
print(logic2) # TRUE
ifelse(logic2, " ", "not ")
logic3 = isLeapYear(2001)
ifelse(logic3, " ", "not ")

# paste function in r
# http://www.inside-r.org/r-doc/base/paste
cat("\npaste function in r\n")
cat("paste creates strings\n")
paste(1:12) # same as as.character(1:12)
paste("A", 1:6, sep = "") # "A1" "A2" "A3" "A4" "A5" "A6"
stopifnot(identical(paste ("A", 1:6, sep = ""),
            paste0("A", 1:6)))
paste("Today is", date()) # "Today is Wed May 25 10:32:13 2016"




