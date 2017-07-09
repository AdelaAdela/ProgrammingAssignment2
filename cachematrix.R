## Matrix inversion is usually a costly computation and there may be some
## benefit to caching the inverse of a matrix rather than compute it 
## repeatedly.


## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {

}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
makeCacheMatrix <- function(x = matrix()) {

    inv <- NULL

    set <- function(y) {

        x <<- y

        inv <<- NULL

    }

    get <- function() x

    setinverse <- function(inverse) inv <<- inverse

    getinverse <- function() inv

    list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)

}

cacheSolve <- function(x, ...) {

    inv <- x$getinverse()

    if(!is.null(inv)) {

        message("getting cached data.")

        return(inv)

    }

    data <- x$get()

    inv <- solve(data)

    x$setinverse(inv)

    inv

}



## testing the functions:

x = rbind(c(4, -16/8), c(-16/4, 8))

m = makeCacheMatrix(x)

m$get()

## returns the following: 

> m$get()
     [,1] [,2]
[1,]    4   -2
[2,]   -4    8
> 
> cacheSolve(m)
          [,1]       [,2]
[1,] 0.3333333 0.08333333
[2,] 0.1666667 0.16666667
> cacheSolve(m)
getting cached data.
          [,1]       [,2]
[1,] 0.3333333 0.08333333
[2,] 0.1666667 0.16666667 

