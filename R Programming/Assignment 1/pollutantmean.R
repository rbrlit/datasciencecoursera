pollutantmean <- function(pollutant, id){
  for (i in id){
    filename <- paste("specdata/", sprintf("%03d", i), ".csv", sep = "")
    data.import <- read.csv(filename)
    ## merged <- merge(merged, data.import)
  }
  mean(data.import[ , pollutant], na.rm = T)
}