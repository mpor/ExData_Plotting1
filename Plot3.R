## read the data file, assuming it's in the working repo
d <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")  

## convert the date in a better format and filter to the relevant range
library(dplyr)
library(lubridate)

d$FullTime <- dmy_hms(paste(d$Date,d$Time,sep=" "))
d$NewDate <- as.Date(d$Date,format="%d/%m/%Y")
d <- filter(d,(d$NewDate<="2007-02-02")&(d$NewDate>="2007-02-01"))

## convert the relevant variables in numeric values
d$Sub_metering_1 <- as.numeric(as.character(d$Sub_metering_1))
d$Sub_metering_2 <- as.numeric(as.character(d$Sub_metering_2))

## prepare the diagram
plot(d$FullTime,d$Sub_metering_1,type="l",col="black",xlab = "",ylab ="Energy sub metering")
lines(d$FullTime,d$Sub_metering_2,col="red")
lines(d$FullTime,d$Sub_metering_3,col="blue")
legend("topright",lty = c(1,1,1), col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.7)

## save the diagram in the working repo
dev.copy(png,'Plot3.png')
dev.off()
