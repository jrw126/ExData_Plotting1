## Coursera Exploratory Data Analysis
## Course Project 1
## Plot 1
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

# Create the first plot
dev.off()
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(data$Global_active_power, col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency")

# Save the plot as plot1.png to the working directory.
dev.off()
