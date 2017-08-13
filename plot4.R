library(readr)

intera <- read_delim("~/Desktop/R-Programming/Exploratory Data Analysis/Week 1/household_power_consumption.txt", 
                     ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y")), 
                     trim_ws = TRUE)

dati <- subset(intera, Date == "2007-02-01" | Date == "2007-02-02")

png(file="plot4.png")

par(mfrow = c(2, 2))

plot( as.POSIXct(paste(dati$Date, dati$Time)), dati$Global_active_power, type="l", col = "black", xlab="", ylab = "Global Active Power")

plot( as.POSIXct(paste(dati$Date, dati$Time)), dati$Voltage, type="l", col = "black", xlab="datetime", ylab = "Voltage")

with(dati, {
  plot( as.POSIXct(paste(Date, Time)), Sub_metering_1, type="n", xlab="", ylab="Energy sub metering" )
  lines( as.POSIXct(paste(Date, Time)), Sub_metering_1, col="black")
  lines( as.POSIXct(paste(Date, Time)), Sub_metering_2, col="red")
  lines( as.POSIXct(paste(Date, Time)), Sub_metering_3, col="blue" )
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=c(1,1,1), bty = "n")
})

plot( as.POSIXct(paste(dati$Date, dati$Time)), dati$Global_reactive_power, type="l", col = "black", xlab="datetime", ylab="Global_reactive_power")

dev.off()