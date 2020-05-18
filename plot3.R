# Script file for plot3.png

# Include package data.table
library("data.table")

# Set working directory
setwd("C:/Users/Anonymous/Desktop/coursera/Exploratory_Data_Analysis_Project_1/Exploratory_Data_Analysis_Project_1")

# Reading data.
# Data missing code is coded as '?'
# Set na.strings command to '?'
powerDT <- fread(input = "household_power_consumption.txt", na.strings = "?")

# Set as.numeric
powerDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Making a POSIXct date capable of being filtered and plotted by time of day
powerDT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Using data from the dates 2007-02-01 and 2007-02-02
powerDT <- powerDT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

# Set file name as plot3.png, and specify its dimensions
png("plot3.png", width=480, height=480)

# Plot graph
plot(powerDT[, dateTime], powerDT[, Sub_metering_1], type = "l", xlab = "", ylab = "Energy sub metering")
lines(powerDT[, dateTime], powerDT[, Sub_metering_2], col = "red")
lines(powerDT[, dateTime], powerDT[, Sub_metering_3], col = "blue")
legend("topright", col = c("black","red","blue"), c("Sub_metering_1  ", "Sub_metering_2  ", "Sub_metering_3  "), lty = c(1,1), lwd = c(1,1))

# Close
dev.off()