## read the data file, assuming it's in the working repo
d <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")  

## convert the date in a better format and filter to the relevant range
library(dplyr)
d <- mutate(d,Date=as.Date(d$Date,format="%d/%m/%Y"))
d <- filter(d,(d$Date<="2007-02-02")&(d$Date>="2007-02-01"))

## convert the relevant variable in a numeric value
d <- mutate(d,Global_active_power=as.numeric(as.character(d$Global_active_power)))

## prepare the diagram
hist(d$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

## save the diagram in the working repo
dev.copy(png,'Plot1.png')
dev.off()

