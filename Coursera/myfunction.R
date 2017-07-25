#Coursera

## R programming

getwd()
setwd("~/Hello-world/Coursera")
dir()
?file.remove
file.remove("my function.txt")
file.remove("myfunction.R")

myfunction <- function(x){
  y <- rnorm(100)
  mean(x)
}

source <- function(x){
  x + rnorm(length(x))
}
