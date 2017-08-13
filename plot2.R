library(readr)

intera <- read_delim("~/Desktop/R-Programming/Exploratory Data Analysis/Week 1/household_power_consumption.txt", 
                     ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y")), 
                     trim_ws = TRUE)

dati <- subset(intera, Date == "2007-02-01" | Date == "2007-02-02")

png(file="plot2.png")
plot(as.POSIXct(paste(dati$Date, dati$Time)), dati$Global_active_power, type="l", xlab="", main="", ylab="Global Active Power (kilowatts)")
dev.off()