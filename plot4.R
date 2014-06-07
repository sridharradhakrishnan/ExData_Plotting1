plot4 <- function() {
  data <- read.table("./household_power_consumption.txt", skip = 66637, nrow = 2880, sep = ";", colClasses="character",
                     col.names = colnames(read.table("./household_power_consumption.txt",nrow = 1, header = TRUE, sep=";")))
  for(i in 3:9){
    data[, i] <- as.numeric(data[, i])
  }
  for( i in 1:2) {
    data[, i] <- as.character(data[, i])
  }
  wDays <- strptime(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S')
  par(mfcol=c(2,2))
  plot2()
  plot3()
  plot(wDays, data$Voltage, type="l", xlab="", ylab="Voltage")
  plot(wDays, data$Global_reactive_power, type="l", xlab="", ylab="Global_reactive_power")
  dev.copy(png,file="./plot4.png",height=480,width=480)
  dev.off()
}