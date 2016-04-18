#heavily based on Ista Zahn's intro to R from IQSS

#FITSio
#RPUX  <-- GPU


# http://blog.revolutionanalytics.com/2014/03/an-r-meta-book.html

library(rgl)
open3d()
comet <- readOBJ(url("http://sci.esa.int/science-e/www/object/doc.cfm?fobjectid=54726"))
shade3d(comet, col="gray")


x.norm<-rnorm(n=200,m=10,sd=2)
hist(x.norm,main="Histogram of observed data")
plot(density(x.norm),main="Density estimate of data")
plot(ecdf(x.norm),main="Empirical cumulative distribution function")

z.norm<-(x.norm-mean(x.norm))/sd(x.norm) ## standardized data
qqnorm(z.norm) ## drawing the QQplot
abline(0,1) ## drawing a 45-degree reference line

pairs(~mpg+disp+drat+wt,data=mtcars,main="Simple Scatterplot Matrix")



##   Whatever you're trying to do, you're probably not the first to try
##   doing it R. Chances are good that someone has already written a
##   package for that.

install.packages("FITSio")

library(FITSio)

help.start()
##     • or use the help menu from you GUI

##   • Look up the documentation for a function:
help(plot)
?plot # same as above, ? is a shortcut to the help() function

##   • Look up documentation for a package
help(package="stats")

##   • Search documentation from R (not always the best way… google often
##     works better)
help.search("classification")


## R packages and libraries
## ────────────────────────

##   There are thousands of R packages that extend R's capabilities.

##   • To view available packages: `library()'

##   • To see what packages are loaded: `search()'

##   • To load a package: `library("car")'

##   • Install new package: `install.packages("stringdist")'

## Data and Functions
## ══════════════════

## Assignment
## ──────────

##   Values can be assigned names and used in subsequent operations
##   • The `<-' operator (less than followed by a dash) is used to save
##     values
##   • The name on the left gets the value on the right.

x <- 10 # Assign the value 10 to a variable named x
(y <- x + 1) # Assign y the value x + 1

##   Saved variables can be listed, overwritten and deleted
ls() # List variables in workspace
x # Print the value of x
rm(x) # Delete x

ls()
x<-10


##   Examples:
#?sqrt
(a <- sqrt(y)) # Call the sqrt function with argument x=y
x
y

(a <- sqrt(x=y)) # Call the sqrt function with argument x=y
x
y

(a <- sqrt(x<-y)) # Call the sqrt function with argument x=y
x
y

round(a, digits = 2) # Call round() with arguments x=a and digits=2
# Functions can be nested so an alternative is

round(sqrt(y), digits = 5) # Take sqrt of a and round

## Getting data into R
## ═══════════════════

## The gss dataset
## ───────────────

##   The next few examples use a subset of the General Social Survey data
##   set. The variables in this subset include
setwd("/Users/jsteiner/Documents/R-tutorials/Rintro/")

x<-read.csv("dataSets/gssInfo.csv")

getwd() # get the current working directory

##   It can be convenient to list files in a directory without leaving R
list.files("dataSets") # list files in the dataSets folder
# list.files("dataSets", pattern = ".csv") # restrict to .csv files






##  INDEXING, SYNTAX, etc.

mynumbers <- c(3, 5, 6, 7, 1)

1:10

seq(0.5, 2.5, 0.5)



LETTERS[1:5]

x <- c(74, 31, 95, 61, 76, 34, 23, 54, 96)
x[c(1, 3, 4, 8)]
x[-c(1, 3, 4, 8)]
letters[-(6:24)]
lm


vector1 <- seq(-3, 3, 0.5)
matrix1 <- matrix(1:20, nrow = 5)

vector1[5] # returns the 5th element of vector1
vector1[1:3] # returns the first three elements of vector1
vector1[c(2, 4, 5)] # returns the 2nd, 4th and 5th element of vector1
vector1[-5] 

matrix1[2,] # returns the 2nd row of matrix1
matrix1[,3] # returns the 3rd column of matrix1
matrix1[2, 3] # returns the value from matrix1 in the 2nd row and 3rd column
matrix1[1:2, 3] 


A = matrix( 
  c(2, 4, 3, 1, 5, 7), # the data elements 
  nrow=2,              # number of rows 
  ncol=3,              # number of columns 
  byrow = TRUE)        # fill matrix by rows 

A[ ,c(1,3)]  # the 1st and 3rd columns 
dimnames(A) = list( 
  c("row1", "row2"),         # row names 
  c("col1", "col2", "col3")) 

A["row2", "col3"]


t(A)
AA <- rbind(A,A)

# make a function
bilbo <- function(x)
{
  n <- length(x)
  gm <- exp(mean(x))/n
  return(gm)
}

bilbo(AA)


# PLOTTING

x <- seq(-pi, pi, length = 10)
y <- sin(x) 
plot(x, y) 
lines(x, y) 



attach(mtcars)
plot(wt, mpg, main="Scatterplot Example", 
     xlab="Car Weight ", ylab="Miles Per Gallon ", pch=19)

# Add fit lines
abline(lm(mpg~wt), col="red") # regression line (y~x) 

f1=lm(mpg~wt)
f2=lowess(wt,mpg)


lines(lowess(wt,mpg), col="blue") # lowess line (x,y)
# Enhanced Scatterplot of MPG vs. Weight 
# by Number of Car Cylinders 
library(car) 
scatterplot(mpg ~ wt | cyl, data=mtcars, 
            xlab="Weight of Car", ylab="Miles Per Gallon", 
            main="Enhanced Scatter Plot", 
            labels=row.names(mtcars))


names(f1)
plot(f1$residuals)

res <- f1$residuals

#test the normality
qqnorm(res) 

ks.test(res, "pnorm", mu, sigma) 

shapiro.test(res) 

hist(res, prob = TRUE, col = "red") 
lines(density(res), col = "blue")

###

mysample <- rnorm(500) 
hist(mysample, prob = TRUE) 
mu <- mean(mysample)
sigma <- sd(mysample)
x <- seq(-4, 4, length = 500)
y <- dnorm(x, mu, sigma) 
lines(x, y)



## fiddling with plots
# Plots
hist(rnorm(100), prob = TRUE)

hist(rnorm(100), prob = TRUE, main = "custom title",
     xlab = "x label", ylab = "y label")

main = "first part \n second part"

hist(rnorm(100), sub = "subtitle", font.main = 6,
     font.lab = 7, font.axis = 8, font.sub = 9) 

hist(rnorm(500), prob = TRUE)
text(2, 0.2, "Ookla the Mok")

## images

data(volcano)
#par(mfrow = c(2, 2))
image(volcano, main = "heat.colors")
image(volcano, main = "rainbow", col = rainbow(15))
image(volcano, main = "topo", col = topo.colors(15))
image(volcano, main = "terrain.colors",
      col = terrain.colors(15))









## Saving and loading R  workspaces
## ────────────────────────────────

##   In addition to importing individual datasets, R can save and load
##   entire workspaces
##   • Save our entire workspace
ls() # list objects in our workspace
save.image(file="myWorkspace.RData") # save workspace 
rm(list=ls()) # remove all objects from our workspace 
ls() # list stored objects to make sure they are deleted

##   • Load the "myWorkspace.RData" file and check that it is restored

load("myWorkspace.RData") # load myWorkspace.RData
ls() # list objects

##   When you close R you will be asked if you want to save your workspace
##   – if you choose yes then your workspace will be restored next time you
##   start R


## data.frame objects
## ──────────────────

##   • Usually data read into R will be stored as a *data.frame*

##   • A data.frame is a list of vectors of equal length
##     • Each vector in the list forms a column
##     • Each column can be a differnt type of vector
##     • Often the columns are variables and the rows are observations

##   • A data.frame has two dimensions corresponding the number of rows and
##     the number of columns (in that order)

## Extracting subsets of data.frames
## ─────────────────────────────────

##   You can extract subsets of data.frames using the `subset()'
##   function[1]. Use the `select' argument to select columns:
# selecting specifig columns
head(# first n rows
     subset(datGSS,            
            select = 1:4 # column 1 to 5
            ),
     n = 10# show first 10 rows
     )
##   and the `subset' argument to select rows:
subset(datGSS,
       # rows where age > 90
       subset = age > 90,
       ## sex and age columns
       select = c("sex", "age"))

## the $ operator can be used to extract a single column
str(datGSS$age)

##   In the previous example we used `>' to select rows where age was
##   greater than 90. Other relational and logical operators are listed
##   below.

##   ==: equal to
##   !=: not equal to
##   >: greater than
##   <: less than
##   >=: greater than or equal to
##   <=: less than or equal to
##   &: and
##   |: or

## Transforming data.frames
## ────────────────────────

##   You can modify data.frames using the `transform()' function.

# creating new variable mean centered age
datGSS <- transform(datGSS,
                    ageC = age - mean(age))

 #education difference between wifes and husbands
datGSS <- transform(datGSS,
                    educ.diff = wifeduc - husbeduc)

datGSS$wifeduc_comp <- ifelse(
                         is.na(datGSS$wifeduc), #condition
                         mean(datGSS$wifeduc, na.rm=TRUE), # value if condition met
                         datGSS$wifeduc) # value otherwise

  ## examine our newly created variables
head(subset(datGSS,
            select = c("age", "ageC", "wifeduc", "wifeduc_comp",
                       "husbeduc", "educ.diff")), n = 8)

##   Note that `transform' is a convenience function; see `?Extract' for a
##   more powerful way to modify data.frames.

## Exporting Data
## ──────────────

##   Now that we have made some changes to our GSS data set, we might want
##   to save those changes to a file. Everything we have done so far has
##   only modified the data in R; the files have remained unchanged.

# write data to a .csv file
write.csv(datGSS, file = "gss.csv")
# write data to a Stata file
write.dta(datGSS, file = "gss.dta")
# write data to an R file
saveRDS(datGSS, file = "gss.rds")

## Exercise 2: Data manipulation
## ─────────────────────────────

##   Use the gss.rds data set

##   1. Generate the following variables:
##      • "rich" equal to 0 if rincdol is less than 100000, and 1 otherwise
##      • "sinc" equal to incomdol - rincdol
##   2. Create a subset of the data containing only rows where "usecomp" =
##      "Yes"
##   3. Examine the data.frame created in step 2, and answer the following
##      questions:
##      • How many rows does it have?
##      • How many columns does it have?
##      • What is the class of the "satjob" variable?
##   4. BONUS (hard): Generate a variable named "dual.earn" equal to 1 if
##      both wkftwife = 1 and wkfthusb = 1, and zero otherwise

## Basic Statistics and Graphs
## ═══════════════════════════

## Basic statistics
## ────────────────

##   Descriptive statistics of single variables are straightforward:
mean(datGSS$educ) # calculate mean value of education
sd(datGSS$educ) # calculate standard deviation of x
# calculate min, max, quantiles, mean of educ, age, and ageC
summary(subset(datGSS, select = c("educ", "age", "ageC")))

##   Some of these functions (e.g., summary) will also work with
##   data.frames and other types of objects, others (such as `sd') will
##   not.

## Counts and proportions
## ──────────────────────

##   Start by using the `table()' function to tabulate counts, then perform
##   additional computations if needed
sex.counts <- table(datGSS$sex) # tabulate sex categories
sex.counts
prop.table(sex.counts) # convert to proportions

##   Add variables for crosstabs

table(subset(datGSS, select = c("sex", "happy"))) # crosstab marital X happy

## Statistics by classification factors
## ────────────────────────────────────

##   The `by()' function can be used to perform a calculation separately
##   for each level of a classifying variable
by(subset(datGSS, select = c("income", "educ")),
   INDICES=datGSS["sex"],
   FUN=summary)

## Correlations
## ────────────

##   Let's look at correlations among between age, income, and education
cor(subset(datGSS, select =  c("age", "incomdol", "educ")))

##   For significance tests, use cor.test()
with(datGSS,
     cor.test(age, educ))

## Multiple regression
## ───────────────────

##   Modeling functions generally use the /formula/ interface whith DV on
##   left followed by "~" followed by predictors–for details see
##   `help("formula")'

##   • Predict the number of hours individuals spend on email (emailhrs)
m1 <- lm(educ ~ sex + age, data = datGSS)
summary(m1)

