## read the data file, assuming it's in the working repo
d <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")  

## convert the date in a better format and filter to the relevant range
library(dplyr)
library(lubridate)

d$FullTime <- dmy_hms(paste(d$Date,d$Time,sep=" "))
d$NewDate <- as.Date(d$Date,format="%d/%m/%Y")
d <- filter(d,(d$NewDate<="2007-02-02")&(d$NewDate>="2007-02-01"))

## convert the relevant variable in a numeric value
d$Global_active_power <- as.numeric(as.character(d$Global_active_power))

## prepare the diagram
plot(d$FullTime,d$Global_active_power,type="l",xlab = "",ylab = "Global Active Power (kilowatts)")

## save the diagram in the working repo
dev.copy(png,'Plot2.png')
dev.off()
