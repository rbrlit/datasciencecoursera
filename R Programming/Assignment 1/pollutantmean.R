pollutantmean <- function(directory, pollutant, id = 1:332){
  data.import <- NULL
  merged <- NULL
  for (i in id){
    filename <- paste(directory, "/", sprintf("%03d", i), ".csv", sep = "")
    data.import <- read.csv(filename)
    merged <- rbind(merged, data.import)
  }
  mean(merged[ , pollutant], na.rm = T)
}