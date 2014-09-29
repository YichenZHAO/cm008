gd_url <- "http://tiny.cc/gapminder"
gDat <- read.delim(file = gd_url)
str(gDat)

## task
## input: a variable
## output: max-min

## practice input be gDat$lifeExp
## max(), min(), range()  <- these are the build-in functions

min(gDat$lifeExp)
max(gDat$lifeExp)
max(gDat$lifeExp)-min(gDat$lifeExp)
range(gDat$lifeExp)
diff(range(gDat$lifeExp)) #diff:is like a 1-lag difference

## turn that into a proper funtion
max_minus_min <- function(x) max(x)-min(x)
max_minus_min

## test it on the same data
max_minus_min(gDat$lifeExp)

## test it on more toy inputs
max_minus_min(1:5)  ## integer on double
max_minus_min(runif(1000)) ## random but valid input useful
max_minus_min(rnorm(1000))

## test it on dgpPercap and pop
max_minus_min(gDat$gdpPercap)
max_minus_min(gDat$pop)

## test it on weird stuff - ERROR MESSAGES
max_minus_min("apples")
max_minus_min(gDat)
max_minus_min(gDat$continent) # meanlingless for categorical data
max_minus_min(c(0,1,NA,2,3,4)) # missing data
max_minus_min(gDat[c('lifeExp','pop','gdpPercap')])

## check validity
mmm <- function(x){
  stopifont(is.numeric(x))
  max(x) - min(x)
}
mmm(gDat)
mmm(gDat[c('lifeExp','pop','gdpPercap')])

## to get a better error message
mmm2 <- function(x){
  if(!is.numeric(x)){               ## x is not numeric
    stop('I am so sorry, but this function only works for numeric input. Have a nice day!')     
  }                                 ## stop with error messages
  stopifont()
  max(x) - min(x)
}
mmm2(gDat)
mmm2(gDat[c('lifeExp','pop','gdpPercap')])


### packages that help

## assertthat
install.packages("assertthat")
library(assertthat)
mmm3 <- function(x){
  require(assertthat)
  assert_that(is.numeric(x))
  max(x) - min(x)
}
mmm3(gDat)
mmm3(gDat[c('lifeExp','pop','gdpPercap')])
mmm3(c(TRUE, FALSE, TRUE))

## ensurer is another package
## test that!

## make our function more general
## input = x
## input = two numbers between 0 and 1, "probabilities"
## output = difference between the associated quantiles

## GET IT WORKING IN AN EXAMPLE, INTERACTIVELY!

# my approach
quantile(gDat$lifeExp)
q1_minus_q0 <- function(x) quantile(x, probs=1) - quantile(x, probs=0)
q1_minus_q0(gDat$lifeExp)

# prof's approach
the_probs <- c(0.25, 0.75)
the_quantiles <- quantile(gDat$lifeExp, probs=the_probs)
max(the_quantiles) - min(the_quantiles)

qdiff1 <- function(my_x, my_probs){
  assert_that(is.numeric(my_x))
  the_quantiles <- quantile(my_x, probs=my_probs)
  max(the_quantiles) - min(the_quantiles)
}
qdiff1(gDat$lifeExp, my_probs=c(0,1))
qdiff1(gDat$gdpPercap, my_probs=c(0,1))
