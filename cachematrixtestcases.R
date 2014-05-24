source("cachematrix.R")

simplematrix <- matrix(c(1,2,3,4), nrow=2, ncol=2)
amatrix = makeCacheMatrix(simplematrix)
amatrix$get()         # Returns original matrix
cacheSolve(amatrix)   # Computes, caches, and returns    matrix inverse
amatrix$getinverse()  # Returns matrix inverse
cacheSolve(amatrix)   # Returns cached matrix inverse using previously computed matrix inverse
summary(simplematrix)
str(simplematrix)
summary(amatrix)
str(amatrix)

simplematrix <- matrix(c(0,5,99,66), nrow=2, ncol=2)
amatrix = makeCacheMatrix(simplematrix) # Modify existing matrix
cacheSolve(amatrix)   # Computes, caches, and returns new matrix inverse
amatrix$get()         # Returns matrix
amatrix$getinverse()  # Returns matrix inverse
summary(simplematrix)
str(simplematrix)
summary(amatrix)
str(amatrix)

