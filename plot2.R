# Script file for plot2.png

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

# Set file name as plot2.png, and specify its dimensions
png("plot2.png", width=480, height=480)

# Plot graph
plot(x = powerDT[, dateTime], y = powerDT[, Global_active_power], type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# Close
dev.off()