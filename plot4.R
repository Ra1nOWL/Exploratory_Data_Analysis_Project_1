# Script file for plot4.png

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

# Set file name as plot4.png, and specify its dimensions
png("plot4.png", width=480, height=480)

# Create 2-by-2 graph layout
par(mfrow=c(2,2))

# Plot first graph
plot(powerDT[, dateTime], powerDT[, Global_active_power], type = "l", xlab = "", ylab = "Global Active Power")

# Plot second graph
plot(powerDT[, dateTime],powerDT[, Voltage], type = "l", xlab = "datetime", ylab = "Voltage")

# Plot third graph
plot(powerDT[, dateTime], powerDT[, Sub_metering_1], type = "l", xlab = "", ylab = "Energy sub metering")
lines(powerDT[, dateTime], powerDT[, Sub_metering_2], col = "red")
lines(powerDT[, dateTime], powerDT[, Sub_metering_3],col = "blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "), lty = c(1,1), bty = "n", cex = 0.5) 

# Plot fourth graph
plot(powerDT[, dateTime], powerDT[,Global_reactive_power], type = "l", xlab = "datetime", ylab = "Global_reactive_power")

# Close
dev.off()