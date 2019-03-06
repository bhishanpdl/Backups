#!/usr/bin/Rscript

# Bhishan Poudel
# Jan 5, 2016

# to run: clear; Rscript egsprintf.r; rm *~



a <- "string"
sprintf("This is where a %s goes.", a)
#> [1] "This is where a string goes."


x <- 8
sprintf("Regular:%d", x)
#> [1] "Regular:8"

# Can print to take some number of characters, leading with spaces.
sprintf("Leading spaces:%4d", x)
#> [1] "Leading spaces:   8"

# Can also lead with zeros instead.
sprintf("Leading zeros:%04d", x)
#> [1] "Leading zeros:0008"

sprintf("%f", pi)         # "3.141593"
sprintf("%.3f", pi)       # "3.142"
sprintf("%1.0f", pi)      # "3"
sprintf("%5.1f", pi)      # "  3.1"
sprintf("%05.1f", pi)     # "003.1"
sprintf("%+f", pi)        # "+3.141593"
sprintf("% f", pi)        # " 3.141593"
sprintf("%-10f", pi)      # "3.141593  "   (left justified)
sprintf("%e", pi)         #"3.141593e+00"
sprintf("%E", pi)         # "3.141593E+00"
sprintf("%g", pi)         # "3.14159"
sprintf("%g",   1e6 * pi) # "3.14159e+06"  (exponential)
sprintf("%.9g", 1e6 * pi) # "3141592.65"   ("fixed")
sprintf("%G", 1e-6 * pi)  # "3.14159E-06"


x <- "string"
sprintf("Substitute in multiple strings: %s %s", x, "string2")
#> [1] "Substitute in multiple strings: string string2"

# To print a percent sign, use "%%"
sprintf("A single percent sign here %%")
#> [1] "A single percent sign here %"
