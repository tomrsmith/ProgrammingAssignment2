## Code to run the new matrix inverse

# Create some data
test <- matrix(c(1,2, 5,6), nrow=2, ncol=2)
# Step 1 - make the function vector for the input
testsp <- makeCacheMatrix(test)
# Step 2 - calculate the inverse
cacheSolve(testsp)
# Step 3 - do it again!
cacheSolve(testsp)
