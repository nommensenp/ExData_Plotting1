#
# Code for the Course project week 1 Plot 4
# as part of the Coursera course Exploratory Data Ananlysis
#
# P.A. Nommensen
# 2014-05-09
#

Sys.setlocale(category = "LC_ALL", locale = "C")

# load data
dirname  <- "./data/exdata_data_household_power_consumption"
filename <- paste(dirname, "household_power_consumption.txt", sep="/")
hsp <- read.table(filename, header=TRUE, sep=";", na.strings = "?")

hsp <- transform(hsp, Date=as.Date(Date, format="%d/%m/%Y"), 
                 Time=strptime(paste(Date, Time), format='%d/%m/%Y %H:%M:%S'))

# select valid dates
selDates <- as.Date(c("2007-02-01", "2007-02-02"))
hspSub <- subset(hsp, Date %in% selDates)

# plot Plot 4

png(filename = "figures/plot4.png", width = 480, height = 480)

par(mfrow=c(2,2), mar = c(4,4,2,1))

#subplot 1
plot(hspSub$Time, hspSub$Global_active_power,
     type="l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     cex.lab=0.8,
     cex.axis = 0.8
)

#subplot 2
plot(hspSub$Time, hspSub$Voltage,
     type="l",
     xlab = "datetime",
     ylab = "Voltage",
     cex.lab=0.8,
     cex.axis = 0.8
)

#subplot 3
plot(hspSub$Time, hspSub$Sub_metering_1,
     type="l",
     col = "black",
     xlab = "",
     ylab = "Energy sub metering",
     cex.lab=0.8,
     cex.axis = 0.8
)

lines(hspSub$Time, hspSub$Sub_metering_2, col = "red")
lines(hspSub$Time, hspSub$Sub_metering_3, col = "blue")

legend("topright" , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_1"), 
       col = c("black", "red", "blue"),
       lty  = "solid", 
       cex  = 0.8)

#subplot 4
plot(hspSub$Time, hspSub$Global_reactive_power,
     type="l",
     xlab = "datetime",
     ylab = "Global_reactive_power",
     cex.lab=0.8,
     cex.axis = 0.8
)
dev.off()