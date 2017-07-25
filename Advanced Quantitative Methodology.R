###Advanced Quantitative Methodology
##Day 1: Introduction and Statistical Programming with R

#clean
remove(list = ls())


## Text that's after a pound sign is a "comment." The computer will
## ignore it when it runs your code. It's good practice to comment
## your code. It makes it easier to reuse code in the future and
## helps you think through what you're doing.

## R as a calculator

5 + 3
5 - 3
5 / 3
5 ^ 3
5 * (10 - 3)
sqrt(4)


## Objects in R

result <- 5 + 3
result
print(result)
result <- 5 - 3
result

result=5
result

christopher <- "instructor"
christopher
christopher <- "researcher"
christopher

Result <- "5"
Result
result

?class
?sqrt

sqrt(25)
5^3

class(result)
Result
class(Result)
class(sqrt)

## Vectors
?c
ivy.league <-c('harvard','yele','priceton','columbia')
class(ivy.league)
world.pop <- c(2525779, 3026003, 3691173, 4449049, 5320817, 6127700, 6916183)
world.pop
world.pop[2]<-10
world.pop[4]=1234
world.pop

pop.first <- c(2525779, 3026003, 3691173)
pop.second <- c(4449049, 5320817, 6127700, 6916183)
pop.all <- c(pop.first, pop.second)
c(pop.first, pop.second)
c(pop.first, pop.second) == pop.all
print(pop.all)

world.pop[2]
world.pop[c(2, 4)] 
world.pop[c(4, 2)] 
world.pop[2:5]
world.pop[-3]

pop.million <- world.pop / 1000
pop.million

pop.rate <- world.pop / world.pop[1]
pop.rate

world.pop
world.pop[-1] 
world.pop[-7]

pop.increase <- world.pop[-1] - world.pop[-7]
pop.increase
percent.increase <- (pop.increase / world.pop[-7]) * 100
percent.increase
percent.increase[c(1, 2)] <- c(20, 22)
percent.increase

## Functions
world.pop
length(world.pop)  
min(world.pop)     
max(world.pop)     
range(world.pop)   
mean(world.pop)    
sum(world.pop) / length(world.pop) 
?seq
year <- seq(from = 1950, to = 2010, by = 10)
year

seq(to = 2010, by = 10, from = 1950)

seq(from = 2010, to = 1950, by = -10)
2008:2012
2012:2008
?plot
plot(year,world.pop)
plot(year,world.pop,type='l')
plot(year,world.pop,type='l',ylab='world population')
plot(year,world.pop,type='l',ylab='world population',main='Population in the World')

?names
names(world.pop) 
names(world.pop) <- year
names(world.pop)
world.pop

my.summary <- function(x){ # function takes one input
  s.out <- sum(x)
  l.out <- length(x)
  m.out <- s.out / l.out
  out <- c(s.out, l.out, m.out) # define the output
  names(out) <- c("sum", "length", "mean") # add labels
  return(out) # end function by calling output
}
z <- 1:10
my.summary(z)
my.summary(world.pop)

## Reading in data
setwd("/Users/kinkin13/Downloads/【暑期课】Advanced Quantitative Methodology")
dat <- read.csv("lalonde2.csv")

## How big is the data?
nrow(dat)
ncol(dat)
dim(dat)

## What's in the data?
colnames(dat)
head(dat)
tail(dat)

## Extract a column
dat$treat
dat[,"treat"]
dat[4,2]
dat[,"age"]



## How many treated versus control units?
table(dat$treat)

## Create a new column
dat$collegegrad <- as.integer(dat$education >= 12)
dat$collegegrad

## Sample mean
sum(dat$re78)/length(dat$re78)
mean(dat$re78)

## Sample variance
var(dat$re78)
?var

## Plotting - R is great at plots!
plot(dat$education, dat$re78)

## Plot a histogram
hist(dat$re78, col = "grey", xlab = "Income in 1978 (USD)", main = "")
hist(dat$age)
## Compare the distribution of the outcome for treated versus control
outcome.control <- dat$re78[dat$treat == 0]
outcome.control
mean(outcome.control)
outcome.treated <- dat$re78[dat$treat == 1]
outcome.treated
mean(outcome.treated)
plot(density(outcome.treated), col = "red", xlab = "Income in 1978 (USD)")
lines(density(outcome.control), col = "blue")
abline(v=mean(outcome.control),col='blue')
abline(v=mean(outcome.control),col='red')
## for loops
values <- c(2, 4, 6)
n <- length(values) # number of elements in `values'
n
results <- rep(NA, n) # empty container vector for storing the results
results
## loop counter `i' will take values on 1, 2, ..., n in that order
for (i in 1:n) {
  ## store the result of multiplication as the ith element of
  ## `results' vector
  results[i] <- values[i] * 2
  cat(values[i], "times 2 is equal to", results[i], "\n")
}
results

## check if the code runs when i = 1
i <- 1
x <- values[i] * 2
cat(values[i], "times 2 is equal to", x, "\n")

### if statements

## define the operation to be executed
operation <- "add"
if (operation == "add") {
  cat("I will perform addition 4 + 4\n")
  4 + 4
}
if (operation == "multiply") {
  cat("I will perform multiplication 4 * 4\n")
  4 * 4
}

## Note that `operation' is redefined
operation <- "multiply"
if (operation == "add") {
  cat("I will perform addition 4 + 4")
  4 + 4
} else {
  cat("I will perform multiplication 4 * 4")
  4 * 4
}

## Note that `operation' is redefined
operation <- "subtract"
if (operation == "add") {
  cat("I will perform addition 4 + 4\n")
  4 + 4
} else if (operation == "multiply") {
  cat("I will perform multiplication 4 * 4\n")
  4 * 4
} else {
  cat("`", operation, "' is invalid. Use either `add' or `multiply'.\n",
      sep = "")
}

values <- 1:5
n <-  length(values)
results <- rep(NA, n)
for (i in 1:n) {
  ## x and r get overwritten in each iteration
  x <- values[i]
  r <- x %% 2  # remainder when divided by 2 to check whether even or odd
  if (r == 0) { # remainder is zero
    cat(x, "is even and I will perform addition",
        x, "+", x, "\n")
    results[i] <- x + x
  } else { # remainder is not zero
    cat(x, "is odd and I will perform multiplication",
        x, "*", x, "\n")
    results[i] <- x * x
  }
}
results

##Day 2: Introduction to the Linear Model


dat <- read.csv("lalonde.csv")
dat$random.treat <- sample(c(0,1), 1:nrow(dat), replace = TRUE)
pscore.form.2 <-as.formula("random.treat ~ age + education + black + hispanic + married + nodegree + re74 + re75")
pscore.reg <- lm(pscore.form.2, data=dat)
summary(pscore.reg)

reg <-lm(re78 ~ treat,data = dat)
summary(reg)
names(reg)
plot (dat$treat, dat$re78)
abline(reg$coefficients[1],
       reg$coefficients[2],
       col = "red")

control.form <- as.formula("re78 ~ treat + age + education + black + hispanic + married + nodegree + re74 +re75")
reg.w.control <- lm(control.form , data = dat)
summary(reg.w.control)

abline(reg.w.control$coefficients[1],
       reg.w.control$coefficients[2],
       col = "blue")
