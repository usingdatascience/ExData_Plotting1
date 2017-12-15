# read in data from text file
ds <- read.delim(file="household_power_consumption.txt", header=TRUE, sep=";")
# get subset of data, for just dates of 01/02/2007 and 02/02/2007
ds_1 <- subset(ds, as.Date(ds$Date, "%d/%m/%Y") == "2007-02-01" | 
                 as.Date(ds$Date, "%d/%m/%Y") == "2007-02-02")
# convert the Date column to a date
ds_1$Date <- as.Date(ds_1$Date, "%d/%m/%Y")
# check summary of data, to make sure subset looks correct etc
summary(ds_1)
date_time <- as.POSIXct(paste(ds_1$Date, ds_1$Time), format="%Y-%m-%d %H:%M:%S")
par(mfrow = c(2,2))
plot(date_time,as.numeric(as.character(ds_1$Global_active_power)), type="l", ylab="Global Active Power",
     xlab="",cex.axis=0.75, cex.lab=0.75)
plot(date_time,as.numeric(as.character(ds_1$Voltage)), type="l", ylab="Voltage",
     xlab="datetime", cex.axis=0.75, cex.lab=0.75)
plot(date_time,ds_1$Sub_metering_1, type="l", ylab="Energy sub metering",
     xlab="", ylim=c(0,40),cex.axis=0.75, cex.lab=0.75)
lines(date_time,ds_1$Sub_metering_2, type="l", col="red")
lines(date_time,ds_1$Sub_metering_3, type="l", col="blue")
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1), col=c("black","red","blue"),cex=0.6)
plot(date_time,as.numeric(as.character(ds_1$Global_reactive_power)), type="l", ylab="Global_reactive_power",
     xlab="datetime", cex.axis=0.75, cex.lab=0.75)
## Copy my plot to a PNG file
dev.copy(png, file = "plot4.png",width=600, height=600)
dev.off()