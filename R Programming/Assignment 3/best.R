best <- function(state, outcome){
	data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
	if (state %in% data[ , 7]){
		if (outcome == "heart attack") outcome <- 11
		else if (outcome == "heart failure") outcome <- 17
		else if (outcome == "pneumonia") outcome <- 23
		else stop("invalid outcome")
		d <- subset(data, data[ , 7] == state)
		as.character(head(d[order(as.numeric(d[,outcome]),d[,2]), 2],1))
	} else stop("invalid state")
}