#
# Code for the Course project week 1 Plot 3
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

# plot Plot 3

png(filename = "figures/plot3.png", width = 480, height = 480)
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
dev.off()