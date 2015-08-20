makeCacheMatrix <- function(mat = matrix()){
        inv <<- NULL
        get <- function() mat
        save.inverted <- function(x) inv <<- x
        get.inverted <- function() inv
        list(get = get, save.inverted = save.inverted, get.inverted = get.inverted)
}