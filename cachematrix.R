## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## --- My comments ---
## This function creates a list of functions that can be called in order to store the original matrix, get it, store its inverse and get this inverse.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get,
      setinverse = setinverse,
      getinverse = getinverse)
}


## Write a short comment describing this function

## --- My comments ---
## First, if the inverse is already there, it is returned. Otherwise, we call the functions in the x list to get the matrix and set its inverse.

cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached inverse matrix")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
  ## Return a matrix that is the inverse of 'x'
}