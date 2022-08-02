#Loading the data

data <- read.csv("~/Exploratory-Data-Analysis---Week-1-Project/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)

#Inspect the data

head(data)
attach(data) #Insted of data$Column, we can only write Column 

#We are going to create the histogram of Global Active Power for the dates between 2007-02-01 and 2007-02-02. 

library(dplyr)
library(lubridate)

data$Date <- dmy(data$Date) #Convert strings into Dates
restricted_dates <-  data[data$Date >= ymd("2007-02-01") & Date <= ymd("2007-02-02"), ] #Retrtict the dates
restricted_dates$Global_active_power <- as.numeric(restricted_dates$Global_active_power) #Converting strings into numerics

par(pty = "s") #set the squared plot
png("plot1.png") #prepare the file
hist(restricted_dates$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()


