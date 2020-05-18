# Script file for plot1.png

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

# Convert the Date and Time variables to Date/Time classes
powerDT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Using data from the dates 2007-02-01 and 2007-02-02
powerDT <- powerDT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

# Set file name as plot1.png, and specify its dimensions
png("plot1.png", width=480, height=480)

# Plot histrogram
hist(powerDT[, Global_active_power], main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Close
dev.off()