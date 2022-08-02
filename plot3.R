#Loading the data

data <- read.csv("~/Exploratory-Data-Analysis---Week-1-Project/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)

#Inspect the data

head(data)
attach(data) #Insted of data$Column, we can only write Column 

#We are going to create the histogram of Global Active Power for the dates between 2007-02-01 and 2007-02-02. 

library(dplyr)
library(lubridate)

#Now, we need to take times into the consideration. Therefore, we create the new column in which we store the date and time as a date format

data$date_time <- ymd_hms(paste(data$Date, data$Time)) #Convert strings into Dates and times
restricted_dates <-  data[data$Date >= ymd("2007-02-01") & Date <= ymd("2007-02-02"), ] #Retrtict the dates
restricted_dates$Global_active_power <- as.numeric(restricted_dates$Global_active_power) #Converting strings into numerics

png("plot3.png")
plot(restricted_dates$date_time, restricted_dates$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
lines(restricted_dates$date_time, restricted_dates$Sub_metering_1)
lines(restricted_dates$date_time, restricted_dates$Sub_metering_2, col = "red")
lines(restricted_dates$date_time, restricted_dates$Sub_metering_3, col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty = 1)


dev.off()
