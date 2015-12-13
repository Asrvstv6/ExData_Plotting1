## PLOT 4
library(lubridate)
library(dplyr)
dataFile = "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data$Date <- dmy(data$Date)
data$Date <- ymd(data$Date)
date1 = as.POSIXct("2007-02-01", tz="UTC")
date2 = as.POSIXct("2007-02-02", tz="UTC")
plot2 <- data[(data$Date == date1) | (data$Date == date2),]

Final_Data <- plot2
Final_Data <- mutate(Final_Data, Week = weekdays(Date))
Final_Data <- mutate(Final_Data, Week_Time = paste(Date, Time, sep =" "))
Final_Data$Week_Time <- ymd_hms(Final_Data$Week_Time)

png(filename = "Plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(Final_Data$Week_Time, Final_Data$Global_active_power, type="l", ylab = "Global Active Power", xlab=" ")
plot(Final_Data$Week_Time, Final_Data$Voltage, type="l", ylab = "Voltage", xlab="datetime")

plot(Final_Data$Week_Time, Final_Data$Sub_metering_1, type="l", xlab = " ", ylab = "Energy sub metering")
lines(Final_Data$Week_Time, Final_Data$Sub_metering_2, col="red")
lines(Final_Data$Week_Time, Final_Data$Sub_metering_3, col="blue")
legend('topright', legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"),lty=1,box.lty=0)

plot(Final_Data$Week_Time, Final_Data$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")
dev.off()



