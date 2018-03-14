## These functions introduce special matrix object and its inverse

## This function creates a cached matrix object.
## provides a list of functions to set & get the matrix object and its inverse

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y){
                x <<- y
                m <<- NULL
        }
        get <- function () x
        setinverse <- function (inverseM) m <<- inverseM
        getinverse <- function () m
        list (set=set, get=get, setinverse=setinverse, getinverse=getinverse)
        
}


## This function accepts a list and returns the inverse of a matrix from cache or by calling solve method.


cacheSolve <- function(x,...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinverse()
        if(!is.null(m)){
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data)
        x$setinverse(m)
        m
}
