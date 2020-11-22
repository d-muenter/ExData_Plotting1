## read in data
data <- read.table("household_power_consumption.txt", header = TRUE, 
                   na.strings = "?", sep = ";")
## subset data from relevant dates
data <- rbind(subset(data, Date == "1/2/2007"), subset(data, Date == "2/2/2007"))

## format Date column and paste Date and Time column together
library(lubridate)
data$Date <- dmy(data$Date)
data$Date <- as.character(data$Date)
data$Date <- paste(data$Date, data$Time)
data$Date <- strptime(data$Date, "%Y-%m-%d %H:%M:%S")
names(data)[1] <- "Date_and_time"

## create plot
## "Do", "Fr" and "Sa" are the German abbreviations for those weekdays
## (I think I would have needed to change my computer's system language in order
## for the plot to look exactly like the one shown in the instructions)
plot(data$Date_and_time, data$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")

## save plot to a png file
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
