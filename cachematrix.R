## cachematrix.R provides functions to calculate the inverse of a matric
## and cache the result to avoid the computation overhead if the inverse
## of the same matrix is needed again.  There are 2 functions provided by 
## cachematrix.R.  To properly use these functions makeCacheMatrix must be 
## invoked with a matrix before cacheSolve can be used for that matrix.

## makeCacheMatrix - creates an R object containing caches for the matrix
##                   and its inverse, and returns a list of the 4 functions 
##                   that are used to get and set the matrix and inverse objects 
##                   from the object cache. 
##                 - Input to makeCacheMatrix must be a square invertible matrix. 
##                 - Output is a list containing the following functions:
##                     get() - returns the cached matrix.
##                     set(y) - sets the cached matrix to y.
##                     getinverse() - returns the cached inverse matrix.
##                     setinverse(inverse) - sets cached inverse matrix to inverse.
##

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) inv <<- inverse
        getinverse <- function() inv
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## cacheSolve      - returns the inverse of the matrix argument from cache if
##                   cache is already set, or newly calculated if the cache is
##                   not yet initialized. The cache is set if not already set.
##                   The inverse is computed using the solve function.
##                 - Input to cacheSolve must be a square invertible matrix
##                   in the form of an object created by makeCacheMatrix.
##                 - Output is a matrix which is the inverse of the input matrix.
##


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getinverse()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$setinverse(inv)
        inv
}


