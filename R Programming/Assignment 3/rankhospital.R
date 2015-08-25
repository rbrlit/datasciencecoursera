rankhospital <- function(state, outcome, num = "best"){
	data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
	if (state %in% data[ , 7]){
		if (outcome == "heart attack") outcome <- 11
		else if (outcome == "heart failure") outcome <- 17
		else if (outcome == "pneumonia") outcome <- 23
		else stop("invalid outcome")
		d <- data[data[,7] == state, c(2, outcome)]
		d <- d[is.na(as.numeric(d[,2])) == FALSE,]
		d <- d[order(as.numeric(d[,2]), d[,1]),]
		d <- cbind(d,1:nrow(d))
		names(d) <- c("Hospital.Name", "Rate", "Rank")
		if (num == "best") head(d[,1], 1)
		else if (num == "worst") tail(d[,1], 1)
		else if (is.numeric(num) == TRUE) d[num,1]
		else stop("invalid rank")
	} else stop("invalid state")
}