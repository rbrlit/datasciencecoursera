corr <- function(directory, threshold = 0){
 j <- 1
 output <- c()
 for (i in 1:332){
   filename <- paste(directory, "/", sprintf("%03d", i), ".csv", sep = "")
   data.import <- read.csv(filename)
   if(sum(complete.cases(data.import)) > threshold){
     good <- complete.cases(data.import)
     c <- cor(data.import[good ,"sulfate"],data.import[good, "nitrate"])
     output[j] <- c
     j <- j + 1
   } else {
     next
   }
 }
 output
}