## subset data from relevant dates
data <- rbind(subset(data, Date == "1/2/2007"), subset(data, Date == "2/2/2007"))

## format Date column and paste Date and Time column together
library(lubridate)
data$Date <- dmy(data$Date)
data$Date <- as.character(data$Date)
data$Date <- paste(data$Date, data$Time)
data$Date <- strptime(data$Date, "%Y-%m-%d %H:%M:%S")
names(data)[1] <- "Date_and_time"

## create plots
## "Do", "Fr" and "Sa" are the German abbreviations for those weekdays
## (I think I would have needed to change my computer's system language in order
## for the plot to look exactly like the one shown in the instructions)
par(mfrow = c(2,2))
plot(data$Date_and_time, data$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power")
plot(data$Date_and_time, data$Voltage, type = "l", xlab = "datetime", 
     ylab = "Voltage")
plot(data$Date_and_time, data$Sub_metering_1, type = "l", xlab = "", 
     ylab = "Energy sub metering")
lines(data$Date_and_time, data$Sub_metering_2, col = "red")
lines(data$Date_and_time, data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       bty = "n")
plot(data$Date_and_time, data$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")

## save plot to a png file
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
