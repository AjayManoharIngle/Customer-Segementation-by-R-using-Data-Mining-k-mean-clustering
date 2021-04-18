# import library 
library(dplyr)

# read dataset csv file 
mf <- read.csv("C:/Users/Ajay's/Desktop/R/segment/Mall_Customers.csv")
str(mf)
names(mf)
head(mf)
summary(mf$Age)
sd(mf$Spending.Score..1.100.)
summary(mf$Age)