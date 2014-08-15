## Test mean script from programming example 2
## See the bottom for the code to run it

makeVector <- function(x = numeric()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmean <- function(mean) m <<- mean
  getmean <- function() m
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)
}

cachemean <- function(x, ...) {
  m <- x$getmean()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- mean(data, ...)
  x$setmean(m)
  m
}

## Code to run this
# Create some data
test <- c(1,2,3,4,5,6)
# Step 1 - make the function vector for the input
testsp <- makeVector(test)
# Step 2 - calculate the mean
cachemean(testsp)
# Step 3 - do it again!
cachemean(testsp)
