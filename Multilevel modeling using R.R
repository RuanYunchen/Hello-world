#MULTILEVEL MODELING USING R
##Regression in R

remove(list = ls())
setwd("/Users/kinkin13/Downloads/datasets")
dat <- read.csv("Cassady.csv")
head(dat)
names(dat)
Model1.1 <- lm(GPA ~ CTA.tot + BStotal, dat)
summary(Model1.1)
lm(formula = GPA ~ CTA.tot + BStotal, data = dat)
anova(Model1.1)
attributes(Model1.1)
Model1.2 <- lm(GPA ~ CTA.tot + BStotal + CTA.tot*BStotal,
               dat)
Model1.2

##Checking Regression Assumptions with R
##Plot the residual of the simple linear regression model of the data set faithful against the independent variable waiting.
library(car)
residualPlots(Model1.1)
?residualPlots

eruption.res = resid(eruption.lm)
qqPlot(Model1.1)
