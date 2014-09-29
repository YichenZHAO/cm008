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
max_minus_min(gDat$gdpPercap)
max_minus_min(gDat$year)
max_minus_min(gDat$pop)
max_minus_min(gDat$continent) #meanlingless for categorical data


