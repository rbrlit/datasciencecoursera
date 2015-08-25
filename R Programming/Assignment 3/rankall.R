rankall <- function(outcome, num = "best"){
	if (outcome == "heart attack") outcome <- 11
	else if (outcome == "heart failure") outcome <- 17
	else if (outcome == "pneumonia") outcome <- 23
	else stop("invalid outcome")
	data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
	d <- data[is.na(as.numeric(data[ ,outcome])) == FALSE , c(2, 7, outcome)]
	names(d) <- c("hospital", "state", "rate")
	r <- function(dataset){
		rank <- num
		dataset <- dataset[order(as.numeric(dataset[ , 3]), dataset[ , 1]), ]
		if (rank == "best") head(dataset[,1:2], 1)
		else if (rank == "worst") tail(dataset[,1:2], 1)
		else if (is.numeric(rank) == TRUE) dataset[rank, 1:2]
		else stop("invalid rank")
	}
	as.data.frame(t(sapply(split(d, d[ , 2]), r)))
}