complete <- function(directory, id = 1:332){
  data.import <- NULL
  output <- data.frame(id = 1, nobs = 1)
  j <- 1
  for (i in id){
    filename <- paste(directory, "/", sprintf("%03d", i), ".csv", sep = "")
    data.import <- read.csv(filename)
    output[j, 1] <- i
    output[j, 2] <- sum(complete.cases(data.import))
    j <- j + 1
  }
  output
}