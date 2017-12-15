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
plot(date_time,ds_1$Sub_metering_1, type="l", ylab="Energy sub metering",
     xlab="", ylim=c(0,40))
lines(date_time,ds_1$Sub_metering_2, type="l", col="red")
lines(date_time,ds_1$Sub_metering_3, type="l", col="blue")
legend("topright",border=black,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1), col=c("black","red","blue"))
## Copy my plot to a PNG file
dev.copy(png, file = "plot3.png")
dev.off()
