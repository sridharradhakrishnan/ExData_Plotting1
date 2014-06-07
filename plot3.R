plot3 <- function()
{
  data <- read.table("./household_power_consumption.txt", skip = 66637, nrow = 2880, sep = ";", colClasses="character",
                     col.names = colnames(read.table("./household_power_consumption.txt",nrow = 1, header = TRUE, sep=";")))
  for(i in 3:9){
    data[, i] <- as.numeric(data[, i])
  }
  for( i in 1:2) {
    data[, i] <- as.character(data[, i])
  }
  wDays <- strptime(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S')
  plot(wDays, data$Sub_metering_1, type="l", xlab="",ylab="Energy sub metering") 
  lines(wDays, data$Sub_metering_2, type="l", xlab="",ylab="", col="RED")
  lines(wDays, data$Sub_metering_3, type="l", xlab="",ylab="", col="BLUE")
  legend("topright",c("Sub_metering_1","Sub_metering_2 ","Sub_metering_3"), cex=0.5, lty=c(1,1), lwd=c(1,1), col=c("black","red","blue"))
  dev.copy(png,file="./plot3.png",height=480,width=480)
  dev.off()
}