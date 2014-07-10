## Coursera Exploratory Data Analysis
## Course Project 1
## Plot 4
# Original data source:
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

# NOTE: This code assumes you have downloaded and extracted the raw data into your working directory.
# Read the data:
directory <- getwd()
data <- read.csv(file.path(directory, "household_power_consumption.txt"), header = TRUE, sep=";",
                 na.strings = "?",
                 colClasses = c(rep("character", 2), rep("numeric", 7)))

# Get correct datetime data type and subset on the desired date range.
# The date range is: February 1 to February 2, 2007.
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data <- data[as.Date(data$DateTime) == as.Date("2007-02-01") | as.Date(data$DateTime) == as.Date("2007-02-02"), ]
data$Day <- weekdays(data$DateTime)

# Create the fourth plot
dev.off()
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2, 2))

## subplot 1
with(data, plot(x = DateTime, y = Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

## subplot 2
with(data, plot(x = DateTime, y = Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

## subplot 3
with(data, plot(x = DateTime, y = Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(data, lines(x = DateTime, y = Sub_metering_2, col = "red"))
with(data, lines(x = DateTime, y = Sub_metering_3, col = "blue"))
legend("topright", col = c("black", "red", "blue"), legend = colnames(data)[7:9], lwd = 1, bty = "n", cex = .95)

## subplot 4
with(data, plot(x = DateTime, y = Global_reactive_power, type = "s", xlab = "datetime", ylab = "Global_reactive_power"))

# Save the plot as plot4.png to the working directory.
dev.off()