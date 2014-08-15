## There are two functions in this file, the first function to set
## up a vector of functions to set and get the value of 
## the matrix and to set and get the inverse of the matrix,
## and the second function to calculate the inverse of the matrix
## unless it has already been calculated in which case it
## gets it from the cache

## This first function sets up the special vector of functions
## Run this on your target matrix for inversion to store
## the special function vector used by cacheSolve

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
      x <<- y
      m <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) m <<- solve
    getsolve <- function() m
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
  }
  

## This second function solves the inverse of x unless
## it has already been solved in which case it gets it
## from the cache (all accessed from the special vector
## created in makeCacheMatrix)

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    m <- x$getsolve()
    if(!is.null(m)) {
      message("getting cached data")
      return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setsolve(m)
    m
  }

