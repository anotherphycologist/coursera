getwd()
setwd("C:/Users/Admin/desktop/Coursera")

dir()
ls()

x <- 1
print(x) # explicit printing
x # auto printing

msg <- "hello"
msg

x2 <- (1:20)
x2

ls()

### OBJECTS ###

x3 <- vector("numeric", length = 10)
x3

### CREATING VECTORS ###

x4 <- c(0.5,0.6) # c...concatenate (=verknüpfen). Nur Vektoren mit gleicher klasse können miteinander verknüpft werden
x4

### MIXING OBJECTS ###

x5 <- c(1.7,"a") # vectors are not of the same class --> coercion (=Zwang) happens
x5 # the least common character will be defined as valid and the other one foreced to be the same
# in this case "a" is less common --> 1.7 will be forced to be a string "1.7"


### EXPLICIT COERCION ###

x6 <- c(1:6)
class(x6)

as.numeric(x6) # d will be forced to be a number instead of an integer
as.logical(x6)
as.integer(x6)
as.complex(x6)

### LISTS ###

x7 <-list(1, "a", TRUE, 1+4i)
x7

### MATRICES ###

m <- matrix(nrow = 2, ncol = 3)
m

dim(m)
attributes(m)

m1 <- matrix(1:6, nrow = 2, ncol = 3) # one way to create a matrix
m1

m2 <- 1:10
m2
dim(m2) <- c(2,5) # another way to create a matrix
m2
dim(m2)

### CBIND-ING AND RBIND-ING ###

x8 <- (1:3)
y <- (10:12)
cbind(x8,y)
rbind(x8,y)


### FACTORS ###

x10 <- factor(c("yes", "yes", "no", "yes", "no")) # gives me values (yes and no)
x10 # and a second attribute "Levels" is printed

table(x10) # shows me that there are 2x no and 3x yes

unclass(x10) # strips our the class of a vector and brings it down to an integer vector

x10 <- factor(c("yes", "yes", "no", "yes", "no"), levels = c("yes", "no")) # if I want to change the order of levels, this can be done with the "levels" argument
# now "yes" is first and "no" is second


### MISSING VALUES ###

x12 <- c(1, 2, NA, 10, 3) # na for all kinds of missing values
is.na(x12)
is.nan(x12)

x13 <- c(1, 2, NA, NaN, 3) # except of NaN --> numerical operator
is.na(x13)
is.nan(x13)


### DATA FRAMES ###

x13 <- data.frame(foo = 1:4, bar = c(T,T,F,F))
x13

nrow(x13)
ncol(x13)


### NAMES ###

x14 <- 1:3 # x14 does not have a name yet
names(x14) # thats why I get a "NULL" when I ask for the name

names(x14) <- c("foo", "bar", "norf") # vectors can have names
x14

x15 <- list(a = 1, b = 2, c = 3) # lists can have names
x15

m3 <- matrix(1:4, nrow = 2, ncol = 2) # first i define how my matrix looks like
dimnames(m3) <- list (c("a","b"), c("c","d")) # then I name the rows and columns
m3



### Summary ###
# So, that's kind of a whirlwind tour of the different basic data types in R.
# So far, we've talked about the atomic classes in numeric, logical, character, integer, and complex vectors.
# We talked about how vectors can only have elements of the same class
# and the main exception to that is lists which can have elements of different classes.
# There are factors which are used for, for coding categorical data, with ordered and unordered data.
# There are missing values that are represented by NAs, and NANs.
# Data frames are used to store tabular data or each COM can be of a different class.
# And finally, all our R objects can have names, which can be useful for creating self-describing data. 


### CONNECTIONS ###

str(file) # shows how this function has to be designed

str("hw1_data.csv", open = "r", blocking = TRUE,
    encoding = getOption("encoding"))

con <- file("foo.csv", "r") # foo.txt gives me a warning message...why?
data <- read.csv(con)
close(con)

data <- read.csv("foo.csv")
data

# Reading lines of a text file

## This might take time
con <- url("http://www.jhsph.edu", "r")
x <- readLines(con)
head(x)
close(con)

### SUBSETTING ###

x <-c("a", "b", "c", "c", "d", "a") # a character vector called "x"
x[1] # i can extract the first element (in this case a character vector)
# which gives me back a character vector
x[2] # extract the second element
x[1:4] # extract a sequence
# we extracted character vectors using a NUMERIC index
x[x>"a"] # or i can use a logical index
u <- x > "a" # i can also create a LOGICAL VECTOR (which is a TRUE or FALSE vector)
u
x[u] # then I can subset the vector x with the u-vector

### SUBSETTING A LIST ###

x <- list(foo = 1:4, bar = 0.6) # list with 2 elements
x
# single bracket returns an object of the same class as the original obj
x[1]  # I get a list, the 1st element is called foo and has a seq. of 1234
x[[1]] # i just get the sequence 1234

x$bar # gives me the element associated with the name "bar"
x$foo

x[["bar"]] # is the same as x$bar
x["bar"] # gives me a list  

# advantage of subsetting with a name: I don't need to know at which position 
# my element is

# how to extract multiple elements of a list:

x <- list(foo = 1:4, bar = 0.6, baz = "hello")
x[c(1, 3)]

name <- "foo" # here I create a variable called 'name'
x[[name]] # and use the [[]] on it, it returns me the element that was
# associated with 'foo' (there is no element called 'name' in the list)
# sometimes the name of an element is the result of a computation
# therefore it can be useful to subset a list by creating a ne

x$name # the element 'name' does not excist!

x$foo # but the element 'foo' does exist

### SUBSETTING NESTED ELEMENTS OF A LIST ###

x <- list(a = list(10, 12, 14), b = c(3.14, 5.81))
x[[c(1, 3)]] # gives me the third element of the first list
x[[1]][[3]] # does the same
x[[c(2,1)]] # gives me the first element of the second list

### SUBSETTING A MATRIX ###

m <- matrix(1:6, 2, 3)
m

m[1,2]
m[2,1]

# indices can also be missing

m[1,]
m[,3]

# By default, when a single element of a matrix is retrieved
# it is returned as a vector of length 1 rather than a 1 × 1 matrix.
# This behavior can be turned off by setting drop = FALSE.

m[1,2, drop = FALSE]
m[1, , drop = FALSE]

### PARTIAL MATCHING ###

x <- list(vielzulangername = 1:5) # it would be annoying to type this long name
x$v # so i can subset by partial matching
x[["v"]] # does not work because R is looking for an exact match of 'v' in the list
# to prevent this default setting you can write:
x[["v", exact = FALSE]]

### REMOVING NA VALUES ###

x <- c(1, NA, 3, 4, NA, 6, 7)
bad <- is.na(x) # creates a logical vector, which tells me where the NAs are
bad
x[!bad] # but I don't want the values that are missing so I exclude them with '!'

# what if there are multiple things and I want to take a subset with no missing values

x <- c(1, NA, 3, 4, NA, 6, 7)
y <- c("a", NA, "c", "d", NA, "f", "g")
z <- c(NA, 3, 4, NA, 6, 7, NA)
good <- complete.cases(x,y)
good # gives me an overlap of both objects, x and y
better <- complete.cases(x,z)
better

x[good]
y[good]

### SUBSETTING A DATAFRAME ###

airquality[1:6, ] # an example dataset available in R
good <- complete.cases(airquality) # tells me which rows are complete
airquality [good, ][1:6, ] # i want to see the good rows from 1 to 6

airquality[ ,1:2] # Can I do the same with columns?
good <-complete.cases(airquality)
airquality [ , good][ , 1:2] ### ? why does the same not work for columns?
help("complete.cases")
help("airquality")

### VECTORIZED OPERATION ###

# Many operations in R are vectorized making code more efficient, concise,
# and easier to read.

x <- 1:4; y <- 6:9
x ; y
x + y # adds each element of x to each element of y
x>2 # all elements of x greater than 2
x>=2  # all elements of x greater than or equal to 2
y==6 # elements of y that are equal to 6
x*y
x/y

### VECTORICED MATRIX OPERATIONS ###

x <- matrix(1:4, 2, 2); y <- matrix(rep(10, 4), 2, 2) # y matrix: repeat 10 four times, for 2 rows and 2 columns
x
y
x * y # element-wise multiplication
x %*%y # true matrix multiplication

# good explanation for 'true matrix multiplication': 
# "http://www.mathsisfun.com/algebra/matrix-multiplying.html"

