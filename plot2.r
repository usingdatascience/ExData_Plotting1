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
plot(date_time,as.numeric(as.character(ds_1$Global_active_power)), type="l", ylab="Global Active Power (kilowatts)",
     xlab="")
## Copy my plot to a PNG file
dev.copy(png, file = "plot2.png")
dev.off()