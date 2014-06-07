plot1 <- function () {
  # read the data skip rows based on the dates given in the assignment
  data <- read.table("./household_power_consumption.txt", skip = 66637, nrow = 2880, sep = ";", colClasses="character",
                   col.names = colnames(read.table("./household_power_consumption.txt",nrow = 1, header = TRUE, sep=";")))
  # get data from the appropriate columns
  for(i in 3:9){
    data[, i] <- as.numeric(data[, i])
  }
  for( i in 1:2) {
    data[, i] <- as.character(data[, i])
  }
  # draw the histogram
  hist(data[,3],main="Global Active Power", xlab="Global Acive Power (kilowatts)",col="RED")
  dev.copy(png,file="./plot1.png",height=480,width=480)
  dev.off()
}