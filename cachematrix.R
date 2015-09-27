## saves a cached copy of the inverse of the matrices which can be used later, instead of 
## computing it then, hence saving time.

## creates a special matrix x which containing a list of 
## functions to set and get the values of the matrix and set and get values of its corresponding inverse.
## it also creats a cached copy of the same.

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
set <- function(y) {
        x <<- y
        m <<- NULL
}
get <- function() x
setinverse <- function (solve) m <<- solve
getinverse <- function() m
list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)

}


## retrieves cached inverted matrix for the given matrix, if available, otherwise calculates
## it using the 1st function 

cacheSolve <- function(x, ...) {
        m <- x$getinverse()
        if (!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
        
        ## Return a matrix that is the inverse of 'x'
}
