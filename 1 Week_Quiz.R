### QUIZ ###
x <-c(1,5,6)
y <-c(3,5,2)
cbind(x,y)


x <- list(2, "a", "b", TRUE)
x[[1]]

x <- c(17, 14, 4, 5, 13, 12, 10)
x[x>10]<-4 # this code also turns 10 into 4 - so it's not appropriate
x
x <- c(17, 14, 4, 5, 13, 12, 10)
x[x >= 11] <- 4
x


setwd("C:/Users/Admin/desktop/Coursera")
quiz <- read.csv("hw1_data.csv")
quiz

colnames(quiz)
quiz[1:2,] # how do the first 2 rows of the dataset look like
nrow(quiz)
quiz[152:153,]
quiz[47,1] # value of ozone in the 47th row
sum(is.na(quiz$Ozone)) # number of missing values in the Ozone column
badoz <-is.na(quiz$Ozone) # creates a logical vector, which tells me where the NAs are
quiz$Ozone[!badoz] # gives me all the values of Ozone without NAs
mean(quiz$Ozone[!badoz]) # mean without NAs

#Q18: subset rows: Ozone > 31, Temp > 90. What is the mean of Solar.R in the subset?

good <- subset(quiz, Ozone > 31 & Temp > 90) # Gives me a defined subset as new data!
mean(good$Solar.R)

