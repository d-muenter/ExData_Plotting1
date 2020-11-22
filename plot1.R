## read in data
data <- read.table("household_power_consumption.txt", header = TRUE, 
                   na.strings = "?", sep = ";")
## subset data from relevant dates
data <- rbind(subset(data, Date == "1/2/2007"), subset(data, Date == "2/2/2007"))

## create plot
hist(data$Global_active_power, main = "Global Active Power", col = "red", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

## save plot to a png file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
