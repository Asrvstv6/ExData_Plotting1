##PLOT 1

library(lubridate)
dataFile = "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data$Date <- dmy(data$Date)
data$Date <- ymd(data$Date)
date1 = as.POSIXct("2007-02-01", tz="UTC")
date2 = as.POSIXct("2007-02-02", tz="UTC")
plot1 <- data[(data$Date == date1) | (data$Date == date2),]
png(filename = "Plot1.png", width = 480, height = 480)
hist(as.numeric(plot1$Global_active_power), xlab= "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col="red")
dev.off()
