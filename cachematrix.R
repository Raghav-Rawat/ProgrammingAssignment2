setwd('C:/Users/Acer/Downloads/ProgrammingAssignment2-master')
##
## makeCacheMatrix function creates a special "matrix" object that is able to
## cache its inverse for the input which is an invertible square matrix

makeCacheMatrix <- function(x = matrix(sample(1:100,9),3,3)) {
  s <- NULL
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  get <- function() x
  setInverse <- function(solve) s <<- solve
  getInverse <- function() s
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}
##
## cacheSolve function computes the inverse of the special "matrix" which is 
## returned by makeCacheMatrix above. 
##If the inverse has already been calculated then the cachesolve should retrieve the
## inverse from the cache
cacheSolve <- function(x, ...) {
  s <- x$getInverse()
  if(!is.null(s)) {
    message("getting inversed matrix")
    return(s)
  }
  data <- x$get()