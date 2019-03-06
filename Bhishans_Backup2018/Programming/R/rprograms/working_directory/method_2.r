# Author  : Bhishan Poudel
# Program : example.r


# set working directory here
# Function to set the current directory as the working directory
set_default_wd <- function(wd = getwd(), overwrite = FALSE) {
  text <- paste0(
    'local({ setwd("', wd, '") })')
  ##
  if (Sys.info()["sysname"] == "Windows") {
    write(
      text,
      file = paste0(Sys.getenv("HOME"), "\\.Rprofile"),
      append = !overwrite)
  } else {
    write(
      text,
      file = paste0(Sys.getenv("HOME"), "/.Rprofile"),
      append = !overwrite)
  }
}

# Sample data to test this code
mydata <- seq(1:10)
write.csv(mydata,"writehere.dat")  

 
