## read the data file, assuming it's in the working repo
d <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")  

## convert the date in a better format and filter to the relevant range
library(dplyr)
library(lubridate)

d$FullTime <- dmy_hms(paste(d$Date,d$Time,sep=" "))
d$NewDate <- as.Date(d$Date,format="%d/%m/%Y")
d <- filter(d,(d$NewDate<="2007-02-02")&(d$NewDate>="2007-02-01"))

## prepare the multi-diagram layout
par(mfrow=c(2,2))

## plot#1
## convert the relevant variable in a numeric value
d$Global_active_power <- as.numeric(as.character(d$Global_active_power))

## prepare the diagram
plot(d$FullTime,d$Global_active_power,type="l",xlab = "",ylab = "Global Active Power")

## plot#2
## convert the relevant variable in a numeric value
d$Voltage <- as.numeric(as.character(d$Voltage))

## prepare the diagram
plot(d$FullTime,d$Voltage,type="l",xlab = "datetime",ylab = "Voltage")

## plot#3
## convert the relevant variables in numeric values
d$Sub_metering_1 <- as.numeric(as.character(d$Sub_metering_1))
d$Sub_metering_2 <- as.numeric(as.character(d$Sub_metering_2))

## prepare the diagram
plot(d$FullTime,d$Sub_metering_1,type="l",col="black",xlab = "",ylab ="Energy sub metering")
lines(d$FullTime,d$Sub_metering_2,col="red")
lines(d$FullTime,d$Sub_metering_3,col="blue")
legend("topright",bty = "n", lty = c(1,1,1), col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## plot#4
## convert the relevant variable in a numeric value
d$Global_reactive_power <- as.numeric(as.character(d$Global_reactive_power))

## prepare the diagram
plot(d$FullTime,d$Global_reactive_power,type="l",xlab = "datetime",ylab = "Global_reactive_power")

## save the diagram in the working repo
dev.copy(png,'Plot4.png')
dev.off()


