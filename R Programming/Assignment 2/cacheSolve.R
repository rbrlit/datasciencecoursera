cacheSolve <- function(x, ...){
        inv <- x$get.inverted()
        if (!is.null(inv)){
                message("Getting cached matrix")
                return(inv)
        }
        mat <- x$get()
        inv <- solve(mat)
        x$save.inverted(inv)
        inv
}