# Author    : Bhishan Poudel
# Date      : May 25, 2016
# Ref       : http://www.inside-r.org/r-doc/base/ifelse
# Ref       : https://en.wikibooks.org/wiki/R_Programming/Control_Structures

# Descrip   : ifelse returns a value with the same shape as test which is filled
#             with elements selected from either yes or no depending on whether
#             the element of test is TRUE or FALSE.
# Usage     : ifelse(test, yes, no)  yes=values for true, no = values for false test


# example 1
#The ifelse() command takes as first argument the condition, as second argument
#the treatment if the condition is true and as third argument the treatment if
#the condition is false. In that case, the condition can be a vector.
#For instance we generate a sequence from 1 to 10 and we want to display values
#which are lower than 5 and greater than 8.
cat("example 1\n")
x <- 1:10
ifelse(x<5 | x>8, x, 0) # the false values are replaced by 0
# [1]  1  2  3  4  0  0  0  0  9 10



# example 2
cat("\nexample 2\n")
x <- c(2:-2)
sqrt(x)  #- gives warning
#[1] 1.414214 1.000000 0.000000      NaN      NaN
#Warning message:
#In sqrt(x) : NaNs produced




sqrt(ifelse(x >= 0, x, NA))  # no warning (sqrt is after test)

### Note: the following also gives the warning !
ifelse(x >= 0, sqrt(x), NA) # sqrt is inside ifelse condtion
#[1] 1.414214 1.000000 0.000000       NA       NA
#Warning message:
#In sqrt(x) : NaNs produced




## example of different return modes:
cat("\ndifferent return modes of condition ifelse\n")
yes <- 1:3
no <- pi^(0:3)  # 1.000000  3.141593  9.869604 31.006277
#print(no)
typeof(ifelse(NA, yes, no))    # logical
typeof(ifelse(TRUE, yes, no))  # integer
typeof(ifelse(FALSE, yes, no)) # double

ifelse(NA, yes, no)
ifelse(TRUE, yes, no)
ifelse(FALSE, yes, no) # test is false, so one element of argument no is output


# example 3
cat("\nexample 3\n")
year = 2000
logic = ifelse(year%%100==0, year%%400==0, year%%4==0)
print(logic)

